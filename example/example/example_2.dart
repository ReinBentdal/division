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

  final backgroundStyle = ParentStyle()
    ..background
        .image(url: 'https://i.imgur.com/SqZ5JTv.jpg', fit: BoxFit.cover);

  final cardStyle = (pressed) => TxtStyle()
    ..alignment.center()
    ..alignmentContent.center()
    ..width(300)
    ..height(300)
    ..padding(all: 30)
    ..scale(pressed ? 0.95 : 1.0)
    ..borderRadius(all: pressed ? 30 : 10)
    ..animate(500, Curves.easeOut)
    ..background.blur(pressed ? 0 : 20)
    ..background.rgba(255, 255, 255, 0.15)
    ..textColor(Colors.white)
    ..bold()
    ..fontSize(32);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Parent(style: backgroundStyle),
        Txt(
          'My frosted widget',
          style: cardStyle(pressed),
          gesture: Gestures()
            ..isTap((isTapped) => setState(() => pressed = isTapped)),
        ),
      ],
    );
  }
}
