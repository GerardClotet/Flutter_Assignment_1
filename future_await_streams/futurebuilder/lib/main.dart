import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

Future<String> _cargaDatos() async{
  await Future.delayed(Duration(seconds: 5));
  return await rootBundle.loadString('assets/datos.txt');
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Future Builder')),
          body: FutureBuilder(
            future: _cargaDatos(),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text('ERROR: ${snapshot.error.toString()}'));
              }
              if (!snapshot.hasData) {
                //
                return Center(child: CircularProgressIndicator());
              }
              return Center(child: Text(snapshot.data));
            },
          )),
    );
  }
}
