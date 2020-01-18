import 'package:flutter/material.dart';

class Chatting extends StatefulWidget {
  @override
  _ChattingState createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBarComponent(context),
      body: body(context),
    );
  }

  Widget appBarComponent(context) {
    final theme = Theme.of(context);
    return AppBar(
      elevation: 0.0,
      title: Text(
        'User Name',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
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
    );
  }

  Widget body(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          sendMessageBar(context),
        ],
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
                      hintText: 'Send a message..',
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
