import 'package:flutter/material.dart';

class RadioTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 100, right: 50, left: 50, bottom: 40),
            child: Image.asset('assets/images/radio.png')),
        Text(
          'اذاعة القرآن الكريم',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.skip_previous,
                size: 40, color: Theme.of(context).primaryColor),
            Icon(Icons.play_arrow_sharp,
                size: 60, color: Theme.of(context).primaryColor),
            Icon(
              Icons.skip_next,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
