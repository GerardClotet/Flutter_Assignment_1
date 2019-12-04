import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo_list/path_provider.dart';


void main() {
  runApp(
    MaterialApp(
      home: TodoListPage(),
    ),
  );
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class Todo {
  String what;
  bool done;
  Todo(this.what) : done = false;

  Todo.fromJson(Map<String, dynamic> json)
      : what = json['what'],
        done = json['done'];

  Map<String, dynamic> toJson() => {
        'what': what,
        'done': done,
      };
}

/*

[
  { "what": "Aprendre Flutter", "done": true }, --> Map<String, dynamic>
  { "what": "Preparar Parcial", "done": false }, --> Map<String, dynamic>
] --> List

*/

class _TodoListPageState extends State<TodoListPage> {
  List<Todo> _todos; // Model

  @override
  void initState() {
    _loadTodos();
    super.initState();
  }

  Future<void> _loadTodos() async {
    await Future.delayed(Duration(seconds: 5));
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/todo.json');
      String fileContents = await file.readAsString();
      List json = jsonDecode(fileContents);
      List<Todo> loaded = [];
      for (var elem in json) {
        loaded.add(Todo.fromJson(elem));
      }
      super.setState(() => _todos = loaded);
    } catch (e) {
      print("ERROR: No he pogut llegir els todos!");
      super.setState(() => _todos = []);
    }
  }

  Future<void> _writeTodos() async {
    Directory dir = await getApplicationDocumentsDirectory();
    File file = File('${dir.path}/todo.json');
    var json = jsonEncode(_todos);
    // print(json);
    await file.writeAsString(json);
  }

  @override
  void setState(fn) {
    super.setState(fn);
    _writeTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _maybeEraseChecked,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (_) => NewTodoPage(),
            ),
          )
              .then((what) {
            setState(() {
              _todos.add(Todo(what));
            });
          });
        },
      ),
      body: (_todos == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _todos[index].done = !_todos[index].done;
                    });
                  },
                  child: ListTile(
                    leading: Checkbox(
                      value: _todos[index].done,
                      onChanged: (bool isChecked) {
                        setState(() {
                          _todos[index].done = isChecked;
                        });
                      },
                    ),
                    title: Text(
                      _todos[index].what,
                      style: TextStyle(
                        decoration: (_todos[index].done
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                      ),
                    ),
                  ),
                );
              },
            )),
    );
  }

  void _maybeEraseChecked() {
    showDialog(
      context: context,
      builder: (innerContext) => AlertDialog(
        title: Text('Confirmation'),
        content: Text(
          'Are you sure you want to delete the checked items?',
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(innerContext).pop(false);
            },
            child: Text('Cancel'),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(innerContext).pop(true);
            },
            child: Text('Erase'),
          )
        ],
      ),
    ).then((erase) {
      if (erase) {
        _eraseChecked();
      }
    });
  }

  void _eraseChecked() {
    List<Todo> pending = [];
    for (var todo in _todos) {
      if (!todo.done) pending.add(todo);
    }
    setState(() {
      _todos = pending;
    });
  }
}

