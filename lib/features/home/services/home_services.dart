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
    StateNotifierProvider<HomeServices, List<Product>?>(
        (ref) => HomeServices());

class HomeServices extends StateNotifier<List<Product>?> {
  HomeServices() : super(null);
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
    state = productList;

    return productList;
  }
}
