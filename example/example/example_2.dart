import 'package:division/division.dart';
import 'package:flutter/material.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FrostedWidget(),
      ),
    );
  }
}

class FrostedWidget extends StatefulWidget {
  @override
  _FrostedWidgetState createState() => _FrostedWidgetState();
}

class _FrostedWidgetState extends State<FrostedWidget> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Division(
          style: StyleClass()
            ..background.image(
              url: 'https://i.imgur.com/SqZ5JTv.jpg',
              fit: BoxFit.cover,
            ),
        ),
        Division(
          style: StyleClass()
            ..alignment.center()
            ..alignmentChild.center()
            ..width(300)
            ..height(300)
            ..padding(all: 30)
            ..scale(pressed ? 0.95 : 1.0)
            ..borderRadius(all: pressed ? 30 : 10)
            ..animate(500, Curves.easeOut)
            ..background.blur(pressed ? 0 : 20)
            ..background.rgba(255, 255, 255, 0.15),
          gesture: GestureClass()
            ..onTapDown((detials) => setState(() => pressed = true))
            ..onTapUp((detials) => setState(() => pressed = false))
            ..onTapCancel(() => setState(() => pressed = false)),
          child: Text(
            'My frosted widget',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ),
      ],
    );
  }
}
