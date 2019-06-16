import 'package:division/division.dart';
import 'package:flutter/material.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ElevationDemo(),
      ),
    );
  }
}

class ElevationDemo extends StatelessWidget {
  final StyleClass boxStyle = StyleClass()
    ..width(300)
    ..height(50)
    ..margin(vertical: 10.0)
    ..align('center')
    ..alignChild('center')
    ..borderRadius(all: 15.0)
    ..backgroundColor(color: '#eeeeee')
    ..animate(2000, Curves.easeInOut);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Division(
          style: StyleClass()
            ..elevation(0)
            ..add(boxStyle),
          child: text('Elevation: 0'),
        ),
        Division(
          style: StyleClass()
            ..elevation(5)
            ..add(boxStyle),
          child: text('Elevation: 5'),
        ),
        Division(
          style: StyleClass()
            ..elevation(10)
            ..add(boxStyle),
          child: text('Elevation: 10'),
        ),
        Division(
          style: StyleClass()
            ..elevation(20)
            ..add(boxStyle),
          child: text('Elevation: 20'),
        ),
        Division(
          style: StyleClass()
            ..elevation(30)
            ..add(boxStyle),
          child: text('Elevation: 30'),
        ),
        Division(
          style: StyleClass()
            ..elevation(40)
            ..add(boxStyle),
          child: text('Elevation: 40'),
        ),
        Division(
          style: StyleClass()
            ..elevation(50)
            ..add(boxStyle),
          child: text('Elevation: 50'),
        ),
      ],
    );
  }

  Text text(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    );
  }
}
