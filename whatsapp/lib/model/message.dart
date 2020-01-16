import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String id, text, userID;
  DateTime dateTime;

  Message.fromFirestore(DocumentSnapshot doc)
      : id = doc.documentID,
        text = doc.data['text'],
        dateTime = (doc.data['datetime'] as Timestamp).toDate();


Map<String,dynamic> toFirestore() =>{
  'text' : text,
  'datetime' : dateTime,
};
        Message(this.text) : dateTime = DateTime.now();
}

List<Message> toMessageList(QuerySnapshot query) {
  return query.documents.map((doc) => Message.fromFirestore(doc)).toList();
}
