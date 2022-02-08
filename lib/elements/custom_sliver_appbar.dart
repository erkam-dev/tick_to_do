import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final user = FirebaseAuth.instance.currentUser;

// ignore: must_be_immutable
class CustomSliverAppbar extends StatefulWidget {
  String title = "Hoşgeldiniz";

  CustomSliverAppbar({Key key, @required this.title}) : super(key: key);

  @override
  State<CustomSliverAppbar> createState() => _CustomSliverAppbarState();
}

class _CustomSliverAppbarState extends State<CustomSliverAppbar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      toolbarHeight: 65,
      expandedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
