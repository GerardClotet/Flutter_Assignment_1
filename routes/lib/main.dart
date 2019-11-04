import 'package:routes/widgets/FirstScreen.dart';
import 'package:routes/widgets/SecondScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RutasApp());
}



class RutasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightBlue),

      routes: {
        'one': (context) => PrimeraScreen(),
        'two': (context) => SegonaScreen(),
      },
      initialRoute: 'one',
    );
  }
}


//PART2




//PART1


// class RutasApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(primarySwatch: Colors.lightBlue),
//       home: FirstScreen(),
//     );
//   }
// }


// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Primera Pantalla'),
//         actions: <Widget>[
//           Expanded(
//             child: Container(
//               color: Colors.teal,
//             ) ,
//           ),
//           Expanded(
//             child: Container(
//               color: Colors.red,
//             ),
//           )
//         ],
//       ),
    
//       body: Center(
//         child: RaisedButton(
//           child: Text('open second screen'),
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute( //go to the next pagefounded
//               builder: (context) => SecondScreen(), //set the buildcontext to the following screen
//             ));
//           },
//         ),
//       ),
//     );
//   }
// }

// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Segunda Pantalla'),
//       ),
//       body: Center(
//         child: RaisedButton(
//           child: Text('Back'),
//           onPressed: (){
//             Navigator.of(context).pop(); //return to the previus buildcontext page
//           },
//         ),
//       ),
//     );
//   }
// }
