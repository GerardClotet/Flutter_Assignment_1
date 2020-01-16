import 'package:flutter/material.dart';
import 'package:whatsapp/db.dart' as db;
import 'package:whatsapp/model/group.dart';
import 'package:whatsapp/widgets/group_list.dart';
import 'package:whatsapp/widgets/loading.dart';
import 'package:whatsapp/widgets/red_error.dart';

class GroupListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Whatsapp")),
      body: StreamBuilder(
        stream: db.getGroups(),
        builder: (context, AsyncSnapshot<List<Group>> snapshot) {
          if (snapshot.hasError) {
            return RedError(snapshot.error);
          }
          if (!snapshot.hasData) {
            return Loading();
          }
          List<Group> groups = snapshot.data;
          return GroupList(groups: groups);
        },
      ),
    );
  }
}


