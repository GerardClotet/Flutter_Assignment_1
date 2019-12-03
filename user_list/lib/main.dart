import 'dart:convert' as prefix0;
import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

//import 'package:htt'
void main() => runApp(UserListApp());

class UserListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('User List')),
        body: UserList(),
      ),
    );
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class User {
  //classe apart
  String fullname, username, photoUrl;
  User(this.fullname, this.username, this.photoUrl);
  User.fromJson(Map<String, dynamic> json) {
    fullname =
    json['name']['first'] +
        '' +
        json['name']['last']; // : operator used in maps
    username =
    json['login']['username'];
    photoUrl =
    json['picture']['medium']; //agafes name i value amb el map
  }
}

class _UserListState extends State<UserList> {
  bool loading;
  List<User> users;
  void initState() {
    users = [];
    loading = true;
    _loadUsersData();
    _loadUser();

    super.initState();
  }

  Future<String> _loadUsersData() async {
    return await rootBundle.loadString('assets/UserList.json');
  }

  void _loadUser() async {
    String jsonString = await _loadUsersData();
    final json = prefix0.json.decode(jsonString);
    List<User> _users = [];
    for (var json_user in json['results']) {
      _users.add(User.fromJson(json_user));
    }
    setState(() {
      users = _users;
      loading = false;
      log(_users.length.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users[index].fullname),
          subtitle: Text(users[index].username),
        );
      },
      itemCount: users.length,
    );
  }
}
