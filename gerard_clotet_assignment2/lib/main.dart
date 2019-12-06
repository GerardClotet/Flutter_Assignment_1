import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerard_clotet_assignment2/shop_cart.dart' as cartts;
import 'dart:convert';
import 'apartments.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Apartments'),
        ),
        body: LocationsList(),
      ),
    );
  }
}

class LocationsList extends StatefulWidget {
  @override
  _LocationsListState createState() => _LocationsListState();
}

class _LocationsListState extends State<LocationsList> {
  bool loading;
  List<Apartment> apartments;
  @override
  void initState() {
    apartments = [];
    loading = true;
    _loadApartments();
    super.initState();
  }

  void _loadApartments() async {
    WidgetsFlutterBinding.ensureInitialized();
    String jsonStr = await rootBundle.loadString('assets/apartments.json');

    Map<String, dynamic> json = jsonDecode(jsonStr);
    List<Apartment> _apart = [];
    for (var json_apartment in json['houses']) {
      _apart.add(Apartment.fromjson(json_apartment));
    }
    setState(() {
      apartments = _apart;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(child: CircularProgressIndicator());
    }
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (context2) => cartts.ShopCartPage()))
                  .then((data) {
                setState(() {});
              }); //Pantalla que mira la shoplist
            },
          ),
        ),
        Expanded(
          flex: 8,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(apartments[index].username),
                subtitle: Text(apartments[index].loc_name),
                leading: CircleAvatar(
                    backgroundImage: AssetImage(apartments[index].profile_pic)),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context2) => Base(apartments, index)))
                      .then((info) {});
                },
              );
            },
            itemCount: apartments.length,
          ),
        ),
      ],
    );
  }
}
