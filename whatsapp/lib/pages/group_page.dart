import 'package:flutter/material.dart';
import 'package:whatsapp/db.dart' as db;
import 'package:whatsapp/model/group.dart';
import 'package:whatsapp/widgets/group_tile.dart';

class GrouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Whatsapp")),
      body: StreamBuilder(
        stream: db.getGroups(),
        builder: (context, AsyncSnapshot<List<Group>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(backgroundColor: Colors.red),
              ),
            );
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<Group> groups = snapshot.data;
          return ListView.separated(
            itemCount: groups.length,
            itemBuilder: (context, index) {
              final Group group = groups[index];
              return GroupTile(group: group);
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 1,
                indent: 70,
                endIndent: 15,
              );
            },
          );
        },
      ),
    );
  }
}
