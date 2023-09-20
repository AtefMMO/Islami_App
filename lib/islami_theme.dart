import 'package:flutter/material.dart';

class IslamiTheme {
  static Color primaryLight = Color(0xffB7935F);
  static Color blackColor = Colors.black;
  static Color whiteColor = Color(0xffffffff);
  static ThemeData lightMode = ThemeData(
      primaryColor: primaryLight,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          color: Colors.transparent, elevation: 0, centerTitle: true),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'El Messiri'),
          titleMedium: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: blackColor),
          titleSmall: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: blackColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: blackColor, unselectedItemColor: whiteColor),
      iconTheme: IconThemeData(size: 30));
}
