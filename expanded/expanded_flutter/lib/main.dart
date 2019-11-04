import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(color: Colors.red),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.purple,
        height: 100,
                ),
              )
            ],
          ),
          Expanded(
            flex: 1, //ratio
            child: Container(
              color: Colors.blue,
              
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green,
            ),
          ),
        ],
      ),
    ));
  }
}

void main() {
  runApp(Screen());
}
