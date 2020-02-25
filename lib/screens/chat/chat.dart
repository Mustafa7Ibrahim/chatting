import 'package:chat_fire/screens/chat/chatting.dart';
import 'package:chat_fire/shared/constant.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final String peerId;
  final String peerAvatar;

  Chat({Key key, @required this.peerId, @required this.peerAvatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CHAT',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Chatting(
        peerId: peerId,
        peerAvatar: peerAvatar,
      ),
    );
  }
}