class NewTodoPage extends StatefulWidget {
  @override
  _NewTodoPageState createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Todo...'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              onSubmitted: (text) {
                Navigator.of(context).pop(text);
              },
            ),
            RaisedButton(
              child: Icon(Icons.save),
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


// void main() => runApp(TodoListApp());

// class TodoListApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home:  TodoListPage(),
//     );
//   }
// }

// class Todo {
//   String what;
//   bool done;
//   //al constructor se li pasa
//   //el que s'ha de fer i el done es posa en false pq no esta fet
//   Todo(this.what) : done = false;

//   Todo.fromJson(Map<String, dynamic> json)
//       : what = json['what'],
//         done = json['done'];

//   Map<String, dynamic> toJson() => {
//         'what': what,
//         'done': done,
//       };
//   void toggleDone() => done = !done;
// }

// class TodoListPage extends StatefulWidget {
//   const TodoListPage({
//     Key key,
//   }) : super(key: key);

//   @override
//   _TodoListPageState createState() => _TodoListPageState();
// }

// class _TodoListPageState extends State<TodoListPage> {
//   List<Todo> _todos;
//   int get _doneCount => _todos.where((todo) => todo.done).length;
//   @override
//   void initState() {
//     _readTodos();
//     super.initState();
//   }

//  Future<void> _readTodos() async {
//     try {
//       Directory dir = await getApplicationDocumentsDirectory();
//       print(dir.path);
//       File file = File('${dir.path}/todos.json');
//       List json = jsonDecode(await file.readAsString());
//       List<Todo> todos = [];

//       for (var item in json) {
//         todos.add(Todo.fromJson(item));
//       }

//       super.setState(() => _todos = todos);
//     } catch (e) {
//       // si no troba el fitxer tel crea , amb la llista buida pq sino petaria despre, intentaria llegir algo k no existeix
//       print('error reading, unexisting file? ');
//       setState(() => _todos = []);
//     }
//   }

//   @override
//   void setState(fn) {
//     //cada cop que hi hagi un set state es guarda el json
//     super.setState(fn);
//     _writeTodos();
//   }

//  Future<void> _writeTodos() async {
//     try {
//       Directory dir = await getApplicationDocumentsDirectory();
//       File file = File('${dir.path}/todos.json');
//       String jsonText = jsonEncode(_todos);
//       print(jsonText);
//       await file.writeAsString(jsonText);
//     } catch (e) {
//       Scaffold.of(context).showSnackBar(SnackBar(
//         content: Text('Error saving'),
//       ));
//     }
//   }

//   _removeChecked() {
//     List<Todo> pending = [];
//     for (var todo in _todos) {
//       if (!todo.done) pending.add(todo);
//       //millor no modificar la llista original dintre del for i igualarla mes tard
//     }

//     setState(() => _todos = pending); //aqui
//   }

//   _buildList() {
//     if (_todos == null) {
//       return Center(child: CircularProgressIndicator());
//     }
//     return ListView.builder(
//       itemCount: _todos.length,
//       itemBuilder: (context, index) => InkWell(
//         onTap: () {
//           setState(() => _todos[index].toggleDone());
//         },
//         child: ListTile(
//           leading: Checkbox(
//             value: _todos[index].done, //per funcionar checkbox necessita valor
//             onChanged: (checked) {
//               setState(() => _todos[index].done = checked);
//             },
//           ),
//           title: Text(
//             _todos[index].what,
//             style: TextStyle(
//                 decoration: (_todos[index].done
//                     ? TextDecoration.lineThrough
//                     : TextDecoration.none)),
//           ), //per tachar
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     _maybeRemoveChecked() {
//       if (_doneCount == 0) return;

//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Confirmation'),
//           content: Text('Seguro que quieres borrar los marcados?'),
//           actions: <Widget>[
//             FlatButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop(false);
//               },
//             ),
//             FlatButton(
//               child: Text('Delete'),
//               onPressed: () {
//                 Navigator.of(context).pop(true);
//               },
//             )
//           ],
//         ),
//       ).then(
//         (remove) {
//           if (remove) _removeChecked();
//         },
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TODO LIST'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.delete),
//             onPressed:
//                 _maybeRemoveChecked, //si es posa removecheclec() la ho borrara tot perque sempre ho cridara
//           )
//         ],
//       ),
//       body: _buildList(),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.of(context)
//               //en comptes de (context), s'utilitza (_), pq a la funcio Newtodopage el context no s'utilitza
//               .push(MaterialPageRoute(builder: (_) => NewTodoPage()))
//               .then((what) {
//             setState(() {
//               _todos.add(Todo(what));
//             });
//           });
//         },
//       ),
//     );
//   }
// }

// class NewTodoPage extends StatefulWidget {
//   @override
//   _NewTodoPageState createState() => _NewTodoPageState();
// }

// class _NewTodoPageState extends State<NewTodoPage> {
//   TextEditingController _controller;
//   @override
//   void initState() {
//     _controller = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     //es crida quan el widget es borra (ex cnavi de pantalla etc, tmbe s'ha de fer el dispose del textediting)
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('New Todo')),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _controller,
//               onSubmitted: (what) {
//                 Navigator.of(context).pop(
//                     what); //Aqui es retorna amb el what pq es el que esta ompplert en el textfield
//               },
//             ),
//             RaisedButton(
//               child: Text('Add'),
//               onPressed: () {
//                 Navigator.of(context).pop(_controller
//                     .text); //Aqui es retorna a la pantalla anterior amb el text del controller pq la variable what no la tenim plena
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
