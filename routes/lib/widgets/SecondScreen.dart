import 'package:flutter/material.dart';

class SegonaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to first Screen'),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
