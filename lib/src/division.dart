import 'package:flutter/material.dart';

import 'style_item.dart';
import 'gesture_item.dart';

class Division extends StatelessWidget {

  final Widget child;
  final List style;
  final List gesture;

  Division({this.child, this.style, this.gesture});

  final Map finalStyle = {};

  final Map<String, Function> finalGestures = {};

  // fetches the style properties from List<S>
  void fetchStyle() {
    if (style != null) {
      for (StyleItem styleItem in style) {
        if(styleItem is StyleItem) {
          finalStyle[styleItem.property] = styleItem.style;
        }
      }
    }
  }

  // Fetching the gesture properties from List<G>
  void fetchGesture() {
    if (gesture != null) {
      for (GestureItem gestureItem in gesture) {
        finalGestures[gestureItem.property] = gestureItem.function;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchStyle();
    fetchGesture();

    return GestureDetector(
      onTap: finalGestures['onTap'] ?? null,
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
    );
  }
}
