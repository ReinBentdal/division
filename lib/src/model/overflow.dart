import 'package:flutter/material.dart';

enum OverflowType { hidden, scroll, visible }

class OverflowModel {
  Axis _direction;
  OverflowType _overflow;

  Axis get $direction => _direction;
  OverflowType get $overflow => _overflow;

  void hidden() => _overflow = OverflowType.hidden;

  void scrollable([Axis direction = Axis.vertical]) {
    _overflow = OverflowType.scroll;
    _direction = direction;
  }

  void visible([Axis direction = Axis.vertical]) {
    _overflow = OverflowType.visible;
    _direction = direction;
  }
}
