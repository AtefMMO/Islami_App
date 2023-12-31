import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/settings/language_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'mode_bottom_sheet.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(111, 110, 115, 115),
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                ShowLanguageBottomSheet();
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        provider.appLanguage == 'en'
                            ? AppLocalizations.of(context)!.english
                            : AppLocalizations.of(context)!.arabic,
                        style: Theme.of(context).textTheme.titleMedium),
                    Icon(Icons.arrow_drop_down)
                  ]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.mode,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(111, 110, 115, 115),
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                ShowModeBottomSheet();
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        provider.appTheme == ThemeMode.light
                            ? AppLocalizations.of(context)!.light_mode
                            : AppLocalizations.of(context)!.dark_mode,
                        style: Theme.of(context).textTheme.titleMedium),
                    Icon(Icons.arrow_drop_down)
                  ]),
            ),
          ),
        )
      ],
    );
  }

  ShowLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  ShowModeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ModeBottomSheet());
  }
}
