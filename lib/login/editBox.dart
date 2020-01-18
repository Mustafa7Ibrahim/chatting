import 'package:chat_fire/chat_home/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditBox extends StatefulWidget {
  @override
  EditBoxState createState() => EditBoxState();
}

class EditBoxState extends State<EditBox> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  void signIn() {
    if (_formKey.currentState.validate()) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailInputController.text,
            password: pwdInputController.text,
          )
          .then((result) => Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatHome())));
    }
    Text("You don't have account.");
  }

  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              top: 60,
            ),
            child: Text(
              'Welcome back,',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34.0,
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
                    left: 30.0,
                    right: 30.0,
                  ),
                  child: TextFormField(
                    controller: emailInputController,
                    validator: (value) =>
                        value.isEmpty ? 'Email can not be empty!' : null,
                    decoration: InputDecoration(
                      hintText: 'Email address',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 18.0,
                    left: 30.0,
                    right: 30.0,
                  ),
                  child: TextFormField(
                    obscureText: true,
                    controller: pwdInputController,
                    validator: (value) =>
                        value.isEmpty ? 'Password can not be empty!' : null,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                      ),
                    ),
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
                        left: 30.0,
                        top: 18.0,
                        right: 30.0,
                        bottom: 60.0,
                      ),
                      child: Container(
                        color: Colors.red[300],
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          color: Colors.white,
                          onPressed: () {
                            signIn();
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
      ),
    );
  }
}
