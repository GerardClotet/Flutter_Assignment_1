// class Pastilla extends StatelessWidget {
//   final String text;
//   final Color color;
//   const Pastilla(this.text,{
//     Key key,
//     this.color = Colors.red,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: 18,
//         vertical: 12,
//       ),
//       margin: EdgeInsets.only(bottom: 10),
//       decoration: BoxDecoration(
//         color: this.color,
//         borderRadius: BorderRadius.all(
//           Radius.circular(100),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black,
//             offset: Offset(5, 5),
//             blurRadius: 5,
//           )
//         ],
//       ),
//       child: Text(
//         this.text,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 25,
//         ),
//       ),
//     );
//   }
// }
// class Screen1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Pastilla('uno',color: Colors.red,),
//               Pastilla('dos',color: Colors.yellow,),
//               Pastilla('tres',color: Colors.blue,),
//               Pastilla('cuatro',color: Colors.green,),
//             ],
//           ),
//         ),
//       ),

//       //---ICON--- example
//       //   home: Scaffold(
//       //   body: Center(
//       //     child: Icon(
//       //       Icons.loyalty,
//       //       size: 40,
//       //       color: Colors.red,

//       //     ),
//       //   ),
//       // )
//       //---IMAGE--- example
//       // home: Scaffold(
//       //   body: Center(
//       //     child: Container(
//       //       width: 350,
//       //       height: 350,
//       //       color: Colors.yellowAccent,
//       //       child: Image.asset(
//       //         'assets/santorini_feliz.jpg',
//       //         fit: BoxFit.contain, //.cover bo
//       //         width:  200,
//       //         scale: 2,
//       //         alignment: Alignment.topLeft,
//       //         repeat: ImageRepeat.noRepeat,//default
//       //       ),
//       //     ),
//       //   ),
//       // ),

// //     //---ROW--- example
// //     final TextStyle style = TextStyle(
// //       fontSize: 40,
// //     );
// //     return MaterialApp(

// // home: Scaffold(
// //   body: Center(
// //     child: Row(
// //       children: <Widget>[
// //         Text('uno',style: style,),
// //         Text('dos',style:style.copyWith(
// //           fontSize: 25,
// //         )),
// //         Text('tres',style: style.copyWith(
// //         fontWeight: FontWeight.bold,
// //         fontSize: 80,
// //         color: Colors.red,
// //         )),

// //       ],
// //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //       mainAxisSize: MainAxisSize.max,
// //       crossAxisAlignment: CrossAxisAlignment.baseline,
// //       textBaseline:  TextBaseline.alphabetic,
// //     ),
// //   ),
// // ),
//       //--- COLUMN--- example
//       // home: Container(
//       //   color: Color.fromARGB(255, 255 , 255, 255),
//       //   child: Center(
//       //     child: Column(
//       //       children: <Widget>[
//       //         Text('primera '),
//       //         Container(
//       //           height: 50,
//       //           width: 50,
//       //           color: Colors.blue,
//       //         ),
//       //         Text(
//       //           'segunda ',
//       //           style: TextStyle(fontSize: 20),
//       //           textAlign: TextAlign.center,
//       //         ),
//       //         Container(
//       //           height: 80,
//       //           width: 120,
//       //           color: Colors.yellowAccent,
//       //         ),

//       //       ],
//       //       mainAxisSize: MainAxisSize.max,
//       //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //       crossAxisAlignment: CrossAxisAlignment.stretch,
//       //       verticalDirection: VerticalDirection.down,

//       //     ),
//       //   ),
//       // ),
//       //--- PADDING--- example
// //       home: Padding(
// //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

// //         child: Container(
// //           color: Colors.deepOrange,
// //         ),
// //       )

