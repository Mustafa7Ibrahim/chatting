import 'package:chat_fire/models/user.dart';
import 'package:chat_fire/screens/authencation/signIn/signIn.dart';
import 'package:chat_fire/screens/chat_home/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // make an object of user
    final user = Provider.of<User>(context);

    // this return either authencation or chat home
    if (user == null) {
      return SignIn();  
    } else {
      return ChatHome();
    }
  }
}