import 'package:flutter/material.dart';

class RadioTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.06,
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: Image.asset('assets/images/radio.png')),
        Text(
          'Quran Radio',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.07,
              horizontal: MediaQuery.of(context).size.width * 0.06),
          child: Row(
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
          ),
        )
      ],
    );
  }
}
