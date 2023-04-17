import 'dart:convert';
import 'package:amazon/constants/error_handling.dart';
import 'package:amazon/constants/global_verables.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amazon/models/product.dart';
import 'package:http/http.dart' as http;

final productDetailServices =
    StateNotifierProvider<ProductDetailsServices, Product?>((ref) {
  return ProductDetailsServices();
});

class ProductDetailsServices extends StateNotifier<Product?> {
  ProductDetailsServices() : super(null);

  void rateProduct({
    required BuildContext context,
    required WidgetRef ref,
    required Product product,
    required double rating,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/rate-product'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': ref.read(userProvider)!.token
          },
          body: jsonEncode({'id': product.id, 'rating': rating}));
      httpErrorHandle(response: res, context: context, onSuccess: () {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
