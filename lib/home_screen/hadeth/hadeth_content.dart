import 'package:flutter/material.dart';
import 'package:islami/home_screen/hadeth/hadeth_tap.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethContent extends StatelessWidget {
  static const String RouteName = 'HadethContentScreen';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(children: [
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
          title: Text(
            args.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          iconTheme: Theme.of(context).iconTheme,
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: provider.appTheme == ThemeMode.light
                  ? Colors.white
                  : Theme.of(context).primaryColor),
          child: ListView.builder(
            itemCount: args.content.length,
            itemBuilder: (context, index) {
              return Text(
                args.content[index],
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              );
            },
          ),
        ),
      )
    ]);
  }
}
