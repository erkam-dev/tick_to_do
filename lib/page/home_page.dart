import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tick_to_do/elements/custom_showcase.dart';
import 'package:tick_to_do/elements/hero_dialog_route.dart';
import 'package:tick_to_do/elements/hero_fab.dart';
import 'package:tick_to_do/elements/profile_pic_button.dart';
import 'package:tick_to_do/page/todo_list.dart';
import 'package:tick_to_do/pomodoro_structure/add_pomodoro.dart';
import 'package:tick_to_do/todos_structure/add_todo.dart';

class HomePage extends StatefulWidget {
  // ignore: constant_identifier_names
  static const PREFERENCES_IS_FIRST_LAUNCH_STRING =
      "PREFERENCES_IS_FIRST_LAUNCH_STRING";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomSelectedIndex = 0;
  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  final addtodo = GlobalKey();
  final addpomodoro = GlobalKey();
  final profilebutton = GlobalKey();
  final todosnavbar = GlobalKey();
  final todaynavbar = GlobalKey();
  final pomodoronavbar = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isFirstLaunch().then((result) {
        if (result) {
          ShowCaseWidget.of(context).startShowCase([
            profilebutton,
            todaynavbar,
            todosnavbar,
            pomodoronavbar,
            addtodo,
            addpomodoro,
          ]);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final bodyContent = [
    //   const TodayPlaceHolder(),
    //   const TodoList(),
    //   const PomodoroList()
    // ];
    List fabList = [
      HeroFAB(
          showcaseDescription: AppLocalizations.of(context)!.showCaseAddTodo,
          globalKey: addtodo,
          heroTag: 'AddTodo',
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.of(context).push(
              HeroDialogRoute(
                builder: (context) => const AddTodo(),
              ),
            );
          },
          title: AppLocalizations.of(context)!.addTodo,
          icon: Icons.add_task),
      FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(
              HeroDialogRoute(
                builder: (context) => const AddTodo(),
              ),
            );
          },
          label: Text(AppLocalizations.of(context)!.addTodo),
          icon: const Icon(Icons.add_task)),
      HeroFAB(
          showcaseDescription: "Yeni pomodoro ekleyin",
          globalKey: addpomodoro,
          heroTag: 'AddPomodoro',
          onTap: () {
            Navigator.of(context).push(
              HeroDialogRoute(
                builder: (context) => const AddPomodoro(),
              ),
            );
          },
          title: 'Pomodoro',
          icon: Icons.alarm_add)
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 65,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset('images/logo.png'),
        ),
        title: const Text(
          "Tick To Do",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: [
          CustomShowcaseWidget(
            globalKey: profilebutton,
            description: "Ayarlarınız burada",
            child: const ProfilePicButton(),
          ),
        ],
      ),
      body: const TodoList(),
      resizeToAvoidBottomInset: false,
      floatingActionButton: fabList[1],
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
