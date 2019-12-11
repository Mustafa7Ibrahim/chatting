import 'package:chat_fire/login/bar.dart';
import 'package:flutter/material.dart';

import 'editBox.dart';

class LoginHome extends StatefulWidget {
  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Bar(),
              EditBox(),
            ],
          ),
        ),
      ),
    );
  }
}
