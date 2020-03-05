import 'package:chat_fire/auth/authService.dart';
import 'package:chat_fire/screens/authencation/signIn/signIn.dart';
import 'package:chat_fire/screens/chatHome/chatHome.dart';
import 'package:chat_fire/shared/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // an auth service object
  final AuthService _authService = AuthService();

  // firebase user
  FirebaseUser user;

  // global form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // input controller
  TextEditingController nameInputController;
  TextEditingController emailInputController;
  TextEditingController passwordInputController;
  TextEditingController confirmPasswordInputController;

  @override
  initState() {
    nameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    passwordInputController = new TextEditingController();
    confirmPasswordInputController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30, top: 24),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn(),
                        ),
                      );
                    },
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
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 44),
                    child: Text(
                      'Hello',
                      style: TextStyle(color: Colors.black, fontSize: 34),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 30, top: 44),
                    child: Text(
                      'Beautiful,',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 18.0,
                  left: 30.0,
                  top: 12.0,
                ),
                child: Text(
                  'Enter your informations below or logain \nwith a social account.',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: formPadding,
                      child: TextFormField(
                        controller: nameInputController,
                        validator: (value) => value.isEmpty
                            ? 'This faild can not be empty!'
                            : null,
                        decoration: formDecoration.copyWith(hintText: 'Name'),
                      ),
                    ),
                    Padding(
                      padding: formPadding,
                      child: TextFormField(
                        controller: emailInputController,
                        validator: (value) =>
                            value.isEmpty ? 'Email can not be empty!' : null,
                        decoration: formDecoration.copyWith(hintText: 'Email'),
                      ),
                    ),
                    Padding(
                      padding: formPadding,
                      child: TextFormField(
                          controller: passwordInputController,
                          validator: (value) => value.isEmpty
                              ? 'Password can not be empty!'
                              : null,
                          obscureText: true,
                          decoration:
                              formDecoration.copyWith(hintText: 'Password')),
                    ),
                    Padding(
                      padding: formPadding,
                      child: TextFormField(
                        controller: confirmPasswordInputController,
                        obscureText: true,
                        validator: (value) => value.isEmpty
                            ? 'this faild can not be empty!'
                            : null,
                        decoration: formDecoration.copyWith(
                            hintText: 'Conferm Password'),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30, top: 12),
                    icon: Icon(FontAwesomeIcons.google),
                    onPressed: () {},
                  ),
                  IconButton(
                    padding: EdgeInsets.only(left: 30, top: 12),
                    icon: Icon(FontAwesomeIcons.facebookF),
                    onPressed: () {},
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 30, left: 12, top: 12),
                    color: Colors.red[300],
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      color: Colors.white,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _authService.signUp(
                              email: emailInputController.text,
                              name: nameInputController.text,
                              password: passwordInputController.text,
                              rePassword: confirmPasswordInputController.text);
                          if (result == null) {
                            print('something went wrong....');
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatHome(),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
