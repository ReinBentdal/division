import 'package:flutter/material.dart';

enum OverflowType { hidden, scroll, visible }

class OverflowModel {
  final Axis direction;
  final OverflowType overflow;

  OverflowModel({this.direction, this.overflow});
}
