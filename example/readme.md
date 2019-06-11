# Example 1

```dart
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
```

## Preview

![App demo](https://raw.githubusercontent.com/ReinBentdal/division/master/doc/Nexus6P_example1.png)

# Example 2
Reusing styling

```dart
import 'package:division/division.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  //it is highly recomended to define your List as List<StyleItem> instead of just List
  //generic button styling
  final List<StyleItem> buttonStyle = [
    S.width(300.0),
    S.padding(horizontal: 15.0, vertical: 20.0),
    S.margin(top: 20.0),
    S.align('center'),
    S.alignChild('center'),
    S.borderRadius(all: 30.0),
    S.backgroundColor(hex: 'eeeeee')
  ];

  //customized generic button styling
  final List<StyleItem> button2 = [
    S.backgroundColor(color: Colors.blue[700]),
    S.boxShadow(
        color: Colors.black.withOpacity(0.2),
        blur: 20.0,
        spread: -10.0,
        offset: [0.0, 15.0]),
  ];

  //customized generic button styling
  final List<StyleItem> button3 = [
    S.borderRadius(all: 3.0),
    S.backgroundColor(color: Colors.red[300]),
    S.boxShadow(
        color: Colors.black.withOpacity(0.2),
        blur: 20.0,
        spread: -10.0,
        offset: [0.0, 15.0]),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //plain button
            Division(style: buttonStyle, child: text(title: 'Plain button')),

            //blue button with shadow
            Division(
                style: List<StyleItem>.from(buttonStyle)..addAll(button2),
                child: text(title: 'Blue button with shadow', color: Colors.white)),

            //shadow button
            Division(
                style: List<StyleItem>.from(buttonStyle)..addAll(button3),
                child: text(title: 'Red button with shadow', color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget text({String title, Color color}) {
    return Text(title,
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: color ?? Colors.black));
  }
}
```

## Preview

![App demo](https://raw.githubusercontent.com/ReinBentdal/division/master/doc/Nexus6P_example2.png)