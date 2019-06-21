import 'package:flutter/material.dart';

import 'style_class.dart';
import 'gesture_class.dart';
import 'build.dart';
import 'animate.dart';

class Division extends StatelessWidget {
  final Widget child;
  final StyleClass style;
  final GestureClass gesture;

  Division({this.child, this.style, this.gesture});

  Widget _buildGestureDetector(Widget widgetChild) {
    return GestureDetector(
      onTap: gesture?.getOnTap,
      onTapUp: gesture?.getOnTapUp,
      onTapCancel: gesture?.getOnTapCancel,
      onDoubleTap: gesture?.getOnDoubleTap,
      onTapDown: gesture?.getOnTapDown,
      onLongPress: gesture?.getOnLongPress,
      onLongPressStart: gesture?.getOnLongPressStart,
      onLongPressEnd: gesture?.getOnLongPressEnd,
      onLongPressMoveUpdate: gesture?.getOnLongPressMoveUpdate,
      onLongPressUp: gesture?.getOnLongPressUp,
      onVerticalDragStart: gesture?.getOnVerticalDragStart,
      onVerticalDragEnd: gesture?.getOnVerticalDragEnd,
      onVerticalDragDown: gesture?.getOnVerticalDragDown,
      onVerticalDragCancel: gesture?.getOnVerticalDragCancel,
      onVerticalDragUpdate: gesture?.getOnVerticalDragUpdate,
      onHorizontalDragStart: gesture?.getOnHorizontalDragStart,
      onHorizontalDragEnd: gesture?.getOnHorizontalDragEnd,
      onHorizontalDragCancel: gesture?.getOnHorizontalDragCancel,
      onHorizontalDragUpdate: gesture?.getOnHorizontalDragUpdate,
      onHorizontalDragDown: gesture?.getOnHorizontalDragDown,
      onForcePressStart: gesture?.getOnForcePressStart,
      onForcePressEnd: gesture?.getOnForcePressEnd,
      onForcePressPeak: gesture?.getOnForcePressPeak,
      onForcePressUpdate: gesture?.getOnForcePressUpdate,
      onPanStart: gesture?.getOnPanStart,
      onPanEnd: gesture?.getOnPanEnd,
      onPanCancel: gesture?.getOnPanCancel,
      onPanDown: gesture?.getOnPanDown,
      onPanUpdate: gesture?.getOnPanUpdate,
      onScaleStart: gesture?.getOnScaleStart,
      onScaleEnd: gesture?.getOnScaleEnd,
      onScaleUpdate: gesture?.getOnScaleUpdate,
      child: widgetChild,
    );
  }

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
        child: widgetTree,
      );
    }

    if (gesture != null) widgetTree = _buildGestureDetector(widgetTree);

    return widgetTree;
  }
}
