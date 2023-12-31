import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class TasbehTap extends StatefulWidget {
  @override
  State<TasbehTap> createState() => _TasbehTapState();
}

class _TasbehTapState extends State<TasbehTap> {
  double turns = 0;
  int numberOfTasbeh = 0;
  List<String> tasbeh = [
    'سُبْحَانَ اللهِ',
    'الْحَمْدُ لِلَّهِ',
    'لَا إِلَهَ إِلَّا اللهُ',
    'اللهُ أَكْبَرُ'
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Stack(children: [
          Center(
              child: Image.asset(provider.appTheme == ThemeMode.light
                  ? 'assets/images/headOfSeb7a.png'
                  : 'assets/images/HeadOfSebhaDark.png')),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.08,
                horizontal: MediaQuery.of(context).size.width * 0.20),
            child: InkWell(
              onTap: () {
                turns += 1 / 30;
                numberOfTasbeh++;
                if (numberOfTasbeh == 33) {
                  numberOfTasbeh = 0;
                  index = (index + 1) % 4;
                }

                setState(() {});
              },
              child: AnimatedRotation(
                  turns: turns,
                  duration: Duration(milliseconds: 100),
                  child: Image.asset(provider.appTheme == ThemeMode.light
                      ? 'assets/images/bodyOfSeb7a.png'
                      : 'assets/images/BodyOfSebhaDark.png')),
            ),
          ),
        ]),
        Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.001,
              horizontal: MediaQuery.of(context).size.width * 0.20),
          child: Text(
            AppLocalizations.of(context)!.number_of_tasbeh,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
              horizontal: MediaQuery.of(context).size.width * 0.10),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Theme.of(context).dividerColor),
          child: Text(
            '$numberOfTasbeh',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 120, right: 120, top: 20),
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Theme.of(context).dividerColor),
          child: Text(
            '${tasbeh[index]}',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        )
      ],
    );
  }
}
