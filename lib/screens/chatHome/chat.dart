
import 'package:chat_fire/auth/authService.dart';
import 'package:chat_fire/models/user.dart';
import 'package:chat_fire/services/usersCollection.dart';
import 'package:provider/provider.dart';

import './category_selector.dart';
import './favorete_contects.dart';
import './recent_chats.dart';
import 'package:flutter/material.dart';

class ChatHome extends StatefulWidget {
  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  // make an object of authservices
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<User>>.value(
      value: UsersDatabase().users,
          child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 24.0,
            color: Colors.white,
            onPressed: () async {
              await _authService.signOut();
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              iconSize: 24.0,
              color: Colors.white,
              onPressed: () {},
            )
          ],
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            CategorySelector(),
            FavoreteContects(),
            RecentChats(),
          ],
        ),
      ),
    );
  }
}
