import 'package:chat_fire/screens/chat/chatting.dart';
import 'package:chat_fire/shared/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final users = Provider.of<List<User>>(context) ?? [];

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
          child: StreamBuilder(
              stream: Firestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    padding: EdgeInsets.only(top: 18, bottom: 18),
                    itemBuilder: (context, index) =>
                        userTile(context, snapshot.data.documents[index]),
                  );
                }
              }),
        ),
      ),
    );
  }

  Widget userTile(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      contentPadding: EdgeInsets.only(bottom: 12, right: 18, left: 18),
      leading: CircleAvatar(
        radius: 26.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      title: Text(document['userName']),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Chatting(
              peerId: document.documentID,
              peerAvatar: document['photoUrl'],
            ),
          ),
        );
      },
    );
  }
}
