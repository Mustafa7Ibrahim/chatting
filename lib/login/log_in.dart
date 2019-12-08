import 'package:chat_fire/login/bar.dart';
import 'package:chat_fire/login/edit_box.dart';
import 'package:chat_fire/login/login_logo.dart';
import 'package:chat_fire/login/next_bar.dart';
import 'package:flutter/material.dart';

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
              SigninLogo(),
              Spacer(),
              NextBar(),
            ],
          ),
        ),
      ),
    );
  }
}
