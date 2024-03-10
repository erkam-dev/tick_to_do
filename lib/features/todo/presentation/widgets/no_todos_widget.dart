import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoTodosWidget extends StatelessWidget {
  final int selectedTabIndex;
  const NoTodosWidget({super.key, required this.selectedTabIndex});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const IconButton(
        onPressed: null,
        icon: Icon(Icons.content_paste_off_rounded),
      ),
      subtitle: Text(
        AppLocalizations.of(context)!.addYourTodosAndCompleteThem,
      ),
      title: Text(
        selectedTabIndex == 0
            ? AppLocalizations.of(context)!.noTodos
            : AppLocalizations.of(context)!.noCompletedTodos,
      ),
    );
  }
}
