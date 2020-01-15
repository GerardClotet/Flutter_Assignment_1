import 'package:flutter/material.dart';

void main() => runApp(App());

Stream<int> countdown(int from, int to) async* {

  await Future.delayed(Duration(seconds: 1));
  yield from;
  for (int i = from - 1; i >= to; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // devuelve un valor en el strem y sigue ejecutando estya funcion
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('streambuilder')),
        body: StreamBuilder(
          stream: countdown(10, 0),
          builder: (context, AsyncSnapshot<int> snpashot) {
            if (snpashot.hasError) {
              return Center(child: Text('Error: ${snpashot.error.toString()}'));
            }
            switch (snpashot.connectionState) {
              case ConnectionState.none:
                return Center(child: Text('none'));
                break;
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
                break;
              case ConnectionState.active:
                return Center(
                    child: Text(
                  '${snpashot.data}',
                  style: TextStyle(fontSize: 60),
                ));
                break;
              case ConnectionState.done:
                return Center(child: Text('done'));
                break;
            }

            return null; // tema del llenguatge que et demana retornar algo si o si
          },
        ),
      ),
    );
  }
}
