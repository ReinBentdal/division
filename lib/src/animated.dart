import 'package:flutter/material.dart';

import 'model.dart';
import 'build.dart';

class CoreAnimated extends ImplicitlyAnimatedWidget {
  CoreAnimated({
    this.styleModel,
    this.gestureModel,
    this.child,
  }) : super(curve: styleModel!.curve!, duration: styleModel.duration!);

  final Widget? child;

  final StyleModel? styleModel;

  final GestureModel? gestureModel;

  @override
  _CoreAnimatedState createState() => _CoreAnimatedState();
}

class _CoreAnimatedState extends AnimatedWidgetBaseState<CoreAnimated> {
  AlignmentGeometryTween? _alignment;
  AlignmentGeometryTween? _alignmentContent;
  EdgeInsetsGeometryTween? _padding;
  DecorationTween? _decoration;
  BoxConstraintsTween? _constraints;
  EdgeInsetsGeometryTween? _margin;
  Matrix4Tween? _transform;
  Tween<double?>? _blur;
  Tween<double?>? _opacity;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _alignment = visitor(_alignment, widget.styleModel?.alignment,
            (dynamic value) => AlignmentGeometryTween(begin: value))
        as AlignmentGeometryTween?;
    _alignmentContent = visitor(
            _alignmentContent,
            widget.styleModel?.alignmentContent,
            (dynamic value) => AlignmentGeometryTween(begin: value))
        as AlignmentGeometryTween?;
    _padding = visitor(_padding, widget.styleModel?.padding,
            (dynamic value) => EdgeInsetsGeometryTween(begin: value))
        as EdgeInsetsGeometryTween?;
    _decoration = visitor(_decoration, widget.styleModel?.decoration,
        (dynamic value) => DecorationTween(begin: value)) as DecorationTween?;
    _constraints = visitor(_constraints, widget.styleModel?.constraints,
            (dynamic value) => BoxConstraintsTween(begin: value))
        as BoxConstraintsTween?;
    _margin = visitor(_margin, widget.styleModel?.margin,
            (dynamic value) => EdgeInsetsGeometryTween(begin: value))
        as EdgeInsetsGeometryTween?;
    _transform = visitor(_transform, widget.styleModel?.transform,
        (dynamic value) => Matrix4Tween(begin: value)) as Matrix4Tween?;
    _blur = visitor(_blur, widget.styleModel?.backgroundBlur,
        (dynamic value) => Tween<double>(begin: value)) as Tween<double?>?;
    _opacity = visitor(_opacity, widget.styleModel?.opacity,
        (dynamic value) => Tween<double>(begin: value)) as Tween<double?>?;
  }

  @override
  Widget build(BuildContext context) {
    StyleModel? _styleModel = widget.styleModel;

    if (_styleModel != null) {
      _styleModel
        ..alignment = _alignment?.evaluate(animation)
        ..alignmentContent = _alignmentContent?.evaluate(animation)
        ..padding = _padding?.evaluate(animation)
        ..setBoxConstraints = _constraints?.evaluate(animation)
        ..setBoxDecoration = _decoration?.evaluate(animation) as BoxDecoration?
        ..margin = _margin?.evaluate(animation)
        ..setTransform = _transform?.evaluate(animation)
        ..backgroundBlur = _blur?.evaluate(animation)
        ..opacity = _opacity?.evaluate(animation);
    }

    return CoreBuild(
      styleModel: _styleModel,
      gestureModel: widget.gestureModel,
      child: widget.child,
    );
  }
}

class TxtAnimated extends ImplicitlyAnimatedWidget {
  TxtAnimated({
    this.textModel,
    required Curve curve,
    required Duration duration,
    required this.text,
  }) : super(curve: curve, duration: duration);

  final String text;

  final TextModel? textModel;

  @override
  _TxtAnimatedState createState() => _TxtAnimatedState();
}

class _TxtAnimatedState extends AnimatedWidgetBaseState<TxtAnimated> {
  Tween<double>? _fontSize;
  ColorTween? _textColor;
  Tween<int>? _maxLines;
  Tween<double>? _letterSpacing;
  Tween<double>? _wordSpacing;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _fontSize = visitor(_fontSize, widget.textModel?.fontSize,
        (dynamic value) => Tween<double>(begin: value)) as Tween<double>?;
    _textColor = visitor(_textColor, widget.textModel?.textColor,
        (dynamic value) => ColorTween(begin: value)) as ColorTween?;
    _maxLines = visitor(_maxLines, widget.textModel?.maxLines,
        (dynamic value) => Tween<int>(begin: value)) as Tween<int>?;
    _letterSpacing = visitor(_letterSpacing, widget.textModel?.letterSpacing,
        (dynamic value) => Tween<double>(begin: value)) as Tween<double>?;
    _wordSpacing = visitor(_wordSpacing, widget.textModel?.wordSpacing,
        (dynamic value) => Tween<double>(begin: value)) as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    TextModel? _textModel = widget.textModel;

    if (_textModel != null) {
      _textModel
        ..fontSize = _fontSize?.evaluate(animation)
        ..textColor = _textColor?.evaluate(animation)
        ..maxLines = _maxLines?.evaluate(animation)
        ..letterSpacing = _letterSpacing?.evaluate(animation)
        ..wordSpacing = _wordSpacing?.evaluate(animation);
    }

    if (_textModel?.editable != null && _textModel?.editable == true) {
      return TxtBuildEditable(
        text: widget.text,
        textModel: _textModel!,
      );
    } else {
      return TxtBuild(
        text: widget.text,
        textModel: _textModel,
      );
    }
  }
}
