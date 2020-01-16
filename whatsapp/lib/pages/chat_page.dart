import 'package:flutter/material.dart';
import 'package:whatsapp/db.dart' as db;
import 'package:whatsapp/model/group.dart';
import 'package:whatsapp/model/message.dart';
import 'package:whatsapp/widgets/loading.dart';
import 'package:whatsapp/widgets/message_box.dart';
import 'package:whatsapp/widgets/message_list.dart';
import 'package:whatsapp/widgets/red_error.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Group group = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(group.name)),
      backgroundColor: Colors.teal[100],
      body: StreamBuilder(
        stream: db.getGroupMessages(group.id),
        builder: (context, AsyncSnapshot<List<Message>> snapshot) {
          if (snapshot.hasError) {
            return RedError(snapshot.error);
          }

          if (!snapshot.hasData) {
            return Loading();
          }

          return Stack(
            children: <Widget>[
              LayoutBuilder(
                builder: (context, BoxConstraints constraints) {
                  return Image.asset(
                    'assets/background.jpg',
                    width: constraints.maxWidth,
                    fit: BoxFit.cover,
                  );
                },
              ),
              Column(
                children: <Widget>[
                  Expanded(
                    child: MessageList(messages: snapshot.data),
                  ),
                  MessageBox(onSend: (text) {
                    db.sendMessage(group.id, Message(text));
                  })
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
