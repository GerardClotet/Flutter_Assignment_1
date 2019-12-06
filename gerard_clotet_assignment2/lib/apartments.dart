import 'package:flutter/material.dart';
import 'package:gerard_clotet_assignment2/shop_cart.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class Apartment {
  String username, loc_name, description, profile_pic, big_pic, desc_asset;
  int cost = 10;
  String s_cost;
  var d;
  Apartment(this.username, this.loc_name, this.description, this.profile_pic,
      this.big_pic, this.desc_asset, this.cost, this.s_cost);
  Apartment.fromjson(Map<String, dynamic> json)
      : username = json['user'],
        loc_name = json['loc_name'],
        description = json['description'],
        profile_pic = json['profile_pic'],
        big_pic = json['big_pic'],
        desc_asset = json['descAsset'],
        s_cost = json['cost'], //passar a int

        d = json['cost'];


}



class Base extends StatelessWidget {
  List<Apartment> l_a;
  int pos;

  Base(this.l_a, this.pos);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('test'),
      //   backgroundColor: Colors.white,
      // ),
      backgroundColor: Colors.grey,
      body: Container(
        width: 1080,
        height: 1920,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              l_a[pos].big_pic,
              //this.trip.big_pic,
            ),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Top(l_a, pos),
            SizedBox(height: 192),
            Bot(l_a, pos),
          ],
        ),
      ),
    );
  }
}

class Top extends StatelessWidget {
  List<Apartment> l_a;
  int pos;
  Top(this.l_a, this.pos);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              child: RaisedButton(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 40,
                
                  ),
                  color:  Colors.blue,

                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            SizedBox(width: 180),
            Rounded_Img(l_a[pos].profile_pic, 40, 40),
          ],
        ),
      ),
    );
  }
}

class Rounded_Img extends StatelessWidget {
  String path;
  double w, h;
  Rounded_Img(this.path, this.w, this.h);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            path,
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
      ),
    );
  }
}

class Bot extends StatelessWidget {
  final textStyle = TextStyle(color: Colors.grey, fontSize: 10);
  List<Apartment> l_a;
  int pos;
  Bot(this.l_a, this.pos);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1080,
      height: 292,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
              //top
              child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 20, 0),
            child: Row(
              children: <Widget>[
                Rounded_Img(this.l_a[pos].desc_asset, 100, 100),
                SizedBox(width: 30),
                Container(
                  width: 100,
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Text(
                        this.l_a[pos].loc_name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(this.l_a[pos].description,
                          style: textStyle, textAlign: TextAlign.start),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )
              ],
            ),
          )),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Row(
                children: <Widget>[
                  // issue with Icons to class
                  Container(
                    child: Icon(
                      Icons.home,
                      color: Color.fromARGB(255, 40, 0, 255),
                      size: 40,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                      color: Color.fromARGB(255, 211, 211, 211),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  SizedBox(width: 25),
                  Container(
                    child: Icon(
                      Icons.brush,
                      color: Color.fromARGB(255, 40, 0, 255),
                      size: 40,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                      color: Color.fromARGB(255, 211, 211, 211),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  SizedBox(width: 25),
                  Container(
                    child: Icon(
                      Icons.fingerprint,
                      color: Color.fromARGB(255, 40, 0, 255),
                      size: 40,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                      color: Color.fromARGB(255, 211, 211, 211),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  SizedBox(width: 25),
                  Container(
                    child: Icon(
                      Icons.room,
                      color: Color.fromARGB(255, 40, 0, 255),
                      size: 40,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                      color: Color.fromARGB(255, 211, 211, 211),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
              width: 1080,
              height: 110,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 100),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "${r'$'}${this.l_a[pos].s_cost}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('per night',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white))
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    SizedBox(width: 90),
                    Container(
                      width: 100,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                        child: RaisedButton(
                          child: Text(
                            'Add to cart',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                             cart_list.add(CartElem(l_a[pos].loc_name));
                            Navigator.of(context).pop();
                            
                          },
                          color: Colors.lightBlue,
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
