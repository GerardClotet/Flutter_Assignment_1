import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: FirstScreen(),
    ),
  );
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  HorariList _horariList;
  @override
  void initState() {
    _horariList = HorariList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultes'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 20,
            child: Container(
              color: Colors.blue[200],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Horari escollit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    FlatButton(
                      color: Colors.blue[50],
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.create),
                          Text('Canviar'),
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => SecondScreen(),
                          ),
                        )
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              _horariList = value;
                            });
                          }
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 80,
            child: (_horariList.horariListSize != 0
                ? ListView.separated(
                    itemCount: _horariList.horariListSize,
                    itemBuilder: (context, index) {
                      final Horari horari = _horariList.getHorari(index);
                      return ListTile(
                        title: Row(
                          children: <Widget>[
                            Text('${horari.dia} a les ${horari.hora}h'),
                            Spacer(),
                            FlatButton(
                              child: Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _horariList.deleteHorari(index);
                                });
                              },
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.grey[300],
                      );
                    },
                  )
                : Text(
                    'No has escollit horaris',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    
                  )),
          ),
        ],
      ),
    );
  }
}

class Horari {
  final String dia;
  final int hora;
  Horari(this.dia, this.hora);
  // String toString() => '$dia a les ${hora}h';
}

class HorariList {
  List<Horari> _hoarilist = [];

  get horariListSize => _hoarilist.length;

  Horari getHorari(int index) => _hoarilist[index];

  void addHorari(Horari h) {
    _hoarilist.add(h);
  }

  void deleteHorari(int index) {
    _hoarilist.removeAt(index);
  }
}

class HorariFull {
  final String dia;
  final int hora;
  bool checked = false;
  HorariFull(this.dia, this.hora, this.checked);
}

class HorariListFull {
  static List<String> dies = [
    'Dilluns',
    'Dimarts',
    'Dimecres',
    'Dijous',
    'Divendres',
  ];
  static List<int> hores = [8, 10, 12, 15, 17, 19];
  List<HorariFull> _hoarilistfull = [
    for (int i = 0; i < dies.length; i++)
      for (int j = 0; j < hores.length; j++)
        HorariFull(dies[i], hores[j], false),
  ];
  final bool checked = false;
  get horariListFullSize => _hoarilistfull.length;
  HorariFull getHorari(int index) => _hoarilistfull[index];
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  HorariListFull _horariListFull;
  HorariList _horariList;
  @override
  void initState() {
    _horariListFull = HorariListFull();
    _horariList = HorariList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text('Escull un horari...'),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.check,
              ),
              onPressed: () {
                for (int i = 0; i < _horariListFull.horariListFullSize; i++) {
                  if (_horariListFull.getHorari(i).checked) {
                    _horariList.addHorari(Horari(
                        _horariListFull.getHorari(i).dia,
                        _horariListFull.getHorari(i).hora));
                  }
                }
                Navigator.of(context).pop(
                  _horariList,
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.separated(
          itemCount: _horariListFull.horariListFullSize,
          itemBuilder: (context, index) {
            final HorariFull horarifull = _horariListFull.getHorari(index);

            return ListTile(
              leading: Checkbox(
                value: horarifull.checked,
                onChanged: (bool value) {
                  setState(() {
                    horarifull.checked = value;
                  });
                },
              ),
              title: Text('${horarifull.dia} a les ${horarifull.hora}h'),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey[300],
            );
          }),
    );
  }
}
