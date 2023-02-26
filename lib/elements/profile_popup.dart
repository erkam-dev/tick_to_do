import 'package:flutter/material.dart';
import 'package:tick_to_do/elements/custom_sliver_appbar.dart';
import 'package:tick_to_do/page/settings_page.dart';
import 'package:tick_to_do/provider/google_sign_in.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePopup extends StatefulWidget {
  // ignore: constant_identifier_names
  static const PREFERENCES_IS_FIRST_LAUNCH_STRING =
      "PREFERENCES_IS_FIRST_LAUNCH_STRING";
  const ProfilePopup({Key? key}) : super(key: key);

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
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 1.5,
                  minHeight: MediaQuery.of(context).size.height / 3,
                  maxWidth: MediaQuery.of(context).size.width / 1.2,
                  minWidth: MediaQuery.of(context).size.width / 1.2,
                ),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        user!.displayName!,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ListTile(
                      title: const Text("Ayarlar"),
                      leading: const Icon(Icons.settings),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingsPage(),
                            ));
                      },
                    ),
                    ListTile(
                      title: Text(AppLocalizations.of(context)!.logout),
                      leading: const Icon(Icons.logout),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Hero(
              tag: 'CircleAvatar',
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: const AssetImage('images/profile_pic.png'),
                foregroundImage: NetworkImage(user!.photoURL!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
