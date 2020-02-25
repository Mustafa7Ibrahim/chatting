import 'package:chat_fire/models/user.dart';
import 'package:chat_fire/screens/chatHome/userTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<User>>(context) ?? [];

    return Expanded(
      child: Container(
      color: Theme.of(context).primaryColor,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30.0),
              topRight: const Radius.circular(30.0),
            ),
          ),
          child: ListView.builder(
            itemCount: users.length,
            padding: EdgeInsets.only(top: 18, bottom: 18),
            itemBuilder: (context, index) {
              return UserTile(user: users[index]);
            },
          ),
        ),
      ),
    );
  }
}
