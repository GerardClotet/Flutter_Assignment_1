import 'package:cloud_firestore/cloud_firestore.dart';


class User{

  String username, fullname;
  bool admin;

  User.fromFirestore(DocumentSnapshot doc)
  : username = doc.data['username'],
  fullname = doc.data['nom complet'],
  admin = doc.data['admin'];

  Map<String,dynamic> toFriestore() =>{ 
    'username' : username,
    'fullname' : fullname,
    //'admin' : admin, //MAYBE FAILS
  };
}

List<User> toUserList(QuerySnapshot query){

  return query.documents.map((doc) => User.fromFirestore(doc)).toList();
}