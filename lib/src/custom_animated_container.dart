import 'dart:ui';

import 'style_class.dart';
import 'package:flutter/material.dart';

class CustomAnimatedContainer extends ImplicitlyAnimatedWidget {
  /// Creates a container that animates its parameters implicitly.
  ///
  /// The [curve] and [duration] arguments must not be null.
  CustomAnimatedContainer({@required this.style, this.child})
      : decoration = BoxDecoration(
          image: style?.getBackgroundImage,
          color: style?.getBackgroundColor,
          gradient: style?.getGradient,
          border: style?.getBorder,
          borderRadius: style?.getBorderRadius,
          boxShadow: style?.getBoxShadow,
        ),
        constraints = (style?.getWidth != null || style?.getHeight != null)
            ? BoxConstraints(
                  maxHeight: style?.getMaxHeight ?? double.infinity,
                  minHeight: style?.getMinHeight ?? 0.0,
                  maxWidth: style?.getMaxWidth ?? double.infinity,
                  minWidth: style?.getMinWidth ?? 0.0,
                ).tighten(width: style?.getWidth, height: style?.getHeight) ??
                BoxConstraints.tightFor(
                    width: style?.getWidth, height: style?.getHeight)
            : BoxConstraints(
                maxHeight: style?.getMaxHeight ?? double.infinity,
                minHeight: style?.getMinHeight ?? 0.0,
                maxWidth: style?.getMaxWidth ?? double.infinity,
                minWidth: style?.getMinWidth ?? 0.0,
              ),
        transform =
            ((style?.getScale ?? style?.getRotate ?? style?.getOffset) != null)
                ? (Matrix4.rotationZ(style?.getRotate ?? 0.0)
                  ..scale(style?.getScale ?? 1.0)
                  ..translate(
                      style?.getOffset?.dx ?? 0.0, style?.getOffset?.dy ?? 0.0))
                : null,
        super(
            curve: style?.getCurve,
            duration: Duration(milliseconds: style?.getDuration));

  /// The [child] contained by the container.
  ///
  /// If null, and if the [constraints] are unbounded or also null, the
  /// container will expand to fill all available space in its parent, unless
  /// the parent provides unbounded constraints, in which case the container
  /// will attempt to be as small as possible.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  final StyleClass style;

  final BoxDecoration decoration;
  final Matrix4 transform;
  final BoxConstraints constraints;

  @override
  _CustomAnimatedContainerState createState() =>
      _CustomAnimatedContainerState();
}

class _CustomAnimatedContainerState
    extends AnimatedWidgetBaseState<CustomAnimatedContainer> {
  AlignmentGeometryTween _alignment;
  AlignmentGeometryTween _alignmentChild;
  EdgeInsetsGeometryTween _padding;
  DecorationTween _decoration;
  DecorationTween _foregroundDecoration;
  BoxConstraintsTween _constraints;
  EdgeInsetsGeometryTween _margin;
  Matrix4Tween _transform;
  Tween<double> _blur;
  Tween<BorderRadius> _borderRadius;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _alignment = visitor(_alignment, widget.style?.getAlignment,
        (dynamic value) => AlignmentGeometryTween(begin: value));
    _alignmentChild = visitor(_alignmentChild, widget.style?.getAlignmentChild,
        (dynamic value) => AlignmentGeometryTween(begin: value));
    _padding = visitor(_padding, widget.style?.getPadding,
        (dynamic value) => EdgeInsetsGeometryTween(begin: value));
    _decoration = visitor(_decoration, widget.decoration,
        (dynamic value) => DecorationTween(begin: value));
    _constraints = visitor(_constraints, widget.constraints,
        (dynamic value) => BoxConstraintsTween(begin: value));
    _margin = visitor(_margin, widget.style?.getMargin,
        (dynamic value) => EdgeInsetsGeometryTween(begin: value));
    _transform = visitor(_transform, widget.transform,
        (dynamic value) => Matrix4Tween(begin: value));
    _blur = visitor(_blur, widget.style?.getBackgroundBlur,
        (dynamic value) => Tween<double>(begin: value));
    _borderRadius = visitor(_borderRadius, widget.style?.getBorderRadius,
        (dynamic value) => Tween<BorderRadius>(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetTree = Container(
      child: widget.child,
      alignment: _alignmentChild?.evaluate(animation),
      padding: _padding?.evaluate(animation),
      decoration: _decoration?.evaluate(animation),
      foregroundDecoration: _foregroundDecoration?.evaluate(animation),
      constraints: _constraints?.evaluate(animation),
      margin: _margin?.evaluate(animation),
    );

    // background blur / frosted glass
    if (_blur != null) {
      double _blurValue = _blur.evaluate(animation);
      widgetTree = ClipRRect(
        borderRadius: _borderRadius.evaluate(animation),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: _blurValue, sigmaY: _blurValue),
          child: widgetTree,
        ),
      );
    }

    if (_alignment != null) {
      widgetTree =
          Align(alignment: _alignment?.evaluate(animation), child: widgetTree);
    }

    if (_transform != null) {
      widgetTree = Transform(
        alignment: FractionalOffset.center,
        transform: _transform?.evaluate(animation),
        child: widgetTree,
      );
    }

    return widgetTree;
  }
}
