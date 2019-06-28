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

    if (style?.getDuration != null) {
      //animated
      widgetTree = DivisionAnimate(
        alignmentChild: style?.getAlignmentChild,
        alignment: style?.getAlignment,
        padding: style?.getPadding,
        decoration: style?.getBoxDecoration,
        width: style?.getWidth,
        height: style?.getHeight,
        constraints: style?.getBoxConstraints,
        margin: style?.getMargin,
        transform: style?.getTransform,
        backgroundBlur: style?.getBackgroundBlur,
        opacity: style?.getOpacity,
        ripple: style?.getRipple,
        overflow: style?.getOverflow,
        curve: style?.getCurve,
        duration: style?.getDuration,
        gesture: gesture,
        child: widgetTree,
      );
    } else {
      // static
      widgetTree = DivisionBuild(
        alignmentChild: style?.getAlignmentChild,
        alignment: style?.getAlignment,
        padding: style?.getPadding,
        decoration: style?.getBoxDecoration,
        width: style?.getWidth,
        height: style?.getHeight,
        constraints: style?.getBoxConstraints,
        margin: style?.getMargin,
        transform: style?.getTransform,
        backgroundBlur: style?.getBackgroundBlur,
        opacity: style?.getOpacity,
        ripple: style?.getRipple,
        overflow: style?.getOverflow,
        gesture: gesture,
        child: widgetTree,
      );
    }

    return widgetTree;
  }
}
