import 'package:division/model/gesture_item.dart';
import 'package:flutter/material.dart';

import '../model/style_item.dart';

class Division extends StatelessWidget {
  //parameters
  final Widget child;
  final List style;
  // final List gestureStyle; to be implemented
  final List gesture;

  Division({this.child, this.style, this.gesture});

  final Map finalStyle = {
    'minHeight': 0.0,
    'maxHeight': double.infinity,
    'minWidth': 0.0,
    'maxWidth': double.infinity,
    'align' : Alignment.center
  };

  final Map<String, Function> finalGestures = {};

  // fetches the style properties from List<S>
  void fetchStyle() {
    if (style != null) {
      for (StyleItem styleItem in style) {
        finalStyle[styleItem.property] = styleItem.style;
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
      onTap: finalGestures['onTap'],
      child: Align(
        alignment: finalStyle['align'],
        child: Container(
          width: finalStyle['width'],
          height: finalStyle['height'],
          child: child,
          alignment: finalStyle['alignChild'],
          padding: finalStyle['padding'],
          margin: finalStyle['margin'],
          constraints: BoxConstraints(
              maxHeight: finalStyle['maxHeight'],
              minHeight: finalStyle['minHeight'],
              maxWidth: finalStyle['maxWidth'],
              minWidth: finalStyle['minWidth']),
          decoration: BoxDecoration(
              color: finalStyle['backgroundColor'],
              borderRadius: finalStyle['borderRadius'],
              boxShadow: finalStyle['boxShadow']),
        ),
      ),
    );
  }
}
