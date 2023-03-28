import 'dart:convert';

import 'package:amazon/constants/error_handling.dart';
import 'package:amazon/constants/global_verables.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/features/auth/services/auth_service.dart';
import 'package:amazon/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final categoryProductProvider =
    StateNotifierProvider<HomeServices, bool>((ref) => HomeServices());
// final categoryProductProvider =
//     FutureProvider.family<List<Product>, WidgetRef, BuildContext, String>(
//         (ref, ref, context, category) => ref
//             .read(categoryProductProvider.notifier)
//             .fetchCategoryProducts(
//                 context: context, ref: ref, category: category));
final categoryProductFutureProvider =
    FutureProvider.family<List<Product>, List<dynamic>>((ref, arg) => ref
        .read(categoryProductProvider.notifier)
        .fetchCategoryProducts(context: arg[0], ref: arg[1], category: arg[2]));

class HomeServices extends StateNotifier<bool> {
  HomeServices() : super(false);
  Future<List<Product>> fetchCategoryProducts(
      {required BuildContext context,
      required WidgetRef ref,
      required String category}) async {
    List<Product> productList = [];
    print(category);
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/products?category=$category'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': ref.read(userProvider)!.token
        },
      );
      print(res.body);

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (var i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    return productList;
  }
}
