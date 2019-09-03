import 'package:flutter/material.dart';

import '../style/gesture_class.dart';
import '../style/txt_style.dart';
import 'parent_animated.dart';
import 'parent_build.dart';
import 'parent.dart';
import 'txt_build.dart';

class Txt extends StatelessWidget {
  final String text;
  final TxtStyle style;
  final GestureClass gesture;

  const Txt(this.text, {this.style, this.gesture});

  // TODO: gestures (tested onTap()) does not work when text is editable

  @override
  Widget build(BuildContext context) {
    Widget widgetTree;

    if (style?.$duration != null) {
      // TODO: animate
      widgetTree = TxtBuild(
        text: text,
        fontWeight: style?.$fontWeight,
        textAlign: style?.$textAlign,
        fontStyle: style?.$fontStyle,
        fontFamily: style?.$fontFamily,
        fontFamilyFallback: style?.$fontFamilyFallback,
        fontSize: style?.$fontSize,
        textColor: style?.$textColor,
        maxLines: style?.$maxLines,
        letterSpacing: style?.$letterSpacing,
        wordSpacing: style?.$wordSpacing,
        editable: style?.$editable,
        focusNode: style?.$focusNode,
        keyboardType: style?.$keyboardType,
        obscureText: style?.$obscureText,
        onChange: style?.$onChange,
        onSelectionChange: style?.$onSelectionChange,
      );

      //TODO: animated Txt. This is temporarly:

    } else {
      widgetTree = TxtBuild(
        text: text,
        fontWeight: style?.$fontWeight,
        textAlign: style?.$textAlign,
        fontStyle: style?.$fontStyle,
        fontFamily: style?.$fontFamily,
        fontFamilyFallback: style?.$fontFamilyFallback,
        fontSize: style?.$fontSize,
        textColor: style?.$textColor,
        maxLines: style?.$maxLines,
        letterSpacing: style?.$letterSpacing,
        wordSpacing: style?.$wordSpacing,
        editable: style?.$editable,
        focusNode: style?.$focusNode,
        keyboardType: style?.$keyboardType,
        obscureText: style?.$obscureText,
        onChange: style?.$onChange,
        onSelectionChange: style?.$onSelectionChange,
      );
    }

    //parent styled widget
    Parent(
      style: style?.export,
      gesture: gesture,
      child: widgetTree,
    );

    return widgetTree;
  }
}
