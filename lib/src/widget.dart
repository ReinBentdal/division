import 'package:flutter/material.dart';

import 'animated.dart';
import 'build.dart';
import 'model.dart';
import 'style.dart';

class Parent extends StatelessWidget {
  const Parent({this.child, required this.style, this.gesture});

  final Widget? child;
  final ParentStyle style;
  final Gestures? gesture;

  @override
  Widget build(BuildContext context) {
    StyleModel? styleModel = style.exportStyle;
    GestureModel? gestureModel = gesture?.exportGesture;

    Widget? widgetTree;

    if (child != null) widgetTree = ParentBuild(child: child!);

    if (styleModel.duration != null) {
      //animated
      widgetTree = CoreAnimated(
        styleModel: styleModel,
        gestureModel: gestureModel,
        child: widgetTree,
      );
    } else {
      // static
      widgetTree = CoreBuild(
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
  final TxtStyle? style;
  final Gestures? gesture;

  @override
  Widget build(BuildContext context) {
    Widget widgetTree;
    StyleModel? styleModel = style?.exportStyle;
    TextModel? textModel = style?.exportTextStyle;
    GestureModel? gestureModel = gesture?.exportGesture;

    if (styleModel?.curve != null && styleModel?.duration != null) {
      widgetTree = TxtAnimated(
        text: text,
        textModel: textModel,
        curve: styleModel!.curve!,
        duration: styleModel.duration!,
      );
    } else if (textModel?.editable != null && textModel?.editable == true) {
      widgetTree = TxtBuildEditable(
        text: text,
        textModel: textModel!,
      );
    } else {
      widgetTree = TxtBuild(
        text: text,
        textModel: textModel,
      );
    }

    if (styleModel?.duration != null) {
      return CoreAnimated(
        child: widgetTree,
        gestureModel: gestureModel,
        styleModel: styleModel,
      );
    } else {
      return CoreBuild(
        child: widgetTree,
        gestureModel: gestureModel,
        styleModel: styleModel,
      );
    }
  }
}
