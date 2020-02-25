import 'package:chat_fire/models/user.dart';
import 'package:chat_fire/screens/chat/chatting.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final User user;
  UserTile({this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(bottom: 12, right: 18, left: 18),
      leading: CircleAvatar(
        radius: 26.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      title: Text(user.name),
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Chatting(),
        //   ),
        // );
      },
    );
  }
}
