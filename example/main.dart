import 'package:division/division.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Division(
      style: [
        S.height(100.0),
        S.width(500.0),
        S.minWidth(500.0),
        S.align('center'),
        S.alignChild('center'),
        S.padding(vertical: 20.0, horizontal: 10.0),
        S.margin(horizontal: 30.0),
        S.backgroundColor(hex: '55ffff'),
        S.borderRadius(all: 20.0),
        S.boxShadow(
            hex: '55ffff', spread: -10.0, blur: 20.0, offset: [0.0, 15.0]),
      ],
      gesture: [
        G.onTap(() => print('Division widget pressed!')),
      ],
      child: Text('Centered text inside the division widget'),
    )));
  }
}
