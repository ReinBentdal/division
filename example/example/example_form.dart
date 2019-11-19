import 'package:flutter/material.dart';
import 'package:division/division.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Test(),
      ),
    );
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  bool active1 = false;
  bool active2 = false;

  final inputFieldStyle = (bool isActive, TxtStyle activeStyle) => TxtStyle()
    ..textColor(Colors.black)
    ..textAlign.left()
    ..fontSize(16)
    ..padding(horizontal: 15, vertical: 15)
    ..margin(horizontal: 50, vertical: 10)
    ..borderRadius(all: 10)
    ..alignment.center()
    ..background.color(Colors.grey[200])
    ..animate(300, Curves.easeOut)
    ..add(isActive ? activeStyle : null, override: true);

  final TxtStyle inputFieldActiveStyle = TxtStyle()
    ..background.color(Colors.blue)
    ..bold(true)
    ..textColor(Colors.white);

  final TxtStyle submitButtonStyle = TxtStyle()
    ..textColor(Colors.white)
    ..bold()
    ..ripple(true, splashColor: Colors.white.withOpacity(0.1))
    ..alignment.centerLeft()
    ..width(150)
    ..background.color(Colors.blue)
    ..borderRadius(all: 10)
    ..margin(top: 30, horizontal: 50)
    ..padding(vertical: 15)
    ..elevation(10, opacity: 0.5);

  final titleStyle = TxtStyle()
    ..fontSize(24)
    ..bold()
    ..margin(bottom: 30, horizontal: 50)
    ..alignment.centerLeft();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Title
        Txt('Login', style: titleStyle),

        // Username field
        Txt(
          '',
          style: inputFieldStyle(active1, inputFieldActiveStyle)
            ..editable(
              true,
              placeholder: 'enter username',
              onFocusChange: (focus) {
                if (focus != active1) setState(() => active1 = focus);
              },
              onChange: (data) => print(data),
            ),
        ),

        // Password field
        Txt(
          '',
          style: inputFieldStyle(active2, inputFieldActiveStyle)
            ..editable(
              true,
              placeholder: 'enter password',
              obscureText: true,
              onFocusChange: (focus) {
                if (focus != active2) setState(() => active2 = focus);
              },
              onChange: (data) => print(data),
            ),
        ),

        // Submit button
        Txt('Submit', style: submitButtonStyle)
      ],
    );
  }
}
