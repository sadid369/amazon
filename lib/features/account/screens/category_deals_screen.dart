import 'package:amazon/common/widgets/loader.dart';
import 'package:amazon/features/home/services/home_services.dart';
import 'package:amazon/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:amazon/constants/global_verables.dart';

class CategoryDealsScreen extends ConsumerStatefulWidget {
  static const String routeName = 'category-Page';
  final String category;
  const CategoryDealsScreen({
    super.key,
    required this.category,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends ConsumerState<CategoryDealsScreen> {
  List<Product>? productList;
  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  fetchProduct() async {
    productList = await ref
        .read(categoryProductProvider.notifier)
        .fetchCategoryProducts(
            context: context, ref: ref, category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            title: Text(
              widget.category,
              style: const TextStyle(color: Colors.black),
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
          ),
        ),
        body: Text(''));
  }
}
