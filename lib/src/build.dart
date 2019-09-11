import 'dart:ui';

import 'package:flutter/material.dart';

import 'model.dart';

class ParentBuild extends StatelessWidget {
  ParentBuild(
      {@required this.child,
      @required this.styleModel,
      @required this.gestureModel})
      : decoration = styleModel?.decoration,
        constraints = styleModel?.constraints;

  final Widget child;
  final StyleModel styleModel;
  final GestureModel gestureModel;

  final BoxDecoration decoration;
  final BoxConstraints constraints;

  EdgeInsetsGeometry get _paddingIncludingDecoration {
    if (decoration == null || decoration.padding == null)
      return styleModel?.padding;
    final EdgeInsetsGeometry decorationPadding = decoration.padding;
    if (styleModel?.padding == null) return decorationPadding;
    final EdgeInsetsGeometry padding = styleModel?.padding;
    return padding.add(decorationPadding);
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetTree = child;

    if (child == null && (constraints == null || !constraints.isTight)) {
      widgetTree = LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      );
    }

    if (styleModel?.alignmentChild != null)
      widgetTree =
          Align(alignment: styleModel?.alignmentChild, child: widgetTree);

    final EdgeInsetsGeometry effectivePadding = _paddingIncludingDecoration;
    if (effectivePadding != null)
      widgetTree = Padding(padding: effectivePadding, child: widgetTree);

    switch (styleModel?.overflow) {
      case OverflowType.scroll:
        widgetTree = SingleChildScrollView(
            child: widgetTree, scrollDirection: styleModel?.overflowDirection);
        break;
      case OverflowType.hidden:
        widgetTree = ClipRRect(
            borderRadius:
                decoration?.borderRadius ?? BorderRadius.circular(0.0),
            child: widgetTree);
        break;
      case OverflowType.visible:
        widgetTree = OverflowBox(
            child: widgetTree,
            maxHeight: styleModel?.overflowDirection == Axis.vertical
                ? double.infinity
                : null,
            maxWidth: styleModel?.overflowDirection == Axis.horizontal
                ? double.infinity
                : null,
            alignment: styleModel?.alignmentChild ?? Alignment.topCenter);
        break;
      default:
        break;
    }

