import 'package:division/division.dart';
import 'package:flutter/material.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnimationDemo(),
      ),
    );
  }
}

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  StyleClass boxStyle = StyleClass()
    ..backgroundColor(hex: 'eeeeee')
    ..elevation(30)
    ..width(300)
    ..height(400)
    ..borderRadius(all: 30.0)
    ..align('center')
    ..alignChild('center')
    ..animate(1500, Curves.easeInOut);

  void animateBox() {
    setState(() {
      boxStyle
        ..width(250)
        ..height(350)
        ..elevation(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Division(
      style: boxStyle,
      gesture: GestureClass()..onTap(() => animateBox()),
      child: Text('Some text'),
    );
  }
}
