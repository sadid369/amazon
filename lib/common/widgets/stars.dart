import 'package:amazon/constants/global_verables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Stars extends ConsumerStatefulWidget {
  final double rating;
  const Stars({
    required this.rating,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StarsState();
}

class _StarsState extends ConsumerState<Stars> {
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      itemCount: 5,
      rating: widget.rating,
      itemSize: 15,
      itemBuilder: (context, index) {
        return const Icon(
          Icons.star,
          color: GlobalVariables.secondaryColor,
        );
      },
    );
  }
}
