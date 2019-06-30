import 'package:flutter/widgets.dart';

class AlignmentModel {
  AlignmentGeometry _alignment;

  AlignmentGeometry get getAlignment => _alignment;

  void topLeft() => _alignment = Alignment.topLeft;
  void get test => _alignment = Alignment.center;
  void topCenter() => _alignment = Alignment.topCenter;
  void topRight() => _alignment = Alignment.topRight;

  void bottomLeft() => _alignment = Alignment.bottomLeft;
  void bottomCenter() => _alignment = Alignment.bottomCenter;
  void bottomRight() => _alignment = Alignment.bottomRight;

  void centerLeft() => _alignment = Alignment.centerLeft;
  void center() => _alignment = Alignment.center;
  void centerRight() => _alignment = Alignment.centerRight;

  void coordinate(double x, double y) =>
      _alignment = Alignment(x, y); // TODO: New name
}
