import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home_screen/hadeth/hadeth_content.dart';
import 'package:islami/home_screen/quran/sura_details_screen.dart';
import 'package:islami/home_screen/quran_main.dart';
import 'package:islami/islami_theme.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppConfigProvider(
          isdarkTheme: prefs.getBool('isDark')!,
          language: prefs.getString('lang')),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: QuranMainScreen.RouteName,
      routes: {
        QuranMainScreen.RouteName: (context) => QuranMainScreen(),
        SuraDetailsScreen.RouteName: (context) => SuraDetailsScreen(),
        HadethContent.RouteName: (context) => HadethContent()
      },
      theme: IslamiTheme.lightMode,
      darkTheme: IslamiTheme.darkMode,
      themeMode: provider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}
