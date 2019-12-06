import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

List<CartElem> cart_list = [];





class CartElem {
  String name;
  bool selected;

  CartElem(this.name) : selected = false;

  CartElem.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        selected = json['selected'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'selected': selected,
    };
  }
}

class ShopCartPage extends StatefulWidget {
  @override
  _ShopCartPageState createState() => _ShopCartPageState();
}

class _ShopCartPageState extends State<ShopCartPage> {
  @override
  void initState() {
    _loadCart();

    super.initState();
  }

  Future<void> _loadCart() async {
    await Future.delayed(Duration(seconds: 6));

    try {
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/cart.json');
      String fileContents = await file.readAsString();
      List json = jsonDecode(fileContents);
      List<CartElem> loaded = [];
      for (var elem in json) {
        loaded.add(CartElem.fromJson(elem));
      }

      super.setState(() => cart_list = loaded);
    } catch (e) {
      print('Error, saved shopping cart unexisting');

      //cart_list.clear();
      cart_list = [];
    }
  }

  Future<void> _writeCart() async {
    Directory dir = await getApplicationDocumentsDirectory();
    File file = File('${dir.path}/cart.json');
    var json = jsonEncode(cart_list);
    print(json);
    await file.writeAsString(json);
  }

  @override
  void setState(fn) {
    super.setState(fn);
    _writeCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shop List'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: _maybeEraseChecked,
            )
          ],
        ),
        body: (cart_list == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: cart_list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(
                        () {
                          cart_list[index].selected =
                              !cart_list[index].selected;
                        },
                      );
                    },
                    child: ListTile(
                 leading: Checkbox(
                      value: cart_list[index].selected,
                      onChanged: (bool isChecked) {
                        setState(() {
                          cart_list[index].selected = isChecked;
                        });
                      },
                    ),
                    title: Text(
                      cart_list[index].name,
                      style: TextStyle(
                        decoration: (cart_list[index].selected
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
              title: Text('Confirm'),
              content:
                  Text('Are you sure you want to delete the selected items'),
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
            )).then((erase) {
      if (erase) _eraseSelected();
    });
  }

  void _eraseSelected() {
    List<CartElem> pending = [];
    for (var item in cart_list) {
      if (!item.selected) pending.add(item);
    }

    setState(() {
      cart_list = pending;
    });
  }
}


//tets

