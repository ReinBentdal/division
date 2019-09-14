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
  final ParentStyle boxStyle = ParentStyle()
    ..width(300)
    ..height(50)
    ..margin(vertical: 10.0)
    ..alignment.center()
    ..alignmentContent.center()
    ..borderRadius(all: 15.0)
    ..background.hex('#eeeeee')
    ..animate(2000, Curves.easeInOut);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Parent(
          style: ParentStyle()
            ..elevation(0)
            ..add(boxStyle),
          child: text('Elevation: 0'),
        ),
        Parent(
          style: ParentStyle()
            ..elevation(5)
            ..add(boxStyle),
          child: text('Elevation: 5'),
        ),
        Parent(
          style: ParentStyle()
            ..elevation(10)
            ..add(boxStyle),
          child: text('Elevation: 10'),
        ),
        Parent(
          style: ParentStyle()
            ..elevation(20)
            ..add(boxStyle),
          child: text('Elevation: 20'),
        ),
        Parent(
          style: ParentStyle()
            ..elevation(30)
            ..add(boxStyle),
          child: text('Elevation: 30'),
        ),
        Parent(
          style: ParentStyle()
            ..elevation(40)
            ..add(boxStyle),
          child: text('Elevation: 40'),
        ),
        Parent(
          style: ParentStyle()
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
