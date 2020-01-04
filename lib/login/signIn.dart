import 'package:flutter/material.dart';
import 'topBar.dart';
import 'editBox.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TopBar(),
              EditBox(),
            ],
          ),
        ),
      ),
    );
  }
}
