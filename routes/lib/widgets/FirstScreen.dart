import 'package:flutter/material.dart';

class PrimeraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to second Screen'),
          onPressed: () {
            Navigator.of(context).pushNamed('two');
          },
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
