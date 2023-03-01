import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateTodoPage extends StatelessWidget {
  const CreateTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.addTodo)),
      body: ListView(
        padding: EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 30,
        ),
        children: [
          Text(AppLocalizations.of(context)!.addTodo),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.title,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.description,
              ),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Kaydet"))
        ],
      ),
    );
  }
}
