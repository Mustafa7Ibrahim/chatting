// import 'package:chat_fire/auth/authService.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatCollection {
//   // make an object of auth services
//   AuthService _authService = AuthService();

//   // get the current date
//   DateTime dateTime = DateTime.now();

//   // make a collection for chat
//   final CollectionReference _chatCollection =
//       Firestore.instance.collection('chat');

//   // make a messages collection inside the chat collection
//   final CollectionReference _messagesCollection = Firestore.instance
//       .collection('chat')
//       .document('messages')
//       .collection('messages');

//   // send message
//   Future sendMessage({String createdAt, String uid, String content}) async {
//     return await _messagesCollection.document(uid).setData({
//       'uid': uid,
//       'createdAt': createdAt,
//       'content': content,
//     });
//   }

//   // get the data from snapshot
//   Chat _chatDataFromSnapshot(DocumentSnapshot snapshot) {
//     return Chat(
//       count: snapshot.data['count'] ?? '',
//       createdAt: snapshot.data['createdAt'] ?? '',
//       messages: snapshot.data['messages'] ?? '',
//       uid: snapshot.data['uid'] ?? '',
//     );
//   }

//   //get the latest message form firestore snapshot
//   List<Messages> _messagesListFromSnapshot(QuerySnapshot snapshot) {
//     return snapshot.documents.map((doc) {
//       return Messages(
//         uid: doc.data['uid'] ?? '',
//         createdAt: doc.data['createdAt'] ?? '',
//         content: doc.data['content'] ?? '',
//       );
//     }).toList();
//   }

//   // create a messages stream to get the last masseges
//   Stream<List<Messages>> get messages {
//     return _messagesCollection.snapshots().map(_messagesListFromSnapshot);
//   }

//   // create a stream to get the chat data
//   Stream<Chat> get chatData {
//     return _chatCollection
//         .document(_authService.uid)
//         .snapshots()
//         .map(_chatDataFromSnapshot);
//   }
// }
