import 'package:flutter/material.dart';
import 'package:whatsapp/model/message.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget(this.msg);

  final Message msg;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.all(Radius.circular(4)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
            child: Text(msg.text),
          ),
          Text(msg.dateTime.toString()),
        ],
      ),
    );
  }
}
