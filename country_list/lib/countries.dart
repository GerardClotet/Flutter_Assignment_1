import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<String> _countries;

void LoadCountries() async {
  WidgetsFlutterBinding.ensureInitialized();
  String jsonStr = await rootBundle.loadString('assets/country.json');
  Map<String, dynamic> json = jsonDecode(jsonStr);
  _countries = json.values.toList().cast<String>();
  _countries.sort();
}

Future<String> chooseCountry(BuildContext context) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context2) => _ChooseCountryPage(),
    ),
  );
}

class _ChooseCountryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esgoe...'),
      ),
      body: ListView.separated(
        itemCount: _countries.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pop(
                  _countries[index]); //retorna de la pagina amb aquest valor
            },
            child: ListTile(
              title: Text(_countries[index]),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.green[300],
          thickness: 1,
          height: 1,
        ),
      ),
    );
  }
}