//       //----TEXT---- example
//       // home: Center(
//       //   child: SizedBox(
//       //     width: 350,
//       //     height: 100,
//       //     child: Text(
//       //       'un texto '*30,
//       //       textAlign: TextAlign.center,
//       //       textScaleFactor: .5,
//       //       maxLines: 3,
//       //       overflow: TextOverflow.ellipsis,
//       //       style: TextStyle(
//       //         color: Colors.white,
//       //         fontSize: 40,
//       //         fontWeight: FontWeight.w100,
//       //         fontStyle: FontStyle.italic,
//       //         decoration: TextDecoration.underline,
//       //         decorationColor: Colors.deepOrange,
//       //         decorationThickness: 3,
//       //         decorationStyle: TextDecorationStyle.dotted,
//       //         backgroundColor: Colors.pink,
//       //         shadows: [
//       //           Shadow(
//       //             color: Colors.purple,
//       //             offset: Offset(0, 3),
//       //             blurRadius: 1,
//       //           )
//       //         ],
//       //         letterSpacing: 0,
//       //         wordSpacing: 3,
//       //         height: 1.3,
//       //       ),
//       //     ),
//       //   ),
//       // ),

//       //---CONTAINER--- example
//       // title: 'Title App',
//       // theme: ThemeData(primarySwatch: Colors.green),
//       // home: Scaffold(

//       //   appBar: AppBar(
//       //     title: Text('GerardApp'),
//       //   ),

//       //   body: Center(
//       //     child: Container(

//       //      margin: EdgeInsets.all(50),//white
//       //       //color: Color.fromARGB(255, 125, 0, 200),
//       //       //color: Colors.red,
//       //       decoration: BoxDecoration(

//       //         color: Colors.purple,
//       //         border: Border.all(
//       //           color: Color.fromARGB(255, 0, 0, 0), //borde negre
//       //           width: 5,
//       //         ),

//       //         borderRadius: BorderRadius.only(
//       //         topRight: Radius.circular(30),
//       //         bottomLeft: Radius.elliptical(30, 50),
//       //         ),

//       //         boxShadow: [
//       //         BoxShadow(
//       //           color: Colors.black45,
//       //           offset: Offset(5,5),
//       //           blurRadius: 1,
//       //         )]

//       //       ),
//       //       child: Text('hola '*10),
//       //       padding: EdgeInsets.all( 20),
//       //       constraints: BoxConstraints(
//       //         maxWidth: 150,
//       //         maxHeight: 65,
//       //       ),
//       //     ),
//       //   ),

//       // ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'trip.dart';

class TripInfo extends StatelessWidget {
  final Trip trip = santorini;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                this.trip.big_pic,
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
              Top(trip),
              SizedBox(height: 200),
              Bot(trip),
            ],
          ),
        ),
      ),
    );
  }
}

class Bot extends StatelessWidget {
  final Trip trip;
  final textStyle = TextStyle(color: Colors.grey, fontSize: 10);
  Bot(this.trip);
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
                Rounded_Img(this.trip.descAsset, 100, 100),
                SizedBox(width: 30),
                Container(
                  width: 100,
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Text(
                        this.trip.loc_name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(this.trip.description,
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
                            "${r'$'}${this.trip.cost}",
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
                    SizedBox(width:90),
                    Container(
                      width: 100,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                        child: Text(
                          'Send Request',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                         
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
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

class Top extends StatelessWidget {
  final Trip trip;
  Top(this.trip);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              child: Icon(
                Icons.subject,
                color: Colors.white,
                size: 40,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            SizedBox(width: 220),
            Rounded_Img(this.trip.profile_pic, 40, 40),
          ],
        ),
      ),
    );
  }
}

class myIcon extends StatelessWidget {
  final Icons icon;
  myIcon(this.icon);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.description, //problem here
        color: Colors.white,
        size: 40,
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
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

void main() {
  runApp(TripInfo());
}

// Size screenSize(context) {
//   return MediaQuery.of(context).size;
// }

// double screenHeight(context, {double dividedBy = 1}) {
//   return screenSize(context).height / dividedBy;
// }
// double screenWidth(context, {double dividedBy = 1}) {
//   return screenSize(context).width / dividedBy;
// }
