import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:tick_to_do/pomodoro_structure/timer.dart';
import 'package:tick_to_do/pomodoro_structure/timer_buttons.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro({super.key, required this.buttonDuration});
  final int buttonDuration;

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  @override
  Widget build(BuildContext context) {
    CountDownController timerController = CountDownController();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/logo.png'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                TimerButtons(timerController: timerController).isPause = false;
                Navigator.pop(context);
              });
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: ListView(
        children: [
          Timer(
              timerController: timerController,
              duration: widget.buttonDuration),
          SizedBox(height: MediaQuery.of(context).size.height / 6),
          TimerButtons(timerController: timerController),
        ],
      ),
    );
  }
}
