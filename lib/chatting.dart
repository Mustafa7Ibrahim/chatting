import 'package:flutter/material.dart';

class Chatting extends StatefulWidget {
  @override
  _ChattingState createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'User Name',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before,
          ),
          iconSize: 24.0,
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_horiz,
            ),
            iconSize: 24.0,
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              30.0,
            ),
            topRight: Radius.circular(
              30.0,
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(
                    12.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(
                        0xFFFEF9EB,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          30.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.insert_emoticon),
                          iconSize: 25.0,
                          color: Colors.blueGrey,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.keyboard_voice),
                          iconSize: 25.0,
                          color: Colors.blueGrey,
                          onPressed: () {},
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}
