import 'package:chat_fire/auth/authService.dart';
import 'package:chat_fire/screens/chat_home/chat.dart';
import 'package:chat_fire/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditBox extends StatefulWidget {
  @override
  EditBoxState createState() => EditBoxState();
}

class EditBoxState extends State<EditBox> {
  // an object of Auth Service
  final AuthService _authService = AuthService();

  // form key object
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // declear form controller
  TextEditingController emailInputController;
  TextEditingController passwordInputController;

  // declear an error string
  String error = '';

  @override
  initState() {
    emailInputController = new TextEditingController();
    passwordInputController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 44),
          child: Text(
            'Welcome back,',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34.0),
          ),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
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
                  obscureText: true,
                  controller: passwordInputController,
                  validator: (value) =>
                      value.isEmpty ? 'Password can not be empty!' : null,
                  decoration: formDecoration.copyWith(hintText: 'Password'),
                ),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30, top: 30),
                    icon: Icon(FontAwesomeIcons.google),
                    onPressed: () {},
                  ),
                  IconButton(
                    padding: EdgeInsets.only(left: 30, top: 30),
                    icon: Icon(FontAwesomeIcons.facebookF),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      top: 18.0,
                      bottom: 60.0,
                    ),
                    child: Text(
                      'Forgert Password?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, top: 18.0, right: 30.0, bottom: 60.0),
                    child: Container(
                      color: Colors.red[300],
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        color: Colors.white,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result = await _authService.signIn(
                                email: emailInputController.text,
                                password: passwordInputController.text);
                            if (result == null) {
                              error = "Please enter a valid email and password";
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatHome()));
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
