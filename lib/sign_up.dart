import 'package:chat_fire/chat_home/chat.dart';
import 'package:chat_fire/login/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController firstNameInputController;
  TextEditingController lastNameInputController;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;

  void signUp() {
    if (_formKey.currentState.validate()) {
      if (pwdInputController.text == confirmPwdInputController.text) {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailInputController.text,
              password: pwdInputController.text,
            )
            .then(
              (result) => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatHome()),
                ),
                firstNameInputController.clear(),
                lastNameInputController.clear(),
                emailInputController.clear(),
                pwdInputController.clear(),
                confirmPwdInputController.clear(),
              },
            );
      }
    }
  }

  @override
  initState() {
    firstNameInputController = new TextEditingController();
    lastNameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
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
                    padding: EdgeInsets.all(30),
                    icon: Icon(FontAwesomeIcons.user),
                    onPressed: () {},
                  ),
                  Spacer(),
                  FlatButton(
                    padding: EdgeInsets.all(30),
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
                    padding: EdgeInsets.all(30),
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
                    padding: const EdgeInsets.only(
                      left: 30,
                      top: 60,
                    ),
                    child: Text(
                      'Hello',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 4,
                      right: 30,
                      top: 60,
                    ),
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
                  top: 18.0,
                ),
                child: Text(
                  'Enter your informations below or logain with a social account.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 18.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: TextFormField(
                        controller: firstNameInputController,
                        validator: (value) => value.isEmpty
                            ? 'This faild can not be empty!'
                            : null,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 18.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: TextFormField(
                        controller: emailInputController,
                        validator: (value) =>
                            value.isEmpty ? 'Email can not be empty!' : null,
                        decoration: InputDecoration(
                          hintText: 'Email address',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 18.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: TextFormField(
                        controller: pwdInputController,
                        validator: (value) =>
                            value.isEmpty ? 'Password can not be empty!' : null,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 18.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: TextFormField(
                        controller: confirmPwdInputController,
                        obscureText: true,
                        validator: (value) => value.isEmpty
                            ? 'this faild can not be empty!'
                            : null,
                        decoration: InputDecoration(
                          hintText: 'Conferm Password',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30),
                    icon: Icon(FontAwesomeIcons.google),
                    onPressed: () {},
                  ),
                  IconButton(
                    padding: EdgeInsets.only(left: 30),
                    icon: Icon(FontAwesomeIcons.facebookF),
                    onPressed: () {},
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.all(18.0),
                    color: Colors.red[300],
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      color: Colors.white,
                      onPressed: () {
                        signUp();
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
