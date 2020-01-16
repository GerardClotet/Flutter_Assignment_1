import 'package:flutter/material.dart';
import 'package:whatsapp/pages/group_list_page.dart';
import 'package:whatsapp/pages/chat_page.dart';

void main() => runApp(FireBaseWhatsApp());

class FireBaseWhatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
       routes: {
         '/' : (context) =>GroupListPage(),
         '/chat' : (context) => ChatPage(),
       },
    );
  }
}

