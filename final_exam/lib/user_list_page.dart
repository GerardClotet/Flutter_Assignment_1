


import 'package:final_exam/user.dart';
import 'package:final_exam/user_list.dart';
import 'package:flutter/material.dart';
import 'db.dart' as db;
class UserListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Final Exam'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed('/new_user');
            },
            

          )
        ],
      ),
      
      body: StreamBuilder(

        stream: db.getUser(),

        builder: (context,AsyncSnapshot<List<User>> snapshot){
          if(snapshot.hasError)
          {
            print('error');
          }

          if(!snapshot.hasData)
          {
            return Center(child: CircularProgressIndicator());
          }

          List<User> users = snapshot.data;
          return UserList(users: users);
        } ),
      );
  }
}