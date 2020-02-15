import 'package:chat_fire/screens/authencation/signIn/editBox.dart';
import 'package:chat_fire/screens/authencation/signUp/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(top: 24, left: 30),
                    icon: Icon(FontAwesomeIcons.user),
                    onPressed: () {},
                  ),
                  Spacer(),
                  FlatButton(
                    padding: EdgeInsets.only(top: 24, right: 8),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  FlatButton(
                    padding: EdgeInsets.only(top: 24, right: 30),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                  ),
                ],
              ),
              EditBox(),
            ],
          ),
        ),
      ),
    );
  }
}
