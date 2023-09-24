import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/islami_theme.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String RouteName = 'SuraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    var provider = Provider.of<AppConfigProvider>(context);
    if (verses.isEmpty) {
      LoadFile(args.index);
    }

    return Stack(
      children: [
        Image.asset(
          provider.appTheme == ThemeMode.light
              ? 'assets/images/bg3.png'
              : 'assets/images/bgDark.png',
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(args.suraName,
                style: Theme.of(context).textTheme.titleLarge),
            iconTheme: Theme.of(context).iconTheme,
          ),
          body: verses.length == 0
              ? Center(
                  child: CircularProgressIndicator(
                      color: IslamiTheme.primaryLight))
              : Container(
                  decoration: BoxDecoration(
                      color: provider.appTheme == ThemeMode.light
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.05,
                      horizontal: MediaQuery.of(context).size.width * 0.04),
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                    itemCount: verses.length,
                    itemBuilder: (context, index) {
                      return Text(
                        '${verses[index]}{${index + 1}}',
                        style: Theme.of(context).textTheme.titleSmall,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }

  LoadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/quran/${index + 1}.txt');
    List<String> suraContent = content.split('\n');
    verses = suraContent;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String suraName;
  int index;

  SuraDetailsArgs({required this.suraName, required this.index});
}
