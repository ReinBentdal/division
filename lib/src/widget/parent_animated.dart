import 'package:flutter/material.dart';

import 'parent_build.dart';
import '../model/ripple.dart';
import '../model/overflow.dart';
import '../style/gesture_class.dart';

class ParentAnimated extends ImplicitlyAnimatedWidget {
  ParentAnimated({
    @required this.alignmentChild,
    @required this.alignment,
    @required this.padding,
    @required this.decoration,
    @required double width,
    @required double height,
    @required BoxConstraints constraints,
    @required this.margin,
    @required this.transform,
    @required this.backgroundBlur,
    @required this.opacity,
    @required this.ripple,
    @required this.overflow,
    @required Curve curve,
    @required Duration duration,
    this.gesture,
    @required this.child,
  })  : assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(decoration == null || decoration.debugAssertIsValid()),
        assert(constraints == null || constraints.debugAssertIsValid()),
        constraints = (width != null || height != null)
            ? constraints?.tighten(width: width, height: height) ??
                BoxConstraints.tightFor(width: width, height: height)
            : constraints,
        super(curve: curve, duration: duration);

  final Widget child;

  final AlignmentGeometry alignmentChild;

  final AlignmentGeometry alignment;

  final EdgeInsetsGeometry padding;

  final BoxDecoration decoration;

  final BoxConstraints constraints;

  final EdgeInsetsGeometry margin;

  final Matrix4 transform;

  final double backgroundBlur;

  final double opacity;

  final RippleModel ripple;

  final OverflowModel overflow;

  final GestureClass gesture;

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
    _alignment = visitor(_alignment, widget.alignment,
        (dynamic value) => AlignmentGeometryTween(begin: value));
    _alignmentChild = visitor(_alignmentChild, widget.alignmentChild,
        (dynamic value) => AlignmentGeometryTween(begin: value));
    _padding = visitor(_padding, widget.padding,
        (dynamic value) => EdgeInsetsGeometryTween(begin: value));
    _decoration = visitor(_decoration, widget.decoration,
        (dynamic value) => DecorationTween(begin: value));
    _constraints = visitor(_constraints, widget.constraints,
        (dynamic value) => BoxConstraintsTween(begin: value));
    _margin = visitor(_margin, widget.margin,
        (dynamic value) => EdgeInsetsGeometryTween(begin: value));
    _transform = visitor(_transform, widget.transform,
        (dynamic value) => Matrix4Tween(begin: value));
    _blur = visitor(_blur, widget.backgroundBlur,
        (dynamic value) => Tween<double>(begin: value));
    _opacity = visitor(_opacity, widget.opacity,
        (dynamic value) => Tween<double>(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    return ParentBuild(
      alignmentChild: _alignmentChild?.evaluate(animation),
      alignment: _alignment?.evaluate(animation),
      padding: _padding?.evaluate(animation),
      decoration: _decoration?.evaluate(animation),
      constraints: _constraints?.evaluate(animation),
      margin: _margin?.evaluate(animation),
      transform: _transform?.evaluate(animation),
      backgroundBlur: _blur?.evaluate(animation),
      opacity: _opacity?.evaluate(animation),
      ripple: widget.ripple,
      overflow: widget.overflow,
      gesture: widget.gesture,
      child: widget.child,
    );
  }
}
