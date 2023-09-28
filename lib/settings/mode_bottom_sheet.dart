import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class ModeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.appTheme == ThemeMode.light
                ? onSelected(AppLocalizations.of(context)!.light_mode, context)
                : unSelected(
                    AppLocalizations.of(context)!.light_mode, context)),
        InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.appTheme == ThemeMode.dark
                ? onSelected(AppLocalizations.of(context)!.dark_mode, context)
                : unSelected(AppLocalizations.of(context)!.dark_mode, context)),
      ],
    );
  }

  Widget onSelected(String theme, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            theme,
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
