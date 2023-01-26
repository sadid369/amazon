import 'package:amazon/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopButton extends ConsumerWidget {
  const TopButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: 'Your Orders', onTap: () {}),
            AccountButton(text: 'Turn Seller', onTap: () {}),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(text: 'Log out', onTap: () {}),
            AccountButton(text: 'Your Wish List', onTap: () {}),
          ],
        ),
      ],
    );
  }
}
