import 'package:final_exam/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () { },
      leading: Container(
        width: 45,
        decoration: BoxDecoration(
          color: Colors.teal[100],
          shape: BoxShape.circle,
        ),
      ),

      title: Text(user.username),
     

      subtitle: Row(
        children: <Widget>[
          Text(user.fullname),
          SizedBox(width: 10,),
          Text('Admin  '+user.admin.toString()),
        ],
      ),
    );
  }
}
