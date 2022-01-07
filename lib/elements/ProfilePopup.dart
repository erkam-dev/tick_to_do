import 'package:flutter/material.dart';
import 'package:tick_to_do/elements/CustomSliverAppbar.dart';
import 'package:tick_to_do/page/SettingsPage.dart';
import 'package:tick_to_do/provider/googleSignIn.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePopup extends StatefulWidget {
  static const PREFERENCES_IS_FIRST_LAUNCH_STRING =
      "PREFERENCES_IS_FIRST_LAUNCH_STRING";
  const ProfilePopup({Key key}) : super(key: key);

  @override
  State<ProfilePopup> createState() => _ProfilePopupState();
}

class _ProfilePopupState extends State<ProfilePopup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Hero(
            tag: 'ProfilePopup',
            child: Material(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 1.5,
                    minHeight: MediaQuery.of(context).size.height / 3,
                    maxWidth: MediaQuery.of(context).size.width / 1.2,
                    minWidth: MediaQuery.of(context).size.width / 1.2,
                  ),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          user.displayName,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ListTile(
                        title: Text("Ayarlar"),
                        leading: Icon(Icons.settings),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsPage(),
                              ));
                        },
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context).logout),
                        leading: Icon(Icons.logout),
                        textColor: Colors.red,
                        iconColor: Colors.red,
                        onTap: () {
                          GoogleSignInProvider().logout();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Hero(
              tag: 'CircleAvatar',
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/profile_pic.png'),
                foregroundImage: NetworkImage(user.photoURL),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
