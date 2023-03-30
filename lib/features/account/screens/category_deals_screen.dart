import 'package:amazon/common/widgets/loader.dart';
import 'package:amazon/features/home/services/home_services.dart';
import 'package:amazon/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    List<Product>? product = ref.watch(categoryProductProvider);
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
        body: product == null
            ? const Loader()
            : Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Keep shopping for ${widget.category}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.only(left: 15),
                      itemCount: product.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.4,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black12,
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.network(
                                      product[index].images[0],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  padding: const EdgeInsets.only(
                                    left: 0,
                                    top: 5,
                                    right: 15,
                                  ),
                                  child: Text(product[index].name),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ));
  }
}
