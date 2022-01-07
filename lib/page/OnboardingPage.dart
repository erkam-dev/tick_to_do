import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:tick_to_do/provider/googleSignIn.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: AppLocalizations.of(context).welcomeToTickToDo,
            body: AppLocalizations.of(context).welcomeDescription1,
            image: buildImage('images/welcome.svg'),
          ),
          PageViewModel(
            title: AppLocalizations.of(context).addYourTodosAndComplete,
            body: AppLocalizations.of(context).welcomeDescription2,
            image: buildImage('images/add_notes.svg'),
          ),
          PageViewModel(
            title: AppLocalizations.of(context).signInToContinue,
            body: AppLocalizations.of(context).welcomeDescription3,
            image: buildImage('images/login.svg'),
          ),
        ],
        doneColor: Colors.blue,
        done: googleButton(),
        next: Icon(Icons.navigate_next),
        showNextButton: true,
        color: Theme.of(context).colorScheme.onPrimary,
        showSkipButton: true,
        skip: Text(AppLocalizations.of(context).skip),
        onSkip: () => loginWidget(context),
        onDone: () => loginWidget(context),
      ),
    );
  }

  Widget googleButton() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.blue.shade100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesome.google,
              color: Colors.blue.shade700,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              AntDesign.login,
              color: Colors.blue.shade700,
            ),
          ],
        ),
      ),
    );
  }

  Center buildImage(String path) => Center(
        child: SvgPicture.asset(
          path,
          width: 350,
        ),
      );

  loginWidget(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.login();
  }
}
