import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddPomodoro extends StatefulWidget {
  const AddPomodoro({super.key});

  @override
  State<AddPomodoro> createState() => _AddPomodoroState();
}

class _AddPomodoroState extends State<AddPomodoro> {
  final _formKey = GlobalKey<FormState>();
  String? pomodoroDuration;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Hero(
          tag: "AddPomodoro",
          child: Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 2,
                minWidth: MediaQuery.of(context).size.width / 1.2,
                maxWidth: MediaQuery.of(context).size.width / 1.2,
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen bir değer girin';
                        }
                        return null;
                      },
                      onChanged: (duration) {
                        setState(() {
                          pomodoroDuration = duration;
                        });
                      },
                      decoration: const InputDecoration(label: Text("Süre")),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 32),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                  ElevatedButton.icon(
                    // ignore: void_checks
                    onPressed: () {
                      // final isValid = _formKey.currentState!.validate();
                      // if (!isValid) {
                      //   return;
                      // } else {
                      //   Navigator.pop(context);
                      //   return pomodoroDuration;
                      // }
                    },
                    icon: const Icon(Icons.alarm_add),
                    label: const Text("Oluştur"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
