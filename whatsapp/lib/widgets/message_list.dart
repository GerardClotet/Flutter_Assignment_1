import 'package:flutter/material.dart';
import 'package:whatsapp/model/message.dart';

import 'message_widget.dart';

class MessageList extends StatelessWidget {
  const MessageList({@required this.messages});

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
      //  final Message msg = messages[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(16,0,16,8),
          child: MessageWidget(messages[index]),
        );
      },
    );
  }
}

