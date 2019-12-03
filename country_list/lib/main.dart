import 'package:country_list/countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

void main() {
  LoadCountries();
  runApp(ChooseCountry());
}

class ChooseCountry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Country'),
      ),
      body: Builder(
        builder: (context) => Center(
          child: RaisedButton(
            child: Text('Escoge Pais'),
            onPressed: () {
              chooseCountry(context).then((country) {
                Scaffold.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    //per funcionar necessita que el context del pare es pase com a builder als fills
                    content: Text('Has escogido "$country"'),
                  ));
              });
            },
          ),
        ),
      ),
    );
  }
}
