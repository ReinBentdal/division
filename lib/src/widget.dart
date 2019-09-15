import 'package:flutter/material.dart';

import 'animated.dart';
import 'build.dart';
import 'model.dart';
import 'style.dart';

class Parent extends StatelessWidget {
  const Parent({this.child, this.style, this.gesture});

  final Widget child;
  final ParentStyle style;
  final GestureClass gesture;

  @override
  Widget build(BuildContext context) {
    Widget widgetTree = this.child;
    StyleModel styleModel = style?.exportStyle;
    GestureModel gestureModel = gesture?.exportGesture;

    if (styleModel?.duration != null) {
      //animated
      widgetTree = ParentAnimated(
        styleModel: styleModel,
        gestureModel: gestureModel,
        child: widgetTree,
      );
    } else {
      // static
      widgetTree = ParentBuild(
        styleModel: styleModel,
        gestureModel: gestureModel,
        child: widgetTree,
      );
    }

    return widgetTree;
  }
}

class Txt extends StatelessWidget {
  const Txt(this.text, {this.style, this.gesture});

  final String text;
  final TxtStyle style;
  final GestureClass gesture;

  @override
  Widget build(BuildContext context) {
    Widget widgetTree;
    StyleModel styleModel = style?.exportStyle;
    TextModel textModel = style?.exportTextStyle;
    GestureModel gestureModel = gesture?.exportGesture;

    if (textModel?.editable != null && textModel?.editable == true) {
      widgetTree = TxtBuildEditable(
        text: text,
        textModel: textModel,
      );
    } else {
      widgetTree = TxtBuild(
        text: text,
        textModel: textModel,
      );
    }

    if (styleModel?.duration != null) {
      return ParentAnimated(
        child: widgetTree,
        gestureModel: gestureModel,
        styleModel: styleModel,
      );
    } else {
      return ParentBuild(
        child: widgetTree,
        gestureModel: gestureModel,
        styleModel: styleModel,
      );
    }
  }
}
