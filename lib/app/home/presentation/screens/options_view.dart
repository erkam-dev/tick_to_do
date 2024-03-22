import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../lib.dart';

class OptionsView extends StatelessWidget {
  final Function()? onAccountSelected;
  const OptionsView({super.key, this.onAccountSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.palette_outlined),
          title: Text(AppLocalizations.of(context)!.theme),
          trailing: DropdownButton(
            underline: const SizedBox(),
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            value: appThemeNotifier.value,
            borderRadius: BorderRadius.circular(24),
            items: [
              DropdownMenuItem(
                value: ThemeMode.system,
                child: Text(AppLocalizations.of(context)!.system),
              ),
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Text(AppLocalizations.of(context)!.light),
              ),
              DropdownMenuItem(
                value: ThemeMode.dark,
                child: Text(AppLocalizations.of(context)!.dark),
              ),
            ],
            onChanged: (value) => {
              appThemeNotifier.value = value as ThemeMode,
              context.pop(),
              sl<SharedPreferences>()
                  .setInt(themeModeKey, getIntByThemeMode(value))
            },
          ).padOnly(right: 10),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle_outlined),
          title: Text(AppLocalizations.of(context)!.account),
          onTap: () => onAccountSelected?.call(),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
        ),
        ListTile(
          leading: const Icon(Icons.star_rate_rounded),
          title: Text(AppLocalizations.of(context)!.rateApp),
          onTap: () {
            openStoreListing();
            context.pop();
          },
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
        ),
      ],
    ).safeArea();
  }
}
