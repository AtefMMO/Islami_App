import 'package:flutter/material.dart';
import 'package:islami/home_screen/quran/sura_details_screen.dart';

class QuranText extends StatelessWidget {
  String quranText;
  int index;

  QuranText({required this.quranText, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {
              Navigator.pushNamed(context, SuraDetailsScreen.RouteName,
                  arguments: SuraDetailsArgs(suraName: quranText, index: index))
            },
        child: Text(
          quranText,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ));
  }
}
