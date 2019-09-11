// import 'package:flutter/material.dart';
// import 'package:division/division.dart';

// void main() => runApp(Main());

// class Main extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Test(),
//       ),
//     );
//   }
// }

// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   bool active1 = false;
//   bool active2 = false;
//   FocusNode focusNode = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Txt(
//           'Some text',
//           style: TxtStyle()
//             ..bold(active1 ? true : false)
//             ..color(Colors.black)
//             ..background.color(!active1 ? Colors.grey : Colors.lime)
//             ..textAlign(TextAlign.center)
//             ..editable(
//               onFocusChange: (focus) {
//                 if (focus != active1) setState(() => active1 = focus);
//               },
//               onChange: (data) => print(data),
//             )
//             ..padding(vertical: 30)
//             ..margin(horizontal: 20, vertical: 10)
//             ..borderRadius(all: 30)
//             ..elevation(10)
//             ..alignment.center(),
//         ),
//         Txt(
//           'Some text',
//           style: TxtStyle()
//             ..bold(active2 ? true : false)
//             ..color(Colors.black)
//             ..background.color(!active2 ? Colors.grey : Colors.lime)
//             ..textAlign(TextAlign.center)
//             ..editable(
//               onFocusChange: (focus) {
//                 if (focus != active2) setState(() => active2 = focus);
//               },
//               onChange: (data) => print(data),
//             )
//             ..padding(vertical: 30)
//             ..margin(horizontal: 20)
//             ..borderRadius(all: 30)
//             ..elevation(10)
//             ..alignment.center(),
//         ),
//       ],
//     );
//   }
// }
