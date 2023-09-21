import 'package:flutter/material.dart';
import 'package:islami/home_screen/hadeth/hadeth_tap.dart';
import 'package:islami/islami_theme.dart';

class HadethContent extends StatelessWidget {
  static const String RouteName = 'HadethContentScreen';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Stack(children: [
      Image.asset(
        'assets/images/bg3.png',
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
              color: IslamiTheme.whiteColor),
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
