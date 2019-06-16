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
  bool pressed = false;

  StyleClass boxStyle = StyleClass()
    ..backgroundColor('#eeeeee')
    ..width(300)
    ..height(400)
    ..borderRadius(all: 30.0)
    ..align('center')
    ..alignChild('center')
    ..animate(1500, Curves.easeInOut);

  @override
  Widget build(BuildContext context) {
    return Division(
      style: boxStyle
        ..elevation(pressed ? 0 : 30)
        ..scale(pressed ? 0.9 : 1.0),
      gesture: GestureClass()
        ..onTapDown((details) => setState(() => pressed = true))
        ..onTapUp((details) => setState(() => pressed = false)),
      child: Text('Some text'),
    );
  }
}
