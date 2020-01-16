import 'package:flutter/material.dart';
import 'package:whatsapp/model/group.dart';

class GroupTile extends StatelessWidget {
  final Group group;

  const GroupTile({this.group});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.of(context).pushNamed('/chat',arguments: group);
      },
      leading: Container(
        width: 45,
        decoration: BoxDecoration(
          color: Colors.teal[100],
          shape: BoxShape.circle,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(group.name),
          Text('19/1/20',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ))
        ],
      ),
      subtitle: Text(group.id),
    );
  }
}
