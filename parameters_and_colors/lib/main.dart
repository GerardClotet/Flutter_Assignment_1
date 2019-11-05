import 'package:flutter/material.dart';

void main() => runApp(ColorEditApp());

class ColorEditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      routes: {
        '/': (context) => ColorScreen(),
        '/edit': (context) => EditColorScreen(),
      },
      // initialRoute: 'one',
    );
  }
}

class ColorScreen extends StatefulWidget {
  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  Color _color = Color.fromARGB(255, 255, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: RaisedButton(
            child: Text('Change'),
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/edit',
                arguments: _color, //Enviar Argumentos
              ).then((result){
                if(result != null)
                {
                  setState(() {
                   _color = result; 
                  });
                }
              });
            },
          ),
        ),
      ),
    );
  }
}

class EditColorScreen extends StatefulWidget {
  @override
  _EditColorScreenState createState() => _EditColorScreenState();
}

class _EditColorScreenState extends State<EditColorScreen> {
  List<TextEditingController> _controllers;

 

  @override
  void didChangeDependencies() { //no deixa inicialitzar am initState
      // 2 Recibir Argumentos

    final Color color = ModalRoute.of(context).settings.arguments;
    final List<String> channesl = [
      color.red.toString(),
      color.green.toString(),
      color.blue.toString()
    ];
     _controllers = [
      for (int i = 0; i < 3; i++) TextEditingController(text: channesl[i]),
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    const List<String> colors = ['red', 'green', 'blue'];
    return Scaffold(
      appBar: AppBar(
        title: Text('EditColor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                for (int i = 0; i < 3; ++i)
                  (Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _controllers[i],
                        decoration: InputDecoration(labelText: colors[i]),
                        keyboardType:  TextInputType.number,
                      ),
                    ),
                  ))
              ],
            ),
            RaisedButton(
              child: Text('Save'),
              onPressed: () {
                final int r = int.parse(_controllers[0].text);
                final int g = int.parse(_controllers[1].text);
                final int b = int.parse(_controllers[2].text);
                Navigator.of(context).pop((Color.fromARGB(255, r, g, b)));
              },
            )
          ],
        ),
      ),
    );
  }
}

//PASS STRING INFO BETWEEN SCENES/widgets
class TextEditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: new TextScreen(),
    );
  }
}

class TextScreen extends StatefulWidget {
  const TextScreen({
    Key key,
  }) : super(key: key);

  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  String _texto = 'Canviable';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Edit'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(_texto),
            RaisedButton(
              child: Text('Edit'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => EditScreen(_texto),
                ))
                    .then((result) {
                  //resultat que tindras quan hi hagi el callback de pop que retorna el text
                  if (result != null) {
                    setState(() {
                      _texto = result;
                    });
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class EditScreen extends StatefulWidget {
  final String texto;
  EditScreen(this.texto);
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController(text: widget.texto);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit text'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(controller: _controller), //ntext input
            RaisedButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop(_controller.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
