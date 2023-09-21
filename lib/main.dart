import 'package:flutter/material.dart';
import 'package:islami/home_screen/hadeth/hadeth_content.dart';
import 'package:islami/home_screen/quran/sura_details_screen.dart';
import 'package:islami/home_screen/quran_main.dart';
import 'package:islami/islami_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: QuranMainScreen.RouteName,
      routes: {
        QuranMainScreen.RouteName: (context) => QuranMainScreen(),
        SuraDetailsScreen.RouteName: (context) => SuraDetailsScreen(),
        HadethContent.RouteName: (context) => HadethContent()
      },
      theme: IslamiTheme.lightMode,
    );
  }
}
