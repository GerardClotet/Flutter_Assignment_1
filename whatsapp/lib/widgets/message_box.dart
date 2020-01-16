import 'package:flutter/material.dart';

class MessageBox extends StatefulWidget {
  final Function onSend;
  MessageBox({this.onSend});

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose(); // antimemory leaks
    super.dispose();
  }

  _send(String text) {
    widget.onSend(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Material(
            elevation: 2,
            shape: StadiumBorder(),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: TextField(
                  controller: _controller,
                  onSubmitted: widget.onSend,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  )),
            ),
          )),
          SizedBox(width: 7),
          Material(
            color: Theme.of(context).primaryColor,
            shape: CircleBorder(),
            elevation: 2.0,
            child: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                _send(_controller.text);
              },
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
