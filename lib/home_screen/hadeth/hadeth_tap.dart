import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home_screen/hadeth/hadeth_content.dart';
import 'package:islami/islami_theme.dart';
class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      LoadHadethFile();
    }

    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.07),
            child: Image.asset('assets/images/hadeth_icon.png')),
        Divider(
          thickness: 2,
          color: IslamiTheme.primaryLight,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Divider(
          thickness: 2,
          color: IslamiTheme.primaryLight,
        ),
        ahadethList.length == 0
            ? CircularProgressIndicator(color: IslamiTheme.primaryLight)
            : Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, HadethContent.RouteName,
                                arguments: Hadeth(
                                    title: ahadethList[index].title,
                                    content: ahadethList[index].content));
                          },
                          child: Text(
                            ahadethList[index].title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: IslamiTheme.primaryLight,
                        )
                      ],
                    );
                  },
                  itemCount: ahadethList.length,
                ),
              )
      ],
    );
  }

  void LoadHadethFile() async {
    String ahadethcontent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethlist = ahadethcontent.split('#\r\n');
    for (int i = 0; i < hadethlist.length; i++) {
      List<String> hadethLines = hadethlist[i].split('\n');
      String title = hadethLines[0]; //title
      hadethLines.removeAt(0); //content
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
    }

    setState(() {});
  }
}

class Hadeth {
  String title;
  List<String> content;
  Hadeth({required this.title, required this.content});
}
