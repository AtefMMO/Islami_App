import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
              provider.changeLanguage('en');
            },
            child: provider.appLanguage == 'en'
                ? onSelected(AppLocalizations.of(context)!.english, context)
                : unSelected(AppLocalizations.of(context)!.english, context)),
        InkWell(
            onTap: () {
              provider.changeLanguage('ar');
            },
            child: provider.appLanguage == 'ar'
                ? onSelected(AppLocalizations.of(context)!.arabic, context)
                : unSelected(AppLocalizations.of(context)!.arabic, context)),
      ],
    );
  }

  Widget onSelected(String language, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
          Icon(Icons.check, color: Theme.of(context).primaryColor)
        ],
      ),
    );
  }

  Widget unSelected(String language, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Color.fromARGB(111, 110, 115, 115)),
          ),
          Icon(
            Icons.check,
            color: Color.fromARGB(111, 110, 115, 115),
          )
        ],
      ),
    );
  }
}
