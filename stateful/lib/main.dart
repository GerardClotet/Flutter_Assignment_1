import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NoState(),
          ConEstado(),
        ],
      ),
    );
  }
}

class NoState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text('NoState'),
      ),
    );
  }
}

class ConEstado extends StatefulWidget {
  //stateful no es estatico permite canviar mientras runApp esta activo
  @override
  State<StatefulWidget> createState() => Estado();
  //State<StatefulWidget> CreateState() => Estado();

}

class Estado extends State<ConEstado/*Classe derivada de statefulwidget*/> { 
  // classe asociada al estado del stateful widget

  bool active; // = false; una forma

  @override
  void initState() {
    //inicializar el estado
    super.initState();
    active = false;
  }

  @override
  Widget build(BuildContext context) { // la build esta en el estado en si del s
                                      //  tateful widget i no en la propia clase del stateful
    return GestureDetector(
      //detecta cualquier gesto /input etc sobre el widget
      onTap: () {
        setState(() { /*/Todos los canvios de estados se tienen que meter 
        dentro de esta funcion,sino flutter no los detecta*/
          active = !active;
          print('estado $active');
        });
      },

      child: Container(
        height: 200,
        color: (active ? Colors.blue : Colors.grey),
        child: Center(child: Text('conestado')),
      ),
    );
  }
}
