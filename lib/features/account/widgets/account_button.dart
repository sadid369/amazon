import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountButton extends ConsumerWidget {
  final String text;
  final VoidCallback onTap;
  const AccountButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.0),
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: OutlinedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black12.withOpacity(0.03),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                )),
            onPressed: onTap,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            )),
      ),
    );
  }
}
