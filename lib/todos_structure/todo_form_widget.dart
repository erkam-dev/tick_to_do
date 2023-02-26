import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoFormWidget extends StatelessWidget {
  final String? title;
  final String? description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(context),
            const SizedBox(
              height: 10,
            ),
            buildDescription(context),
            buildButton(context)
          ],
        ),
      );

  TextFormField buildTitle(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      initialValue: title,
      onChanged: onChangedTitle,
      onTap: () {
        HapticFeedback.lightImpact();
      },
      validator: (title) {
        if (title!.isEmpty) {
          return AppLocalizations.of(context)!.notValid.toString();
        }
        return null;
      },
      decoration: InputDecoration(
          label: Text(AppLocalizations.of(context)!.title.toString())),
    );
  }

  TextFormField buildDescription(BuildContext context) {
    return TextFormField(
      maxLines: null,
      initialValue: description,
      onTap: () {
        HapticFeedback.lightImpact();
      },
      onChanged: onChangedDescription,
      decoration: InputDecoration(
          label: Text(AppLocalizations.of(context)!.description.toString())),
    );
  }

  ElevatedButton buildButton(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.save_outlined),
      onPressed: () {
        HapticFeedback.heavyImpact();
        onSavedTodo();
      },
      label: Text(AppLocalizations.of(context)!.save),
    );
  }
}
