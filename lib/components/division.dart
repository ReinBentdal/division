import 'package:flutter/material.dart';

class Division extends StatelessWidget {
  //parameters
  final Widget child;
  final List style;
  final List gestureStyle;
  final List gesture;

  Division({this.child, this.style, this.gestureStyle, this.gesture});

  final Map finalStyle = {
    'minHeight': 0.0,
    'maxHeight': double.infinity,
    'minWidth': 0.0,
    'maxWidth': double.infinity
  };

  final Map<String, Function> finalGestures = {};

  void fetchStyle() {
    if (style != null) {
      for (dynamic parameter in style) {
        switch (parameter['property']) {
          case 'align':
            finalStyle['alignment'] = parameter['style'];
            break;
          case 'alignChild':
            finalStyle['alignmentChild'] = parameter['style'];
            break;
          case 'padding':
            finalStyle['padding'] = parameter['style'];
            break;
          case 'margin':
            finalStyle['margin'] = parameter['style'];
            break;
          case 'backgroundColor':
            finalStyle['backgroundColor'] = parameter['style'];
            break;
          case 'borderRadius':
            finalStyle['borderRadius'] = parameter['style'];
            break;
          case 'boxShadow':
            finalStyle['boxShadow'] = parameter['style'];
            break;
          case 'width':
            finalStyle['width'] = parameter['style'];
            break;
          case 'height':
            finalStyle['height'] = parameter['style'];
            break;
          case 'minHeight':
            finalStyle['minHeight'] = parameter['style'];
            break;
          case 'maxHeight':
            finalStyle['maxHeight'] = parameter['style'];
            break;
          case 'minWidth':
            finalStyle['minWidth'] = parameter['style'];
            break;
          case 'maxWidth':
            finalStyle['maxWidth'] = parameter['style'];
            break;
        }
      }
    }
  }

  void fetchGesture() {
    if (gesture != null) {
      for (dynamic parameter in gesture) {
        switch (parameter['property']) {
          case 'onTap':
            finalGestures['onTap'] = parameter['function'];
            break;
        }
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
        alignment: finalStyle['alignment'],
        child: Container(
          width: finalStyle['width'],
          height: finalStyle['height'],
          child: child,
          alignment: finalStyle['alignmentChild'],
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
