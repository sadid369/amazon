import 'package:amazon/constants/global_verables.dart';
import 'package:amazon/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BelowAppBar extends ConsumerWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Container(
      decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradient),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Text(
            'Hello, ',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
          Text(
            user!.name,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
