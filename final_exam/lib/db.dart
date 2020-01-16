import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam/user.dart';


Stream<List<User>> getUser(){

  return Firestore.instance.collection('users').snapshots().map(toUserList);
}


Future<void> newUser(String id, User user) async{

  await Firestore.instance.collection('users/').add(user.toFriestore());
}