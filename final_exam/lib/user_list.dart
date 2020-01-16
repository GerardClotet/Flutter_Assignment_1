

import 'package:final_exam/user.dart';
import 'package:final_exam/user_tile.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({@required this.users});

final List<User> users;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: users.length,
      itemBuilder: (context,index){
        final User user = users[index];
        return UserTile(user);
      },
      separatorBuilder: (context,index){

        return Divider(height: 1);
      },
    );
  }
}