import 'package:flutter/material.dart';
import 'dart:math';

import 'style_class.dart';
import 'gesture_class.dart';

class Division extends StatelessWidget {
  final Widget child;
  final StyleClass style;
  final GestureClass gesture;

  Division({this.child, this.style, this.gesture});

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(2 * pi * (style?.getRotate ?? 0.0))
        ..scale(style?.getScale ?? 1.0)
        ..translate(style?.getOffset?.dx ?? 0.0, style?.getOffset?.dy ?? 0.0),
      child: GestureDetector(
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
        child: Align(
          alignment: style?.getAlignment ?? Alignment.centerLeft,
          child: AnimatedContainer(
            duration: Duration(milliseconds: style?.getDuration ?? 0),
            curve: style?.getCurve ?? Curves.linear,
            width: style?.getWidth,
            height: style?.getHeight,
            child: child,
            alignment: style?.getAlignmentChild,
            padding: style?.getPadding,
            margin: style?.getMargin,
            constraints: BoxConstraints(
              maxHeight: style?.getMaxHeight ?? double.infinity,
              minHeight: style?.getMinHeight ?? 0.0,
              maxWidth: style?.getMaxWidth ?? double.infinity,
              minWidth: style?.getMinWidth ?? 0.0,
            ),
            decoration: BoxDecoration(
                color: style?.getBackgroundColor,
                borderRadius: style?.getBorderRadius,
                boxShadow: style?.getBoxShadow),
          ),
        ),
      ),
    );
  }
}
