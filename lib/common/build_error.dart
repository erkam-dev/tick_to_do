import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget buildError(BuildContext context) => SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.of(context)!.tryAgain.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade900),
              ),
            ),
          ],
        ),
      ),
    );
