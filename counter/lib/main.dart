import 'package:flutter/material.dart';

// -----COUNTER-----//
//------------------//
// void main() {
//   runApp(CounterApp());
// }

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CounterApp'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Veces que has apretado el boton'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}
//------------------//
// -----COUNTER-----//

void main() {
  runApp(MuestrarioApp());
}

class MuestrarioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Muestrario de Botones'),
        ),
        body: GridView.count(
          // et fa grid automatica
          crossAxisCount: 2,
          childAspectRatio: 4 / 3,
          children: <Widget>[
            Muestra(
              child: RaisedButton(
                child: Text('Apretame'),
                onPressed: () {
                  print('Apretao');
                },
              ),
              text: 'RaisedButton clasico',
            ),
            Muestra(
              child: RaisedButton(
                child: Text('Apretame'),
                onPressed: () {
                  print('Apretao');
                },
                color: Colors.blue,
                textColor: Colors.white,
              ),
              text: 'RaisedButton color',
            ),
            Muestra(
              child: RaisedButton(
                //No tiene la funcion onPressed -> el boton esta desactivado
                child: Text('Apretame'),
              ),
              text: 'RaisedButton desactivado',
            ),
            Muestra(
              child: FlatButton(
                onPressed: () {},
                child: Text('Apretame'),
              ),
              text: 'FlatButton',
            ),
            Muestra(
              child: FlatButton(
                onPressed: () {},
                child: Text('Apretame'),
                color: Colors.orange,
                textColor: Colors.white,
              ),
              text: 'FlatButton color',
            ),
            Muestra(
              child: OutlineButton(
                onPressed: () {},
                child: Text('Apretame'),
                // color: Colors.orange,
              ),
              text: 'OutlineBUtton',
            ),
            Muestra(
              child: OutlineButton(
                onPressed: () {},
                child: Text('Apretame'),
                shape: StadiumBorder(),
                // color: Colors.orange,
              ),
              text: 'OutlineBUtton stadium border',
            ),
            Muestra(
              child: OutlineButton.icon(
                icon: Icon(Icons.add_circle),
                label: Text('Add Circle'),
                onPressed: () {},
                shape: StadiumBorder(),
              ),
              text: 'OutlineBUtton icon stadium border',
            ),
            Muestra(
              child: OutlineButton.icon(
                icon: Icon(Icons.add_circle),
                label: Text('Add Circle'),
                onPressed: () {},
                shape: StadiumBorder(),
                highlightColor: Colors.green[100],
              ),
              text: 'OutlineBUtton icon stadium border y hover green',
            ),
            Muestra(
              child: IconButton(
                icon: Icon(Icons.panorama),
                onPressed: () {},
                tooltip: 'Panorama',
              ),
              text: 'Icon button & tooltip',
            ),
            Muestra(
              child: BackButton(),
              text: 'Icon button & tooltip',
            ),
            Muestra(
              child: CloseButton(),
              text: 'Icon button & tooltip',
            ),
            Muestra(
              child: FloatingActionButton(
                onPressed: (){},
                child: Icon(Icons.query_builder),
              ),
              text: 'Icon button & tooltip',
            ),
          ],
        ),
      ),
    );
  }
}

class Muestra extends StatelessWidget {
  final Widget child;
  final String text;
  const Muestra({
    Key key,
    @required this.child,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              this.child,
              SizedBox(
                height: 10,
              ),
              Text(
                this.text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
