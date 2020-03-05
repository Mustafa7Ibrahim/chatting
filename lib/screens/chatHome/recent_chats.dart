import 'package:chat_fire/models/user.dart';
import 'package:chat_fire/screens/chat/chatting.dart';
import 'package:chat_fire/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // users list
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
          child: users.length == null
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      themeColor,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: users.length,
                  padding: EdgeInsets.only(top: 18, bottom: 18),
                  itemBuilder: (context, index) => userTile(
                    context,
                    users[index],
                  ),
                ),
        ),
      ),
    );
  }

  Widget userTile(BuildContext context, User users) {
    return ListTile(
      contentPadding: EdgeInsets.only(bottom: 12, right: 18, left: 18),
      leading: CircleAvatar(
        radius: 26.0,
        backgroundColor: fMessageTheme,
      ),
      title: Text(users.nickname),
      subtitle: Text(users.chattingWith),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Chatting(
              freindId: users.uid,
              freindAvatar: users.photoUrl,
              freindName: users.nickname,
            ),
          ),
        );
      },
    );
  }
}
