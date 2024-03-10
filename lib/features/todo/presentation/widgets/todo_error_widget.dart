import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tick_to_do/lib.dart';

class TodoErrorWidget extends StatelessWidget {
  final Object? error;
  const TodoErrorWidget({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Text(
          kDebugMode
              ? error.toString()
              : AppLocalizations.of(context)!.errorOccured,
          style: const TextStyle(fontSize: 18),
        ),
      ).pad16(),
    );
  }
}
