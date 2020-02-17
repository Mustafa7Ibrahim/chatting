import 'package:chat_fire/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatDatabase {
  // an instance of firestore
  final CollectionReference _usersCollection =
      Firestore.instance.collection('users');

  List<User> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((names) {
      return User(
        name: names.data['userName'] ?? '',
      );
    }).toList();
  }

  Stream<List<User>> get users {
    return _usersCollection.snapshots().map(_userListFromSnapshot);
  }
}
