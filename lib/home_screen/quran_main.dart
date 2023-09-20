import 'package:flutter/material.dart';
import 'package:islami/home_screen/hadeth/hadeth_tap.dart';
import 'package:islami/home_screen/quran/quran_tap.dart';
import 'package:islami/home_screen/radio/radio_tap.dart';
import 'package:islami/home_screen/tasbeh/tasbeh_tap.dart';

class QuranMainScreen extends StatefulWidget {
  static const String RouteName = 'QuranMainScreen';

  @override
  State<QuranMainScreen> createState() => _QuranMainScreenState();
}

class _QuranMainScreenState extends State<QuranMainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/bg3.png',
            fit: BoxFit.fill, width: double.infinity, height: double.infinity),
        Scaffold(
          appBar: AppBar(
              title: Text(
            'Islami',
            style: Theme.of(context).textTheme.titleLarge,
          )),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (value) {
                  selectedIndex = value;

                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage('assets/images/icon_quran.png')),
                      label: ('Quran')),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                          AssetImage('assets/images/icon_hadeth.png')),
                      label: 'Hadeth'),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                      label: 'Sebha'),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage('assets/images/icon_radio.png')),
                      label: 'Radio')
                ]),
          ),
          body: tabs[
              selectedIndex] //body goes to tabs list using the selected index
          ,
        )
      ],
    );
  }

  List<Widget> tabs = [QuranTap(), HadethTap(), TasbehTap(), RadioTap()];
}
