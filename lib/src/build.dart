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

    if (styleModel?.alignmentContent != null)
      widgetTree =
          Align(alignment: styleModel?.alignmentContent, child: widgetTree);

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
            alignment: styleModel?.alignmentContent ?? Alignment.topCenter);
        break;
      default:
        break;
    }

    if (styleModel?.ripple != null && styleModel?.ripple?.enable == true) {
      widgetTree = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: gestureModel?.onTap ?? () {},
          borderRadius: decoration?.borderRadius,
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
      onTapDown: (TapDownDetails tapDownDetails) {
        if (gesture.onTapDown != null) gesture?.onTapDown(tapDownDetails);
        if (gesture.isTap != null) gesture?.isTap(true);
      },
      onTapUp: (TapUpDetails tapUpDetails) {
        if (gesture.onTapUp != null) gesture?.onTapUp(tapUpDetails);
        if (gesture.isTap != null) gesture?.isTap(false);
      },
      onTapCancel: () {
        if (gesture.onTapCancel != null) gesture?.onTapCancel();
        if (gesture.isTap != null) gesture?.isTap(false);
      },
      onTap: gesture?.onTap,
      onDoubleTap: gesture?.onDoubleTap,
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
  TxtBuild({this.text, this.textModel});

  final String text;
  final TextModel textModel;

  @override
  Widget build(BuildContext context) {
    Widget widgetTree;

    widgetTree = Text(
      text,
      style: textModel?.textStyle,
      textAlign: textModel?.textAlign ?? TextAlign.center,
      maxLines: textModel?.maxLines,
      textDirection: textModel?.textDirection,
    );

    return widgetTree;
  }
}

class TxtBuildEditable extends StatefulWidget {
  TxtBuildEditable({@required this.text, @required this.textModel});

  final String text;
  final TextModel textModel;

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

  @override
  void didUpdateWidget(TxtBuildEditable oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.text != _controller.text) {
      setState(() {
        _controller = TextEditingController(text: widget.text);
      });
    }
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
    TextStyle _placeholderStyle;
    TextEditingController _placehodlerController;
    bool _placeholder = false;

    // placeholder
    if (_controller.text.length == 0 && _focusNode.hasFocus == false) {
      _placeholder = true;
      _placeholderStyle = TextStyle(
        fontWeight: widget.textModel?.textStyle?.fontWeight,
        fontSize: widget.textModel?.textStyle?.fontSize,
        color:
            widget.textModel?.textStyle?.color?.withOpacity(0.7) ?? Colors.grey,
        fontStyle: widget.textModel?.textStyle?.fontStyle ?? FontStyle.normal,
        fontFamily: widget.textModel?.textStyle?.fontFamily,
        fontFamilyFallback: widget.textModel?.textStyle?.fontFamilyFallback,
        letterSpacing: widget.textModel?.textStyle?.letterSpacing,
        wordSpacing: widget.textModel?.textStyle?.wordSpacing,
      );
      _placehodlerController =
          TextEditingController(text: widget.textModel?.placeholder);
    }

    return EditableText(
      obscureText: _placeholder ? false : widget.textModel?.obscureText,
      cursorOpacityAnimates: true,
      style: _placeholderStyle ?? widget.textModel?.textStyle,
      textAlign: widget.textModel?.textAlign ?? TextAlign.center,
      maxLines: widget.textModel?.maxLines,
      textDirection: widget.textModel?.textDirection,
      controller: _placehodlerController ?? _controller,
      focusNode: _focusNode,
      backgroundCursorColor: Colors.grey,
      cursorColor: Colors.black,
      keyboardType: widget.textModel?.keyboardType ?? TextInputType.text,
      onChanged: widget.textModel?.onChange,
      onSelectionChanged: widget.textModel?.onSelectionChanged,
      onEditingComplete: () {
        _focusNode?.unfocus();
        _controller?.clearComposing();
        widget.textModel?.onEditingComplete();
      },
    );
  }
}
