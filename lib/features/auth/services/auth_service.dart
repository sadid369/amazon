import 'package:amazon/constants/error_handling.dart';
import 'package:amazon/constants/global_verables.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final authServiceProvider = StateNotifierProvider<AuthService, bool>((ref) {
  return AuthService();
});

class AuthService extends StateNotifier<bool> {
  AuthService() : super(false);
  void signup({
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
      print('error');
      showSnackBar(context, e.toString());
    }
  }
}
