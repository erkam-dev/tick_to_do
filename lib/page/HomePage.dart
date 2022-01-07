import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tick_to_do/elements/CustomShowCase.dart';
import 'package:tick_to_do/elements/HeroFAB.dart';
import 'package:tick_to_do/elements/ProfilePicButton.dart';
import 'package:tick_to_do/page/PomodoroList.dart';
import 'package:tick_to_do/pomodoro_structure/AddPomodoro.dart';
import 'package:tick_to_do/today_screen_structure/TodayPlaceHolder.dart';
import 'package:tick_to_do/todos_structure/AddTodo.dart';
import 'package:tick_to_do/elements/HeroDialogRoute.dart';
import 'package:tick_to_do/page/TodoList.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  static const PREFERENCES_IS_FIRST_LAUNCH_STRING =
      "PREFERENCES_IS_FIRST_LAUNCH_STRING";

  @override
  _HomePageState createState() => _HomePageState();
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
        if (result)
          ShowCaseWidget.of(context).startShowCase([
            profilebutton,
            todaynavbar,
            todosnavbar,
            pomodoronavbar,
            addtodo,
            addpomodoro,
          ]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final bodyContent = [TodayPlaceHolder(), TodoList(), PomodoroList()];
    List fabList = [
      FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      HeroFAB(
          showcaseDescription: AppLocalizations.of(context).showCaseAddTodo,
          globalKey: addtodo,
          heroTag: 'AddTodo',
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.of(context).push(
              HeroDialogRoute(
                builder: (context) => AddTodo(),
              ),
            );
          },
          title: AppLocalizations.of(context).addTodo,
          icon: Icons.add_task),
      HeroFAB(
          showcaseDescription: "Yeni pomodoro ekleyin",
          globalKey: addpomodoro,
          heroTag: 'AddPomodoro',
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.of(context).push(
              HeroDialogRoute(
                builder: (context) => AddPomodoro(),
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
        title: Text(
          "Tick To Do",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: [
          CustomShowcaseWidget(
            globalKey: profilebutton,
            description: "Ayarlarınız burada",
            child: ProfilePicButton(),
          ),
        ],
      ),
      body: bodyContent[bottomSelectedIndex],
      resizeToAvoidBottomInset: false,
      floatingActionButton: fabList[bottomSelectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: bottomSelectedIndex,
        onDestinationSelected: (index) {
          bottomTapped(index);
        },
        destinations: [
          CustomShowcaseWidget(
            description: "Bugün ki öğeler burada",
            globalKey: todaynavbar,
            child: NavigationDestination(
              icon: Icon(Icons.today_outlined),
              selectedIcon: Icon(Icons.today),
              label: "Bugün",
            ),
          ),
          CustomShowcaseWidget(
            globalKey: todosnavbar,
            description: AppLocalizations.of(context).showCaseTodos,
            child: NavigationDestination(
              icon: Icon(Icons.check_box_outlined),
              selectedIcon: Icon(Icons.check_box),
              label: AppLocalizations.of(context).todos.toString(),
            ),
          ),
          CustomShowcaseWidget(
            globalKey: pomodoronavbar,
            description: "Pomodoro burada",
            child: NavigationDestination(
              icon: Icon(AntDesign.clockcircleo),
              selectedIcon: Icon(AntDesign.clockcircle),
              label: "Pomodoro",
            ),
          ),
        ],
      ),
    );
  }
}

Future<bool> _isFirstLaunch() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  bool isFirstLaunch =
      sharedPreferences.getBool(HomePage.PREFERENCES_IS_FIRST_LAUNCH_STRING) ??
          true;

  if (isFirstLaunch)
    sharedPreferences.setBool(
        HomePage.PREFERENCES_IS_FIRST_LAUNCH_STRING, false);

  return isFirstLaunch;
}
