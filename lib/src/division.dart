import 'package:flutter/material.dart';

import 'style_class.dart';
import 'gesture_class.dart';
import 'custom_animated_container.dart';

class Division extends StatelessWidget {
  final Widget child;
  final StyleClass style;
  final GestureClass gesture;

  Division({this.child, this.style, this.gesture});

  Widget _buildGestureDetector(Widget widgetChild) {
    return GestureDetector(
      onTap: gesture?.getOnTap,
      onTapUp: gesture?.getOnTapUp,
      onTapCancel: gesture?.getOnTapCancel,
      onDoubleTap: gesture?.getOnDoubleTap,
      onTapDown: gesture?.getOnTapDown,
      onLongPress: gesture?.getOnLongPress,
      onLongPressStart: gesture?.getOnLongPressStart,
      onLongPressEnd: gesture?.getOnLongPressEnd,
      onLongPressMoveUpdate: gesture?.getOnLongPressMoveUpdate,
      onLongPressUp: gesture?.getOnLongPressUp,
      onVerticalDragStart: gesture?.getOnVerticalDragStart,
      onVerticalDragEnd: gesture?.getOnVerticalDragEnd,
      onVerticalDragDown: gesture?.getOnVerticalDragDown,
      onVerticalDragCancel: gesture?.getOnVerticalDragCancel,
      onVerticalDragUpdate: gesture?.getOnVerticalDragUpdate,
      onHorizontalDragStart: gesture?.getOnHorizontalDragStart,
      onHorizontalDragEnd: gesture?.getOnHorizontalDragEnd,
      onHorizontalDragCancel: gesture?.getOnHorizontalDragCancel,
      onHorizontalDragUpdate: gesture?.getOnHorizontalDragUpdate,
      onHorizontalDragDown: gesture?.getOnHorizontalDragDown,
      onForcePressStart: gesture?.getOnForcePressStart,
      onForcePressEnd: gesture?.getOnForcePressEnd,
      onForcePressPeak: gesture?.getOnForcePressPeak,
      onForcePressUpdate: gesture?.getOnForcePressUpdate,
      onPanStart: gesture?.getOnPanStart,
      onPanEnd: gesture?.getOnPanEnd,
      onPanCancel: gesture?.getOnPanCancel,
      onPanDown: gesture?.getOnPanDown,
      onPanUpdate: gesture?.getOnPanUpdate,
      onScaleStart: gesture?.getOnScaleStart,
      onScaleEnd: gesture?.getOnScaleEnd,
      onScaleUpdate: gesture?.getOnScaleUpdate,
      child: widgetChild,
    );
  }

  Widget _buildContainer(Widget widgetChild) {
    Widget widgetTree = widgetChild;

    if (style?.getAlignmentChild != null) {
      widgetTree =
          Align(alignment: style?.getAlignmentChild, child: widgetTree);
    }

    widgetTree = Container(
      width: style?.getWidth,
      height: style?.getHeight,
      // alignment: style?.getAlignmentChild,
      padding: style?.getPadding,
      margin: style?.getMargin,
      constraints: BoxConstraints(
        maxHeight: style?.getMaxHeight ?? double.infinity,
        minHeight: style?.getMinHeight ?? 0.0,
        maxWidth: style?.getMaxWidth ?? double.infinity,
        minWidth: style?.getMinWidth ?? 0.0,
      ),
      decoration: BoxDecoration(
        color: style?.getBackgroundColor,
        gradient: style?.getGradient,
        border: style?.getBorder,
        borderRadius: style?.getBorderRadius,
        boxShadow: style?.getBoxShadow,
      ),
      child: widgetTree,
    );

    if (style?.getAlignment != null) {
      widgetTree = Align(
        alignment: style?.getAlignment ?? Alignment.centerLeft,
        child: widgetTree,
      );
    }

    if ((style?.getScale ?? style?.getRotate ?? style?.getOffset) != null) {
      widgetTree = Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.rotationZ(style?.getRotate ?? 0.0)
          ..scale(style?.getScale ?? 1.0)
          ..translate(
            style?.getOffset?.dx ?? 0.0,
            style?.getOffset?.dy ?? 0.0,
          ),
        child: widgetTree,
      );
    }

    return widgetTree;
  }

  // TODO: Fix ripple effect
  Widget _buildRipple(Widget widgetChild) {
    return Stack(
      overflow: Overflow.clip,
      fit: StackFit.loose,
      alignment: style?.getAlignmentChild,
      children: <Widget>[
        Container(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: style?.getBorderRadius,
              onTap: () {},
            ),
          ),
        ),
        widgetChild,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // return _buildWidgetTree();

    Widget widgetTree = this.child;

    if (style?.getRipple?.enable == true) {
      widgetTree = _buildRipple(widgetTree);
    }

    // style with or without animation
    if (style != null) {
      if (style?.getDuration != null) {
        // widgetTree = _buildAnimatedContainer(widgetTree);
        widgetTree =
            CustomAnimatedContainer(style: this.style, child: widgetTree);
      } else {
        widgetTree = _buildContainer(widgetTree);
      }
    }

    if (gesture != null) {
      widgetTree = _buildGestureDetector(widgetTree);
    }

    return widgetTree;
  }
}
