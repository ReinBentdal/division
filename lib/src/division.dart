import 'package:flutter/material.dart';

import 'class/style_class.dart';
import 'class/gesture_class.dart';
import 'build.dart';
import 'animate.dart';

enum BoxOverflow {
  hidden,
  visible,
  scrollable,
}

class Division extends StatelessWidget {
  final Widget child;
  final StyleClass style;
  final GestureClass gesture;

  const Division({this.child, this.style, this.gesture});

  @override
  Widget build(BuildContext context) {
    Widget widgetTree = this.child;

    if (style?.$duration != null) {
      //animated
      widgetTree = DivisionAnimate(
        alignmentChild: style?.alignmentChild?.getAlignment,
        alignment: style?.alignment?.getAlignment,
        padding: style?.$padding,
        decoration: style?.$boxDecoration,
        width: style?.$width,
        height: style?.$height,
        constraints: style?.$boxConstraints,
        margin: style?.$margin,
        transform: style?.$transform,
        backgroundBlur: style?.background?.$blur,
        opacity: style?.$opacity,
        ripple: style?.$ripple,
        overflow: style?.overflow,
        gesture: gesture,
        child: widgetTree,
        curve: style?.$curve,
        duration: style?.$duration,
      );
    } else {
      // static
      widgetTree = DivisionBuild(
        alignmentChild: style?.alignmentChild?.getAlignment,
        alignment: style?.alignment?.getAlignment,
        padding: style?.$padding,
        decoration: style?.$boxDecoration,
        width: style?.$width,
        height: style?.$height,
        constraints: style?.$boxConstraints,
        margin: style?.$margin,
        transform: style?.$transform,
        backgroundBlur: style?.background?.$blur,
        opacity: style?.$opacity,
        ripple: style?.$ripple,
        overflow: style?.overflow,
        gesture: gesture,
        child: widgetTree,
      );
    }

    return widgetTree;
  }
}
