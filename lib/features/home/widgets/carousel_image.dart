import 'package:amazon/constants/global_verables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarouseImage extends ConsumerStatefulWidget {
  const CarouseImage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CarouseImageState();
}

class _CarouseImageState extends ConsumerState<CarouseImage> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((i) {
        return Builder(
          builder: (BuildContext context) => Image.network(
            i,
            fit: BoxFit.cover,
            height: 20,
          ),
        );
      }).toList(),
      options: CarouselOptions(viewportFraction: 1, height: 200),
    );
  }
}
