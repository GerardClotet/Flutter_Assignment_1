import 'package:flutter/material.dart';
import 'package:whatsapp/model/group.dart';

import 'group_tile.dart';

class GroupList extends StatelessWidget {
  const GroupList({@required this.groups});

  final List<Group> groups;

  @override
  Widget build(BuildContext context) {
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
  }
}