    if (styleModel?.ripple != null && styleModel?.ripple?.enable == true) {
      widgetTree = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: gestureModel?.onTap ?? () {},
          borderRadius: decoration.borderRadius,
          highlightColor: styleModel?.ripple?.highlightColor,
          splashColor: styleModel?.ripple?.splashColor,
          child: widgetTree,
        ),
      );
    }

    if (decoration != null)
      widgetTree = DecoratedBox(decoration: decoration, child: widgetTree);

    if (gestureModel != null) widgetTree = gestures(widgetTree, gestureModel);

    if (constraints != null)
      widgetTree = ConstrainedBox(constraints: constraints, child: widgetTree);

    if (styleModel?.margin != null)
      widgetTree = Padding(padding: styleModel?.margin, child: widgetTree);

    if (styleModel?.backgroundBlur != null) {
      widgetTree = ClipRRect(
        borderRadius: decoration?.borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: styleModel?.backgroundBlur,
            sigmaY: styleModel?.backgroundBlur,
          ),
          child: widgetTree,
        ),
      );
    }

    if (styleModel?.alignment != null)
      widgetTree = Align(alignment: styleModel?.alignment, child: widgetTree);

    if (styleModel?.transform != null) {
      widgetTree = Transform(
        alignment: FractionalOffset.center,
        transform: styleModel?.transform,
        child: widgetTree,
      );
    }

    if (styleModel?.opacity != null)
      widgetTree = Opacity(opacity: styleModel?.opacity, child: widgetTree);

    return widgetTree;
  }

  Widget gestures(Widget widgetTree, GestureModel gesture) {
    return GestureDetector(
      onTap: gesture?.onTap,
      onTapUp: gesture?.onTapUp,
      onTapCancel: gesture?.onTapCancel,
      onDoubleTap: gesture?.onDoubleTap,
      onTapDown: gesture?.onTapDown,
      onLongPress: gesture?.onLongPress,
      onLongPressStart: gesture?.onLongPressStart,
      onLongPressEnd: gesture?.onLongPressEnd,
      onLongPressMoveUpdate: gesture?.onLongPressMoveUpdate,
      onLongPressUp: gesture?.onLongPressUp,
      onVerticalDragStart: gesture?.onVerticalDragStart,
      onVerticalDragEnd: gesture?.onVerticalDragEnd,
      onVerticalDragDown: gesture?.onVerticalDragDown,
      onVerticalDragCancel: gesture?.onVerticalDragCancel,
      onVerticalDragUpdate: gesture?.onVerticalDragUpdate,
      onHorizontalDragStart: gesture?.onHorizontalDragStart,
      onHorizontalDragEnd: gesture?.onHorizontalDragEnd,
      onHorizontalDragCancel: gesture?.onHorizontalDragCancel,
      onHorizontalDragUpdate: gesture?.onHorizontalDragUpdate,
      onHorizontalDragDown: gesture?.onHorizontalDragDown,
      onForcePressStart: gesture?.onForcePressStart,
      onForcePressEnd: gesture?.onForcePressEnd,
      onForcePressPeak: gesture?.onForcePressPeak,
      onForcePressUpdate: gesture?.onForcePressUpdate,
      onPanStart: gesture?.onPanStart,
      onPanEnd: gesture?.onPanEnd,
      onPanCancel: gesture?.onPanCancel,
      onPanDown: gesture?.onPanDown,
      onPanUpdate: gesture?.onPanUpdate,
      onScaleStart: gesture?.onScaleStart,
      onScaleEnd: gesture?.onScaleEnd,
      onScaleUpdate: gesture?.onScaleUpdate,
      behavior: gesture?.behavior,
      excludeFromSemantics: gesture?.excludeFromSemantics,
      dragStartBehavior: gesture?.dragStartBehavior,
      child: widgetTree,
    );
  }
}

class TxtBuild extends StatelessWidget {
  TxtBuild({this.text, this.textModel, this.styleModel});

  final String text;
  final TextModel textModel;
  final StyleModel styleModel;

  @override
  Widget build(BuildContext context) {
    Widget widgetTree;

    widgetTree = Text(
      text,
      style: textModel?.textStyle,
      textAlign: textModel?.textAlign ?? TextAlign.center,
      maxLines: textModel?.maxLines,
    );

    return widgetTree;
  }
}

class TxtBuildEditable extends StatefulWidget {
  TxtBuildEditable(
      {@required this.text,
      @required this.textModel,
      @required this.styleModel});

  final String text;
  final TextModel textModel;
  final StyleModel styleModel;

  @override
  _TxtBuildEditableState createState() => _TxtBuildEditableState();
}

class _TxtBuildEditableState extends State<TxtBuildEditable> {
  TextEditingController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
    _initializeFocusNode();
  }

  void _initializeFocusNode() {
    if (_focusNode == null)
      _focusNode = widget.textModel?.focusNode ?? FocusNode();

    _focusNode?.addListener(() {
      if (widget.textModel?.onFocusChange != null)
        widget.textModel?.onFocusChange(_focusNode?.hasFocus);
    });
  }

  @override
  void dispose() {
    super.dispose();

    _focusNode?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EditableText(
      cursorOpacityAnimates: true,
      style: widget.textModel?.textStyle,
      textAlign: widget.textModel?.textAlign ?? TextAlign.center,
      maxLines: widget.textModel?.maxLines,
      controller: _controller,
      focusNode: _focusNode,
      backgroundCursorColor: Colors.grey,
      cursorColor: Colors.black,
      keyboardType: widget.textModel?.keyboardType ?? TextInputType.text,
      onChanged: widget.textModel?.onChange,
      onSelectionChanged: widget.textModel?.onSelectionChanged,
    );
  }
}
