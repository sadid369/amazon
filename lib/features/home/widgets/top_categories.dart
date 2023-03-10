import 'package:amazon/constants/global_verables.dart';
import 'package:amazon/features/account/screens/category_deals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopCategory extends ConsumerStatefulWidget {
  const TopCategory({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TopCategoryState();
}

class _TopCategoryState extends ConsumerState<TopCategory> {
  @override
  Widget build(BuildContext context) {
    void navigateToCategoryPage(BuildContext context, String category) {
      Navigator.pushNamed(context, CategoryDealsScreen.routeName,
          arguments: category);
    }

    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: 75,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => navigateToCategoryPage(
                context, GlobalVariables.categoryImages[index]['title']!),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      GlobalVariables.categoryImages[index]['image']!,
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Text(
                  GlobalVariables.categoryImages[index]['title']!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
