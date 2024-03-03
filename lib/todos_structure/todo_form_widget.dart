import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoFormWidget extends StatelessWidget {
  final String? title;
  final String? description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    super.key,
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedTodo,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(context),
          buildDescription(context),
        ],
      );

  TextFormField buildTitle(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      initialValue: title,
      onChanged: onChangedTitle,
      validator: (title) {
        if (title!.isEmpty) {
          return AppLocalizations.of(context)!.notValid.toString();
        }
        return null;
      },
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: AppLocalizations.of(context)!.title.toString(),
      ),
    );
  }

  TextFormField buildDescription(BuildContext context) {
    return TextFormField(
      maxLines: null,
      initialValue: description,
      onChanged: onChangedDescription,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.description.toString(),
        border: InputBorder.none,
      ),
    );
  }

  ElevatedButton buildButton(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.save_outlined),
      onPressed: () => onSavedTodo(),
      label: Text(AppLocalizations.of(context)!.save),
    );
  }
}
