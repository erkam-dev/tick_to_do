import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Timer extends StatelessWidget {
  CountDownController timerController = CountDownController();
  int duration = 10;
  Function? onStart;
  Function? onComplete;
  Timer({
    super.key,
    required this.timerController,
    required this.duration,
    this.onStart,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: CircularCountDownTimer(
        duration: duration,
        initialDuration: 0,
        controller: timerController,
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 4,
        ringColor: Theme.of(context).colorScheme.primary,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Colors.transparent,
        strokeWidth: 25,
        strokeCap: StrokeCap.round,
        textStyle: TextStyle(
          fontSize: 50,
          color: Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.bold,
        ),
        textFormat: CountdownTextFormat.MM_SS,
        isReverse: true,
        isReverseAnimation: false,
        isTimerTextShown: true,
        autoStart: true,
        onStart: onStart as void Function()?,
        onComplete: onComplete as void Function()?,
      ),
    );
  }
}
