import 'package:flutter/material.dart';

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
class User{
  String fullname,username,photoUrl;
  User(this.fullname,this.username,this.photoUrl);
}
class _UserListState extends State<UserList> {
  List<User> users;
  @override
  void initState() {
    users = [
    User('Yo','tu','ells'),
    User('1','2','3'),
    User('z','a','d'),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users[index].fullname),
          subtitle: Text(users[index].username),
          leading: Icon(Icons.zoom_in),
        );
      },
      itemCount: users.length,
    );
  }
}
