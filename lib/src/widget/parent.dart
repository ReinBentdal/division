import 'package:flutter/material.dart';

import '../style/parent_style.dart';
import '../style/gesture_class.dart';
import 'parent_build.dart';
import 'parent_animated.dart';

class Parent extends StatelessWidget {
  final Widget child;
  final ParentStyle style;
  final GestureClass gesture;

  const Parent({this.child, this.style, this.gesture});

  @override
  Widget build(BuildContext context) {
    Widget widgetTree = this.child;

    if (style?.$duration != null) {
      //animated
      widgetTree = ParentAnimated(
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
      widgetTree = ParentBuild(
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
