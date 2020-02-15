import 'package:chat_fire/screens/chat/chatting.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).accentColor,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(30.0),
                topRight: const Radius.circular(30.0),
              )),
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    title: Text('User Name'),
                    subtitle: Text('it\'s just a sample message form a user!'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chatting(),
                          ));
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
