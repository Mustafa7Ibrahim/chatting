import 'package:chat_fire/models/chat.dart';
import 'package:chat_fire/screens/chat/MessagesList.dart';
import 'package:chat_fire/services/chatCollection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chatting extends StatefulWidget {
  @override
  _ChattingState createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final messages = Provider.of<List<Messages>>(context) ?? [];

    return StreamProvider<List<Messages>>.value(
      value: ChatCollection().messages,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'User Name',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: theme.primaryColor,
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            iconSize: 25.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: 25.0,
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return MessagesList(messages: messages[index]);
                },
              ),
              sendMessageBar(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget sendMessageBar(context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(
            12.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.photo),
                  iconSize: 25.0,
                  color: Colors.blueGrey,
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    onChanged: (
                      value,
                    ) {},
                    decoration: InputDecoration.collapsed(
                      hintText: 'Type a message..',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                  ),
                  iconSize: 25.0,
                  color: Colors.blueGrey,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
