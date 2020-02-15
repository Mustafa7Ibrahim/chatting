
import './category_selector.dart';
import './favorete_contects.dart';
import './recent_chats.dart';
import 'package:flutter/material.dart';

class ChatHome extends StatefulWidget {
  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 24.0,
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
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
    );
  }
}
