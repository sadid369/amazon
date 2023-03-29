// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:amazon/common/widgets/bottom_bar.dart';
import 'package:amazon/constants/error_handling.dart';
import 'package:amazon/constants/global_verables.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/features/home/screens/home_screen.dart';
import 'package:amazon/models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final userProvider = StateProvider<User?>((ref) {
  return null;
});
final userProviderFuture =
    FutureProvider<User?>((ref) => ref.watch(userProvider));
final authServiceProvider = StateNotifierProvider<AuthService, User?>((ref) {
  return AuthService(ref: ref);
});

class AuthService extends StateNotifier<User?> {
  final Ref _ref;
  AuthService({required Ref ref})
      : _ref = ref,
        super(null);
  Future<void> signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    print('signup');
    try {
      User user = User(
        id: "",
        name: name,
        email: email,
        password: password,
        address: "",
        type: "",
        token: "",
      );
      print(user.toJson());
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            "Account created! Login with the same credentials!",
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        id: "",
        name: "",
        email: email,
        password: password,
        address: "",
        type: "",
        token: "",
      );
      http.Response res = await http.post(
        Uri.parse("$uri/api/signin"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            _ref
                .read(userProvider.notifier)
                .update((state) => User.fromJson(res.body));
            await sharedPreferences.setString(
                "x-auth-token", jsonDecode(res.body)['token']);

            Navigator.pushNamedAndRemoveUntil(
              context,
              BottomBar.routeName,
              (route) => false,
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> getUserData(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      String? token = sharedPreferences.getString('x-auth-token');
      if (token == null) {
        sharedPreferences.setString("x-auth-token", '');
      }
      var tokenRes = await http
          .post(Uri.parse('$uri/tokenIsValid'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "x-auth-token": token!,
      });
      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "x-auth-token": token,
          },
        );
        state = User.fromJson(userRes.body);
        _ref
            .read(userProvider.notifier)
            .update((state) => User.fromJson(userRes.body));
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
