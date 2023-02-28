import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tick_to_do/elements/profile_pic_button.dart';
import 'package:tick_to_do/page/todo_list.dart';

class HomePage extends StatefulWidget {
  // ignore: constant_identifier_names
  static const PREFERENCES_IS_FIRST_LAUNCH_STRING =
      "PREFERENCES_IS_FIRST_LAUNCH_STRING";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 65,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset('images/logo.png'),
        ),
        title: Text(
          "Tick To Do",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: const [ProfilePicButton()],
      ),
      body: const TodoList(),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              builder: (context) => ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                children: [
                  Text(AppLocalizations.of(context)!.addTodo),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.title),
                  ),
                ],
              ),
            );
          },
          label: Text(AppLocalizations.of(context)!.addTodo),
          icon: const Icon(Icons.add_task)),
      extendBody: true,
    );
  }
}

Future<bool> _isFirstLaunch() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  bool isFirstLaunch =
      sharedPreferences.getBool(HomePage.PREFERENCES_IS_FIRST_LAUNCH_STRING) ??
          true;

  if (isFirstLaunch) {
    sharedPreferences.setBool(
        HomePage.PREFERENCES_IS_FIRST_LAUNCH_STRING, false);
  }

  return isFirstLaunch;
}
