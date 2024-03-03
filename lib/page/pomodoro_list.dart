import 'package:flutter/material.dart';
import 'package:tick_to_do/page/pomodoro.dart';

class PomodoroList extends StatelessWidget {
  const PomodoroList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(
          title: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Pomodoro",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            quickPomodoro(context, "15", 15 * 60),
            quickPomodoro(context, "25", 25 * 60),
            quickPomodoro(context, "60", 60 * 60),
          ],
        ),
        const SizedBox(height: 20),
        const ListTile(
          title: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Son pomodorolar"),
          ),
        ),
        pomodoroCard(context, "Ders çalış"),
        pomodoroCard(context, "Kod yaz"),
        pomodoroCard(context, "Evi topla"),
      ],
    );
  }

  Padding pomodoroCard(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  const Text("25 dakika")
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Pomodoro(
                          buttonDuration: 25 * 60,
                        ),
                      ));
                },
                icon: const Icon(Icons.play_circle),
                iconSize: 48,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget quickPomodoro(BuildContext context, String time, int buttonDuration) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(25),
      color: Theme.of(context).colorScheme.primary,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.onPrimary.withAlpha(100),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Pomodoro(
                  buttonDuration: buttonDuration,
                ),
              ));
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          height: 100,
          width: 100,
          child: Text(
            time,
            style: TextStyle(
                fontSize: 32, color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}
