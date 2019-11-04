import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            height: 250,
            width: 250,
            color: Colors.grey,
            child: Align(
              alignment: Alignment.lerp( //lot of options , not just lerp
                  Alignment.topCenter, Alignment.bottomLeft, 0.5), 
              child: Container(
                width: 80,
                height: 80,
                color: Colors.red,
              ),
            ),

            
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(Screen());
}
