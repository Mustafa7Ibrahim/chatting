import 'package:chat_fire/screens/authencation/signIn/signIn.dart';
import 'package:chat_fire/screens/chatHome/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // make an object of user
    // final user = Provider.of<User>(context);
    FirebaseUser user;

    // this return either authencation or chat home
    if (user == null) {
      return SignIn();  
    } else {
      return ChatHome();
    }
  }
}