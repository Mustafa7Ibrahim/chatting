class Chat {
  final String count;
  final String createdAt;
  final String messages;
  final String uid;

  Chat({this.uid, this.count, this.createdAt, this.messages});
}

class Messages {
  final String uid;
  final String createdAt;
  final String content;

  Messages({this.createdAt, this.uid, this.content});
}
