import 'package:chat_fire/models/user.dart';
import 'package:chat_fire/screens/chat/chatting.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final User user;
  UserTile({this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        title: Text(user.name),
        subtitle: Text(''),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Chatting(),
              ));
        },
      ),
    );
  }
}
