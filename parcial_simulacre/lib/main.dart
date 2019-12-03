import 'package:flutter/material.dart';
import 'package:parcial_simulacre/contador.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen() ,
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final int counter=0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simulacre Parcial'),
      ),

      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 4/3,
        children: <Widget>[
          Card( 
            child: FlatButton(
              child: Text('aqui counter'), //aqui anira counter particular
              onPressed: ()
              {
                
              },
              
            ),
          )
        ],
      ),
    );
  }
}
