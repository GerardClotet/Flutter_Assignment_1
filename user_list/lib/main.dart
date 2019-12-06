import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class User {
  //classe apart
  String fullname, username, photoUrl;
  User(this.fullname, this.username, this.photoUrl);
  User.fromJson(Map<String, dynamic> json)
      : fullname = json['name']['first'] + ' ' + json['name']['last'],
        username = json['login']['username'],
        photoUrl = json['picture']['medium'];
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  bool loading;
  List<User> users;
  void initState() {
    users = [];
    loading = true;
    
    _loadUser();

    super.initState();
  }

  

  void _loadUser() async {

    
    final respones = await http.get('https://randomuser.me/api/?results=20');
    final json = jsonDecode(respones.body);


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

  //aqui es el return
  @override
  Widget build(BuildContext context) {
    if(loading)
    {
      return Center(child : CircularProgressIndicator());
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users[index].fullname),
          subtitle: Text(users[index].username),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(users[index].photoUrl),
          ),
        );
      },
      itemCount: users.length,
    );
  }
}
