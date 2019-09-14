import 'package:flutter/material.dart';

import 'model.dart';
import 'build.dart';

class ParentAnimated extends ImplicitlyAnimatedWidget {
  ParentAnimated({
    @required this.styleModel,
    @required this.gestureModel,
    @required this.child,
  }) : super(curve: styleModel?.curve, duration: styleModel?.duration);

  final Widget child;

  final StyleModel styleModel;

  final GestureModel gestureModel;

  @override
  _ParentAnimatedState createState() => _ParentAnimatedState();
}

class _ParentAnimatedState extends AnimatedWidgetBaseState<ParentAnimated> {
  AlignmentGeometryTween _alignment;
  AlignmentGeometryTween _alignmentChild;
  EdgeInsetsGeometryTween _padding;
  DecorationTween _decoration;
  BoxConstraintsTween _constraints;
  EdgeInsetsGeometryTween _margin;
  Matrix4Tween _transform;
  Tween<double> _blur;
  Tween<double> _opacity;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _alignment = visitor(_alignment, widget.styleModel?.alignment,
        (dynamic value) => AlignmentGeometryTween(begin: value));
    _alignmentChild = visitor(
        _alignmentChild,
        widget.styleModel?.alignmentContent,
        (dynamic value) => AlignmentGeometryTween(begin: value));
    _padding = visitor(_padding, widget.styleModel?.padding,
        (dynamic value) => EdgeInsetsGeometryTween(begin: value));
    _decoration = visitor(_decoration, widget.styleModel?.decoration,
        (dynamic value) => DecorationTween(begin: value));
    _constraints = visitor(_constraints, widget.styleModel?.constraints,
        (dynamic value) => BoxConstraintsTween(begin: value));
    _margin = visitor(_margin, widget.styleModel?.margin,
        (dynamic value) => EdgeInsetsGeometryTween(begin: value));
    _transform = visitor(_transform, widget.styleModel?.transform,
        (dynamic value) => Matrix4Tween(begin: value));
    _blur = visitor(_blur, widget.styleModel?.backgroundBlur,
        (dynamic value) => Tween<double>(begin: value));
    _opacity = visitor(_opacity, widget.styleModel?.opacity,
        (dynamic value) => Tween<double>(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    StyleModel _styleModel = widget.styleModel;

    if (_styleModel != null) {
      _styleModel
        ..alignment = _alignment?.evaluate(animation)
        ..alignmentContent = _alignmentChild?.evaluate(animation)
        ..padding = _padding?.evaluate(animation)
        ..setBoxConstraints = _constraints?.evaluate(animation)
        ..setBoxDecoration = _decoration?.evaluate(animation)
        ..margin = _margin?.evaluate(animation)
        ..setTransform = _transform?.evaluate(animation)
        ..backgroundBlur = _blur?.evaluate(animation)
        ..opacity = _opacity?.evaluate(animation);
    }

    return ParentBuild(
      styleModel: _styleModel,
      gestureModel: widget.gestureModel,
      child: widget.child,
    );
  }
}
