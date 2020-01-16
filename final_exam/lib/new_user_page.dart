import 'package:final_exam/info_box.dart';
import 'package:final_exam/user.dart';
import 'package:flutter/material.dart';
import 'db.dart' as db;

class NewUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Column(
        children: <Widget>[
          InfoBox(onSend: (text) {
            user.fullname = text;
            db.newUser(user.username, user);
          }),
          Text('Full Name'),
          SizedBox(height: 10),
          InfoBox(onSend: (text) {
            user.username  = text;

          }),

          Text('Username'),

          IconButton(
            icon: Icon(Icons.send),
            onPressed: (){

               if(user.fullname.length != 0 && user.username.length != 0) 
           { 
              db.newUser('testing', user);
           }
            },
          )


         
        ],
      ),
    );
  }
}
