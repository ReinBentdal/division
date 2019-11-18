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
  final boxStyle = (double elevation) => TxtStyle()
    ..elevation(elevation)
    ..width(300)
    ..height(50)
    ..margin(vertical: 10.0)
    ..alignment.center()
    ..alignmentContent.center()
    ..borderRadius(all: 15.0)
    ..background.hex('#eeeeee')
    ..animate(2000, Curves.easeInOut)
    ..fontSize(18)
    ..bold();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Txt('Elevation: 0', style: boxStyle(0)),
        Txt('Elevation: 5', style: boxStyle(5)),
        Txt('Elevation: 10', style: boxStyle(10)),
        Txt('Elevation: 20', style: boxStyle(20)),
        Txt('Elevation: 30', style: boxStyle(30)),
        Txt('Elevation: 40', style: boxStyle(40)),
        Txt('Elevation: 50', style: boxStyle(50)),
      ],
    );
  }
}
