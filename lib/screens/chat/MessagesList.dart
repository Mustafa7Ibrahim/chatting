import 'package:chat_fire/models/chat.dart';
import 'package:flutter/material.dart';

class MessagesList extends StatelessWidget {
  final Messages messages;
  MessagesList({this.messages});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.accentColor,
      child: Column(
        children: <Widget>[
          Text(
            messages.content,
            style: TextStyle(fontSize: 24),
          ),
          Text(
            messages.createdAt,
            style: TextStyle(fontSize: 4),
          ),
        ],
      ),
    );
  }
}
