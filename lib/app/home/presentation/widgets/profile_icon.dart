import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tick_to_do/lib.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return IconButton(
      onPressed: () {
        context.showDraggableScrollableSheet(
            child: Column(
          children: [
            ClipOval(
              child: Image.network(
                authBloc.profile?.photoUrl ?? "",
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Icon(Icons.account_circle_outlined);
                },
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.account_circle_outlined),
              ),
            ),
            Text(
              authBloc.profile?.name ?? "",
              style: Theme.of(context).textTheme.titleMedium,
            ).pad8(),
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
              onTap: () {
                context.pop();
                context.navigateTo(const SettingsScreen());
              },
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
          ],
        ));
      },
      icon: ClipOval(
        child: Image.network(
          authBloc.profile?.photoUrl ?? "",
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Icon(Icons.account_circle_outlined);
          },
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.account_circle_outlined),
        ),
      ),
    ).pad4();
  }
}
