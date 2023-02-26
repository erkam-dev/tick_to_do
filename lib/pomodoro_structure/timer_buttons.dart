import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

// ignore: must_be_immutable
class TimerButtons extends StatefulWidget {
  bool isPause = false;
  CountDownController timerController = CountDownController();
  TimerButtons({Key? key, required this.timerController}) : super(key: key);

  @override
  State<TimerButtons> createState() => _TimerButtonsState();
}

class _TimerButtonsState extends State<TimerButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.isPause
            ? resumeButton(widget.timerController)
            : pauseButton(widget.timerController),
        const SizedBox(
          width: 10,
        ),
        restartButton(widget.timerController),
      ],
    );
  }

  startButton(CountDownController timerController) {
    return _button(
      icon: MaterialCommunityIcons.play,
      onPressed: () => timerController.start(),
    );
  }

  pauseButton(CountDownController timerController) {
    return _button(
      icon: MaterialCommunityIcons.pause,
      onPressed: () {
        setState(() {
          widget.isPause = true;
          timerController.pause();
        });
      },
    );
  }

  restartButton(CountDownController timerController) {
    return _button(
      icon: MaterialCommunityIcons.restart,
      onPressed: () => timerController.restart(),
    );
  }

  resumeButton(CountDownController timerController) {
    return _button(
      icon: MaterialCommunityIcons.play,
      onPressed: () {
        setState(() {
          widget.isPause = false;
          timerController.resume();
        });
      },
    );
  }

  _button({
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 50,
      ),
    );
  }
}
