import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home_screen/hadeth/hadeth_tap.dart';
import 'package:islami/home_screen/quran/quran_tap.dart';
import 'package:islami/home_screen/radio/radio_tap.dart';
import 'package:islami/home_screen/tasbeh/tasbeh_tap.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/settings/settings_screen.dart';
import 'package:provider/provider.dart';

class QuranMainScreen extends StatefulWidget {
  static const String RouteName = 'QuranMainScreen';

  @override
  State<QuranMainScreen> createState() => _QuranMainScreenState();
}

class _QuranMainScreenState extends State<QuranMainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        Image.asset(
            provider.appTheme == ThemeMode.light
                ? 'assets/images/bg3.png'
                : 'assets/images/bgDark.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity),
        Scaffold(
          appBar: AppBar(
              title: Text(
            AppLocalizations.of(context)!.app_title,
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
                      label: (AppLocalizations.of(context)!.quran)),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                          AssetImage('assets/images/icon_hadeth.png')),
                      label: AppLocalizations.of(context)!.hadeth),
                  BottomNavigationBarItem(
                      icon:
                      ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                      label: AppLocalizations.of(context)!.sebha),
                  BottomNavigationBarItem(
                      icon:
                      ImageIcon(AssetImage('assets/images/icon_radio.png')),
                      label: AppLocalizations.of(context)!.radio),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: AppLocalizations.of(context)!.settings)
                ]),
          ),
          body: tabs[
          selectedIndex] //body goes to tabs list using the selected index
          ,
        )
      ],
    );
  }

  List<Widget> tabs = [
    QuranTap(),
    HadethTap(),
    TasbehTap(),
    RadioTap(),
    SettingsScreen()
  ];
}
