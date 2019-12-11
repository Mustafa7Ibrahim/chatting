import 'package:chat_fire/chat_home/chat.dart';
import 'package:chat_fire/login/login_logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditBox extends StatefulWidget {
  @override
  EditBoxState createState() => EditBoxState();
}

class EditBoxState extends State<EditBox> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailInputController;
  TextEditingController pwdInputController;

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
              left: 30.0,
              right: 30.0,
              top: 120.0,
            ),
            child: Text(
              'Welcome back,',
              style: TextStyle(
                fontSize: 34.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 8.0,
            ),
            child: Text(
              'User',
              style: TextStyle(
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
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
                SigninLogo(),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomLeft,
                          child: Row(
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
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
                                      if (_formKey.currentState.validate()) {
                                        FirebaseAuth.instance.signInWithEmailAndPassword(
                                          email: emailInputController.text,
                                          password: pwdInputController.text,
                                        ).then((result) => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ChatHome()
                                          )
                                        ));
                                      } 
                                      Text("You don't have account.");
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
