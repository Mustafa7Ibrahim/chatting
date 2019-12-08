import 'package:chat_fire/chat_home/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class NextBar extends StatefulWidget {
  @override
  _NextBarState createState() => _NextBarState();
}

class _NextBarState extends State<NextBar> {
  void _signInAnon() async {
    AuthResult firebaseUser = await _firebaseAuth.signInAnonymously();

    if (firebaseUser != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatHome(),
        ),
      );
    } else {
      final snackbar = SnackBar(
        content: Text('Sign in failed'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        fontSize: 12.0,
                      ),
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
                          _signInAnon();
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
    );
  }
}
