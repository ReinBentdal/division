import 'package:flutter/material.dart';
import 'dart:math';

import 'style_item.dart';
import 'gesture_item.dart';

class Division extends StatelessWidget {
  final Widget child;
  final List<StyleItem> style;
  final List<GestureItem> gesture;

  Division({this.child, this.style, this.gesture});

  final Map finalStyle = {
    'offset' : Offset(0.0,0.0),
  };

  final Map<String, Function> finalGestures = {};

  // fetches the style properties from List<S>
  void fetchStyle() {
    if (style != null) {
      for (dynamic styleItem in style) {
        if (styleItem is StyleItem) {
          finalStyle[styleItem.property] = styleItem?.style;
        } else {
          throw ('$styleItem is not of type StyleItem. It is recomended to define your style lists as List<StyleItem>. You may have typed List.from(List)..add(List) instead of List<StyleItem>.from(List)..addAll(List)');
        }
      }
    }
  }

  // Fetching the gesture properties from List<G>
  void fetchGesture() {
    if (gesture != null) {
      for (dynamic gestureItem in gesture) {
        if (gestureItem is GestureItem) {
          finalGestures[gestureItem?.property ?? null] =
              gestureItem?.function ?? null;
        } else {
          throw ('$gestureItem is not of type GestureItem');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchStyle();
    fetchGesture();

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(2 * pi * (finalStyle['rotate'] ?? 0.0))
        ..scale(finalStyle['scale'] ?? 1.0)
        ..translate(finalStyle['offset'].dx ?? 0.0, finalStyle['offset'].dy ?? 0.0),
      child: GestureDetector(
        onTap: finalGestures['onTap'] ?? null,
        onTapUp: finalGestures['onTapUp'] ?? null,
        onTapCancel: finalGestures['onTapCancel'] ?? null,
        onDoubleTap: finalGestures['onDoubleTap'] ?? null,
        onTapDown: finalGestures['onTapDown'] ?? null,
        onLongPress: finalGestures['onLongPress'] ?? null,
        onLongPressStart: finalGestures['onLongPressStart'] ?? null,
        onLongPressEnd: finalGestures['onLongPressEnd'] ?? null,
        onLongPressMoveUpdate: finalGestures['onLongPressMoveUpdate'] ?? null,
        onLongPressUp: finalGestures['onLongPressUp'] ?? null,
        onVerticalDragStart: finalGestures['onVerticalDragStart'] ?? null,
        onVerticalDragEnd: finalGestures['onVerticalDragEnd'] ?? null,
        onVerticalDragDown: finalGestures['onVerticalDragDown'] ?? null,
        onVerticalDragCancel: finalGestures['onVerticalDragCancel'] ?? null,
        onVerticalDragUpdate: finalGestures['onVerticalDragUpdate'] ?? null,
        onHorizontalDragStart: finalGestures['onHorizontalDragStart'] ?? null,
        onHorizontalDragEnd: finalGestures['onHorizontalDragEnd'] ?? null,
        onHorizontalDragCancel: finalGestures['onHorizontalDragCancel'] ?? null,
        onHorizontalDragUpdate: finalGestures['onHorizontalDragUpdate'] ?? null,
        onHorizontalDragDown: finalGestures['onHorizontalDragDown'] ?? null,
        onForcePressStart: finalGestures['onForcePressStart'] ?? null,
        onForcePressEnd: finalGestures['onForcePressEnd'] ?? null,
        onForcePressPeak: finalGestures['onForcePressPeak'] ?? null,
        onForcePressUpdate: finalGestures['onForcePressUpdate'] ?? null,
        onPanStart: finalGestures['onPanStart'] ?? null,
        onPanEnd: finalGestures['onPanEnd'] ?? null,
        onPanCancel: finalGestures['onPanCancel'] ?? null,
        onPanDown: finalGestures['onPanDown'] ?? null,
        onPanUpdate: finalGestures['onPanUpdate'] ?? null,
        onScaleStart: finalGestures['onScaleStart'] ?? null,
        onScaleEnd: finalGestures['onScaleEnd'] ?? null,
        onScaleUpdate: finalGestures['onScaleUpdate'] ?? null,
        child: Align(
          alignment: finalStyle['align'] ?? Alignment.center,
          child: Container(
            width: finalStyle['width'] ?? null,
            height: finalStyle['height'] ?? null,
            child: child ?? null,
            alignment: finalStyle['alignChild'] ?? null,
            padding: finalStyle['padding'] ?? null,
            margin: finalStyle['margin'] ?? null,
            constraints: BoxConstraints(
                maxHeight: finalStyle['maxHeight'] ?? double.infinity,
                minHeight: finalStyle['minHeight'] ?? 0.0,
                maxWidth: finalStyle['maxWidth'] ?? double.infinity,
                minWidth: finalStyle['minWidth'] ?? 0.0),
            decoration: BoxDecoration(
                color: finalStyle['backgroundColor'] ?? null,
                borderRadius: finalStyle['borderRadius'] ?? null,
                boxShadow: finalStyle['boxShadow'] ?? null),
          ),
        ),
      ),
    );
  }
}
