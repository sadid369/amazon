import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DealOfTheDay extends ConsumerStatefulWidget {
  const DealOfTheDay({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends ConsumerState<DealOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            'Deal of the day',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Image.network(
          'https://media.istockphoto.com/id/1394988455/photo/laptop-with-a-blank-screen-on-a-white-background.jpg?s=1024x1024&w=is&k=20&c=1JQYD-7e9EfVR4LCekw-NvYxyX23U81k-TRFJ70SXqY=',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          alignment: Alignment.topLeft,
          child: const Text(
            '\$100',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            left: 15,
            top: 5,
            right: 40,
          ),
          child: const Text(
            'Laptop',
            style: TextStyle(),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://media.istockphoto.com/id/1394988455/photo/laptop-with-a-blank-screen-on-a-white-background.jpg?s=1024x1024&w=is&k=20&c=1JQYD-7e9EfVR4LCekw-NvYxyX23U81k-TRFJ70SXqY=',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://media.istockphoto.com/id/1394988455/photo/laptop-with-a-blank-screen-on-a-white-background.jpg?s=1024x1024&w=is&k=20&c=1JQYD-7e9EfVR4LCekw-NvYxyX23U81k-TRFJ70SXqY=',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://media.istockphoto.com/id/1394988455/photo/laptop-with-a-blank-screen-on-a-white-background.jpg?s=1024x1024&w=is&k=20&c=1JQYD-7e9EfVR4LCekw-NvYxyX23U81k-TRFJ70SXqY=',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://media.istockphoto.com/id/1394988455/photo/laptop-with-a-blank-screen-on-a-white-background.jpg?s=1024x1024&w=is&k=20&c=1JQYD-7e9EfVR4LCekw-NvYxyX23U81k-TRFJ70SXqY=',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://media.istockphoto.com/id/1394988455/photo/laptop-with-a-blank-screen-on-a-white-background.jpg?s=1024x1024&w=is&k=20&c=1JQYD-7e9EfVR4LCekw-NvYxyX23U81k-TRFJ70SXqY=',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 15,
            top: 15,
            bottom: 15,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            'See All Deals',
            style: TextStyle(
              color: Colors.cyan[800],
            ),
          ),
        )
      ],
    );
  }
}
