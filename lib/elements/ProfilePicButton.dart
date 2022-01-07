import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tick_to_do/elements/HeroDialogRoute.dart';
import 'package:tick_to_do/elements/ProfilePopup.dart';

class ProfilePicButton extends StatelessWidget {
  const ProfilePicButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            HeroDialogRoute(
              builder: (context) => ProfilePopup(),
            ),
          );
        },
        child: Stack(
          children: [
            Hero(
              tag: 'ProfilePopup',
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: 50,
                  width: 50,
                ),
              ),
            ),
            Hero(
              tag: 'CircleAvatar',
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/profile_pic.png'),
                foregroundImage: NetworkImage(user.photoURL),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
