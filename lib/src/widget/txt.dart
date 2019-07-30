import 'package:flutter/material.dart';

import '../style/txt_style.dart';
import 'parent_animated.dart';
import 'parent_build.dart';
import 'txt_build.dart';

class Txt extends StatelessWidget {
  final String text;
  final TxtStyle style;

  const Txt(this.text, {this.style});

  @override
  Widget build(BuildContext context) {
    Widget widgetTree;

    if (style?.$duration != null) {

      //TODO: animated Txt

      //animated
      widgetTree = ParentAnimated(
        alignmentChild: null,
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
        // gesture: gesture,
        child: widgetTree,
        curve: style?.$curve,
        duration: style?.$duration,
      );
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
        onChange: style?.$onChange,
        onSelectionChange: style?.$onSelectionChange,
      );

      // parent
      widgetTree = ParentBuild(
        alignmentChild: null,
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
        // gesture: gesture,
        child: widgetTree,
      );
    }

    return widgetTree;
  }
}