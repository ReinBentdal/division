import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'build.dart';
import 'model.dart';
import 'animated.dart';

enum AngleFormat { degree, radians, cycles }

abstract class GeneralStyle {
  GeneralStyle({AngleFormat angleFormat = AngleFormat.cycles})
      : _angleFormat = angleFormat;

  /// How you want to calculate angles
  final AngleFormat _angleFormat;

  StyleModel _styleModel = StyleModel();

  @mustCallSuper
  GeneralStyle width(double width) {
    _styleModel?.width = width;
    return this;
  }

  @mustCallSuper
  GeneralStyle minWidth(double minWidth) {
    _styleModel?.minWidth = minWidth;
    return this;
  }

  @mustCallSuper
  GeneralStyle maxWidth(double maxWidth) {
    _styleModel?.maxWidth = maxWidth;
    return this;
  }

  @mustCallSuper
  GeneralStyle height(double height) {
    _styleModel?.height = height;
    return this;
  }

  @mustCallSuper
  GeneralStyle minHeight(double minHeight) {
    _styleModel?.minHeight = minHeight;
    return this;
  }

  @mustCallSuper
  GeneralStyle maxHeight(double maxHeight) {
    _styleModel?.maxHeight = maxHeight;
    return this;
  }

  @mustCallSuper
  GeneralStyle backgroundColor(Color color) {
    _styleModel?.backgroundColor = color;
    return this;
  }

  @mustCallSuper
  GeneralStyle backgroundHex(String xxxxxx) {
    _styleModel?.backgroundColor = HexColor(xxxxxx);
    return this;
  }

  @mustCallSuper
  GeneralStyle backgroundRGBA(int r, int g, int b, [double opacity = 1.0]) {
    _styleModel?.backgroundColor = Color.fromRGBO(r, g, b, opacity);
    return this;
  }

  @mustCallSuper
  GeneralStyle backgroundBlur(double intensity) {
    if (intensity < 0) throw ('background blur cannot be negative: $intensity');
    _styleModel?.backgroundBlur = intensity;
    return this;
  }

  @mustCallSuper
  GeneralStyle backgroundImage(
      {String url,
      String path,
      ImageProvider<dynamic> imageProveder,
      ColorFilter colorFilter,
      BoxFit fit,
      AlignmentGeometry alignment = Alignment.center,
      ImageRepeat repeat = ImageRepeat.noRepeat}) {
    if ((url ?? path ?? imageProveder) == null)
      throw ('Eighter the [imageProvider], [url] or the [path] has to be provided');

    ImageProvider<dynamic> image;
    if (imageProveder != null)
      image = imageProveder;
    else if (path != null)
      image = AssetImage(path);
    else
      image = NetworkImage(url);

    _styleModel?.image = DecorationImage(
      image: image,
      colorFilter: colorFilter,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
    );

    return this;
  }

  @mustCallSuper
  GeneralStyle linearGradient(
      {AlignmentGeometry begin = Alignment.centerLeft,
      AlignmentGeometry end = Alignment.centerRight,
      @required List<Color> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops}) {
    _styleModel?.gradient = LinearGradient(
        begin: begin,
        end: end,
        colors: colors,
        tileMode: tileMode,
        stops: stops);

    return this;
  }

  @mustCallSuper
  GeneralStyle radialGradient(
      {AlignmentGeometry center = Alignment.center,
      double radius = 0.5,
      @required List<Color> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops}) {
    _styleModel?.gradient = RadialGradient(
      center: center,
      radius: radius,
      colors: colors,
      tileMode: tileMode,
      stops: stops,
    );

    return this;
  }

  @mustCallSuper
  GeneralStyle sweepGradient(
      {AlignmentGeometry center = Alignment.center,
      double startAngle = 0.0,
      double endAngle,
      @required List<Color> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops}) {
    startAngle = _angleToRadians(startAngle, _angleFormat);

    if (endAngle == null)
      endAngle = pi * 2;
    else
      endAngle = _angleToRadians(endAngle, _angleFormat);

    _styleModel?.gradient = SweepGradient(
      center: center,
      startAngle: startAngle,
      endAngle: endAngle,
      colors: colors,
      stops: stops,
      tileMode: tileMode,
    );

    return this;
  }

  @mustCallSuper
  GeneralStyle border(
      {double all,
      double left,
      double right,
      double top,
      double bottom,
      Color color = const Color(0xFF000000),
      BorderStyle style = BorderStyle.solid}) {
    left = left ?? all;
    right = right ?? all;
    top = top ?? all;
    bottom = bottom ?? all;

    _styleModel?.border = Border(
      left: left == null
          ? BorderSide.none
          : BorderSide(color: color, width: left, style: style),
      right: right == null
          ? BorderSide.none
          : BorderSide(color: color, width: right, style: style),
      top: top == null
          ? BorderSide.none
          : BorderSide(color: color, width: top, style: style),
      bottom: bottom == null
          ? BorderSide.none
          : BorderSide(color: color, width: bottom, style: style),
    );

    return this;
  }

  @mustCallSuper
  GeneralStyle borderRadius(
      {double all,
      double topLeft,
      double topRight,
      double bottomLeft,
      double bottomRight}) {
    topLeft = topLeft ?? all;
    topRight = topRight ?? all;
    bottomLeft = bottomLeft ?? all;
    bottomRight = bottomRight ?? all;

    _styleModel?.borderRadius = BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? 0.0),
      topRight: Radius.circular(topRight ?? 0.0),
      bottomLeft: Radius.circular(bottomLeft ?? 0.0),
      bottomRight: Radius.circular(bottomRight ?? 0.0),
    );

    return this;
  }

  @mustCallSuper
  GeneralStyle boxShadow(
      {Color color = const Color(0x33000000),
      double blur,
      List<double> offset,
      double spread}) {
    Offset finalOffset;

    if (offset.length == 1) {
      finalOffset = Offset(offset[0] ?? 0.0, offset[0] ?? 0.0);
    } else if (offset.length == 2) {
      finalOffset = Offset(offset[0] ?? 0.0, offset[1] ?? 0.0);
    }

    _styleModel?.boxShadow = [
      BoxShadow(
        color: color,
        blurRadius: blur ?? 0.0,
        spreadRadius: spread ?? 0.0,
        offset: finalOffset ?? Offset(0.0, 0.0),
      ),
    ];

    return this;
  }

  @mustCallSuper
  GeneralStyle elevation(double elevation,
      {double angle = 0.0,
      Color color = const Color(0x33000000),
      double opacity = 1.0}) {
    if (elevation < 0)
      throw ('Elevation cant be negative. Recieved a value of $elevation');
    else if (elevation == 0) {
      _styleModel?.boxShadow = null;
    }

    double offsetX = 0.0;
    double offsetY = 0.0;

    if (angle != null) {
      angle = _angleToRadians(angle, _angleFormat);

      offsetX = sin(angle) * elevation;
      offsetY = cos(angle) * elevation;
    }

    final double spread = 0.0;
    final double blur = elevation;

    //custom curve defining the opacity
    double finalOpacity = (0.5 - (sqrt(elevation) / 19)) * opacity;
    if (finalOpacity < 0.0) finalOpacity = 0.0;

    Color colorWithOpacity = color.withOpacity(finalOpacity);

    _styleModel?.boxShadow = [
      BoxShadow(
          color: colorWithOpacity,
          blurRadius: blur,
          spreadRadius: spread,
          offset: Offset(offsetX, offsetY))
    ];

    return this;
  }

  @mustCallSuper
  GeneralStyle scale(double ratio) {
    if (ratio < 0) throw ('The widget scale cannot be negative: $ratio');
    _styleModel?.scale = ratio;
    return this;
  }

  @mustCallSuper
  GeneralStyle offset(double dx, double dy) {
    _styleModel?.offset = Offset(dx, dy);
    return this;
  }

  @mustCallSuper
  GeneralStyle rotate(double angle) {
    _styleModel?.rotate = _angleToRadians(angle, _angleFormat);

    return this;
  }

  @mustCallSuper
  GeneralStyle opacity(double opacity) {
    if (opacity < 0.0 || opacity > 1.0)
      throw ('Invalid opacity value: $opacity');

    _styleModel?.opacity = opacity;

    return this;
  }

  @mustCallSuper
  GeneralStyle ripple(bool enable, {Color splashColor, Color highlightColor}) {
    _styleModel?.ripple = RippleModel(
      enable: enable,
      splashColor: splashColor,
      highlightColor: highlightColor,
    );

    return this;
  }

  @mustCallSuper
  GeneralStyle hidden() {
    _styleModel?.overflow = OverflowType.hidden;
    return this;
  }

  @mustCallSuper
  GeneralStyle scrollable([Axis direction = Axis.vertical]) {
    _styleModel?.overflow = OverflowType.scroll;
    _styleModel?.overflowDirection = direction;
    return this;
  }

  @mustCallSuper
  GeneralStyle visible([Axis direction = Axis.vertical]) {
    _styleModel?.overflow = OverflowType.visible;
    _styleModel?.overflowDirection = direction;
    return this;
  }

  @mustCallSuper
  GeneralStyle padding(
      {double all,
      double horizontal,
      double vertical,
      double top,
      double bottom,
      double left,
      double right}) {
    top = top ?? vertical ?? all;
    bottom = bottom ?? vertical ?? all;
    left = left ?? horizontal ?? all;
    right = right ?? horizontal ?? all;

    _styleModel?.padding = EdgeInsets.only(
        top: top ?? 0.0,
        bottom: bottom ?? 0.0,
        left: left ?? 0.0,
        right: right ?? 0.0);

    return this;
  }

  @mustCallSuper
  GeneralStyle margin(
      {double all,
      double horizontal,
      double vertical,
      double top,
      double bottom,
      double left,
      double right}) {
    top = top ?? vertical ?? all;
    bottom = bottom ?? vertical ?? all;
    left = left ?? horizontal ?? all;
    right = right ?? horizontal ?? all;

    _styleModel?.margin = EdgeInsets.only(
      top: top ?? 0.0,
      bottom: bottom ?? 0.0,
      left: left ?? 0.0,
      right: right ?? 0.0,
    );

    return this;
  }

  @mustCallSuper
  GeneralStyle center([bool enable = true]) {
    if (enable == true) _styleModel?.alignment = Alignment.center;
    return this;
  }

  @mustCallSuper
  GeneralStyle left([bool enable = true]) {
    if (enable == true) _styleModel?.alignment = Alignment.centerLeft;
    return this;
  }

  @mustCallSuper
  GeneralStyle right([bool enable = true]) {
    if (enable == true) _styleModel?.alignment = Alignment.centerRight;
    return this;
  }

  @mustCallSuper
  GeneralStyle top([bool enable = true]) {
    if (enable == true) _styleModel?.alignment = Alignment.topCenter;
    return this;
  }

  @mustCallSuper
  GeneralStyle topLeft([bool enable = true]) {
    if (enable == true) _styleModel?.alignment = Alignment.topLeft;
    return this;
  }

  @mustCallSuper
  GeneralStyle topRight([bool enable = true]) {
    if (enable == true) _styleModel?.alignment = Alignment.topRight;
    return this;
  }

  @mustCallSuper
  GeneralStyle bottom([bool enable = true]) {
    if (enable == true) _styleModel?.alignment = Alignment.bottomCenter;
    return this;
  }

  @mustCallSuper
  GeneralStyle bottomLeft([bool enable = true]) {
    if (enable == true) _styleModel?.alignment = Alignment.bottomLeft;
    return this;
  }

  @mustCallSuper
  GeneralStyle bottomRight([bool enable = true]) {
    if (enable == true) _styleModel?.alignment = Alignment.bottomRight;
    return this;
  }

  @mustCallSuper
  GeneralStyle align(AlignmentGeometry alignment) {
    _styleModel?.alignment = alignment;
    return this;
  }

  @mustCallSuper
  GeneralStyle centerChild([bool enable = true]) {
    if (enable == true) _styleModel?.alignmentChild = Alignment.center;
    return this;
  }

  @mustCallSuper
  GeneralStyle leftChild([bool enable = true]) {
    if (enable == true) _styleModel?.alignmentChild = Alignment.centerLeft;
    return this;
  }

  @mustCallSuper
  GeneralStyle rightChild([bool enable = true]) {
    if (enable == true) _styleModel?.alignmentChild = Alignment.centerRight;
    return this;
  }

  @mustCallSuper
  GeneralStyle topChild([bool enable = true]) {
    if (enable == true) _styleModel?.alignmentChild = Alignment.topCenter;
    return this;
  }

  @mustCallSuper
  GeneralStyle topLeftChild([bool enable = true]) {
    if (enable == true) _styleModel?.alignmentChild = Alignment.topLeft;
    return this;
  }

  @mustCallSuper
  GeneralStyle topRightChild([bool enable = true]) {
    if (enable == true) _styleModel?.alignmentChild = Alignment.topRight;
    return this;
  }

  @mustCallSuper
  GeneralStyle bottomChild([bool enable = true]) {
    if (enable == true) _styleModel?.alignmentChild = Alignment.bottomCenter;
    return this;
  }

  @mustCallSuper
  GeneralStyle bottomLeftChild([bool enable = true]) {
    if (enable == true) _styleModel?.alignmentChild = Alignment.bottomLeft;
    return this;
  }

  @mustCallSuper
  GeneralStyle bottomRightChild([bool enable = true]) {
    if (enable == true) _styleModel?.alignmentChild = Alignment.bottomRight;
    return this;
  }

  @mustCallSuper
  GeneralStyle alignChild(AlignmentGeometry alignment) {
    _styleModel?.alignmentChild = alignment;
    return this;
  }

  @mustCallSuper
  GeneralStyle animate([int duration = 500, Curve curve = Curves.linear]) {
    if (duration < 0) throw ('Duration cannot be negative');

    _styleModel?.duration = Duration(milliseconds: duration);
    _styleModel?.curve = curve;

    return this;
  }

  GeneralStyle gesture({
    GestureTapDownCallback onTapDown,
    GestureTapUpCallback onTapUp,
    GestureTapCallback onTap,
    GestureTapCancelCallback onTapCancel,
    GestureTapDownCallback onSecondaryTapDown,
    GestureTapUpCallback onSecondaryTapUp,
    GestureTapCancelCallback onSecondaryTapCancel,
    GestureTapCallback onDoubleTap,
    GestureLongPressCallback onLongPress,
    GestureLongPressStartCallback onLongPressStart,
    GestureLongPressMoveUpdateCallback onLongPressMoveUpdate,
    GestureLongPressUpCallback onLongPressUp,
    GestureLongPressEndCallback onLongPressEnd,
    GestureDragDownCallback onVerticalDragDown,
    GestureDragStartCallback onVerticalDragStart,
    GestureDragUpdateCallback onVerticalDragUpdate,
    GestureDragEndCallback onVerticalDragEnd,
    GestureDragCancelCallback onVerticalDragCancel,
    GestureDragDownCallback onHorizontalDragDown,
    GestureDragStartCallback onHorizontalDragStart,
    GestureDragUpdateCallback onHorizontalDragUpdate,
    GestureDragEndCallback onHorizontalDragEnd,
    GestureDragCancelCallback onHorizontalDragCancel,
    GestureDragDownCallback onPanDown,
    GestureDragStartCallback onPanStart,
    GestureDragUpdateCallback onPanUpdate,
    GestureDragEndCallback onPanEnd,
    GestureDragCancelCallback onPanCancel,
    GestureScaleStartCallback onScaleStart,
    GestureScaleUpdateCallback onScaleUpdate,
    GestureScaleEndCallback onScaleEnd,
    GestureForcePressStartCallback onForcePressStart,
    GestureForcePressPeakCallback onForcePressPeak,
    GestureForcePressUpdateCallback onForcePressUpdate,
    GestureForcePressEndCallback onForcePressEnd,
    HitTestBehavior behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) {
    _styleModel?.gesture = GestureModel(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTap: onTap,
      onTapCancel: onTapCancel,
      onSecondaryTapDown: onSecondaryTapDown,
      onSecondaryTapUp: onSecondaryTapUp,
      onSecondaryTapCancel: onSecondaryTapCancel,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onLongPressStart: onLongPressStart,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onLongPressUp: onLongPressUp,
      onLongPressEnd: onLongPressEnd,
      onVerticalDragDown: onHorizontalDragDown,
      onVerticalDragStart: onHorizontalDragStart,
      onVerticalDragUpdate: onHorizontalDragUpdate,
      onVerticalDragEnd: onHorizontalDragEnd,
      onVerticalDragCancel: onHorizontalDragCancel,
      onHorizontalDragDown: onHorizontalDragDown,
      onHorizontalDragCancel: onHorizontalDragCancel,
      onHorizontalDragEnd: onHorizontalDragEnd,
      onHorizontalDragStart: onHorizontalDragStart,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onForcePressStart: onForcePressStart,
      onForcePressEnd: onForcePressEnd,
      onForcePressPeak: onForcePressPeak,
      onForcePressUpdate: onForcePressUpdate,
      onPanCancel: onPanCancel,
      onPanDown: onPanDown,
      onPanEnd: onPanEnd,
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onScaleEnd: onScaleEnd,
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      behavior: behavior,
      excludeFromSemantics: excludeFromSemantics,
      dragStartBehavior: dragStartBehavior,
    );
    return this;
  }

  double _angleToRadians(double value, AngleFormat angleFormat) {
    if (angleFormat == AngleFormat.radians)
      return value;
    else if (angleFormat == AngleFormat.cycles)
      return value * 2 * pi;
    else if (angleFormat == AngleFormat.degree) return (value / 360) * 2 * pi;

    return null;
  }
}

class Parent extends GeneralStyle {
  Parent(
      {Widget child,
      AngleFormat angleFormat = AngleFormat.cycles,
      Parent style})
      : _child = child,
        super(angleFormat: angleFormat) {
    if (style != null) inject(style);
  }

  final Widget _child;

  @override
  Parent width(double width) => super.width(width);
  @override
  Parent minWidth(double minWidth) => super.minWidth(minWidth);
  @override
  Parent maxWidth(double maxWidth) => super.maxWidth(maxWidth);
  @override
  Parent height(double height) => super.height(height);
  @override
  Parent minHeight(double minHeight) => super.minHeight(minHeight);
  @override
  Parent maxHeight(double maxHeight) => super.maxHeight(maxHeight);
  @override
  Parent backgroundColor(Color color) => super.backgroundColor(color);
  @override
  Parent backgroundHex(String xxxxxx) => super.backgroundHex(xxxxxx);
  @override
  Parent backgroundRGBA(int r, int g, int b, [double opacity = 1.0]) =>
      super.backgroundRGBA(r, g, b, opacity);
  @override
  Parent backgroundBlur(double intensity) => super.backgroundBlur(intensity);
  @override
  Parent backgroundImage(
          {String url,
          String path,
          ImageProvider<dynamic> imageProveder,
          ColorFilter colorFilter,
          BoxFit fit,
          AlignmentGeometry alignment = Alignment.center,
          ImageRepeat repeat = ImageRepeat.noRepeat}) =>
      super.backgroundImage(
          url: url,
          path: path,
          imageProveder: imageProveder,
          colorFilter: colorFilter,
          fit: fit,
          alignment: alignment,
          repeat: repeat);
  @override
  Parent linearGradient(
          {AlignmentGeometry begin = Alignment.centerLeft,
          AlignmentGeometry end = Alignment.centerRight,
          @required List<Color> colors,
          TileMode tileMode = TileMode.clamp,
          List<double> stops}) =>
      super.linearGradient(
          begin: begin,
          end: end,
          colors: colors,
          tileMode: tileMode,
          stops: stops);
  @override
  Parent radialGradient(
          {AlignmentGeometry center = Alignment.center,
          double radius = 0.5,
          @required List<Color> colors,
          TileMode tileMode = TileMode.clamp,
          List<double> stops}) =>
      super.radialGradient(
          center: center,
          radius: radius,
          colors: colors,
          tileMode: tileMode,
          stops: stops);
  @override
  Parent sweepGradient(
          {AlignmentGeometry center = Alignment.center,
          double startAngle = 0.0,
          double endAngle,
          @required List<Color> colors,
          TileMode tileMode = TileMode.clamp,
          List<double> stops}) =>
      super.sweepGradient(
          center: center,
          startAngle: startAngle,
          endAngle: endAngle,
          colors: colors,
          tileMode: tileMode,
          stops: stops);
  @override
  Parent border(
          {double all,
          double left,
          double right,
          double top,
          double bottom,
          Color color = const Color(0xFF000000),
          BorderStyle style = BorderStyle.solid}) =>
      super.border(
          all: all,
          left: left,
          right: right,
          top: top,
          bottom: bottom,
          color: color,
          style: style);
  @override
  Parent borderRadius(
          {double all,
          double topLeft,
          double topRight,
          double bottomLeft,
          double bottomRight}) =>
      super.borderRadius(
          all: all,
          topLeft: topLeft,
          topRight: topRight,
          bottomLeft: bottomLeft,
          bottomRight: bottomRight);
  @override
  Parent boxShadow(
          {Color color = const Color(0x33000000),
          double blur,
          List<double> offset,
          double spread}) =>
      super.boxShadow(color: color, blur: blur, offset: offset, spread: spread);
  @override
  Parent elevation(double elevation,
          {double angle = 0.0,
          Color color = const Color(0x33000000),
          double opacity = 1.0}) =>
      super.elevation(elevation, angle: angle, color: color, opacity: opacity);
  @override
  Parent scale(double ratio) => super.scale(ratio);
  @override
  Parent offset(double dx, double dy) => super.offset(dx, dy);
  @override
  Parent rotate(double angle) => super.rotate(angle);
  @override
  Parent opacity(double opacity) => super.opacity(opacity);
  @override
  Parent ripple(bool enable, {Color splashColor, Color highlightColor}) => super
      .ripple(enable, splashColor: splashColor, highlightColor: highlightColor);
  @override
  Parent hidden() => super.hidden();
  @override
  Parent scrollable([Axis direction = Axis.vertical]) =>
      super.scrollable(direction);
  @override
  Parent visible([Axis direction = Axis.vertical]) => super.visible(direction);
  @override
  Parent padding(
          {double all,
          double horizontal,
          double vertical,
          double top,
          double bottom,
          double left,
          double right}) =>
      super.padding(
          all: all,
          horizontal: horizontal,
          vertical: vertical,
          top: top,
          bottom: bottom,
          left: left,
          right: right);
  @override
  Parent margin(
          {double all,
          double horizontal,
          double vertical,
          double top,
          double bottom,
          double left,
          double right}) =>
      super.margin(
          all: all,
          horizontal: horizontal,
          vertical: vertical,
          top: top,
          bottom: bottom,
          left: left,
          right: right);
  @override
  Parent center([bool enable = true]) => super.center(enable);
  @override
  Parent left([bool enable = true]) => super.left(enable);
  @override
  Parent right([bool enable = true]) => super.right(enable);
  @override
  Parent top([bool enable = true]) => super.top(enable);
  @override
  Parent topLeft([bool enable = true]) => super.topLeft(enable);
  @override
  Parent topRight([bool enable = true]) => super.topRight(enable);
  @override
  Parent bottom([bool enable = true]) => super.bottom(enable);
  @override
  Parent bottomLeft([bool enable = true]) => super.bottomLeft(enable);
  @override
  Parent bottomRight([bool enable = true]) => super.bottomRight(enable);
  @override
  Parent align(AlignmentGeometry alignment) => super.align(alignment);
  @override
  Parent centerChild([bool enable = true]) => super.centerChild(enable);
  @override
  Parent leftChild([bool enable = true]) => super.leftChild(enable);
  @override
  Parent rightChild([bool enable = true]) => super.rightChild(enable);
  @override
  Parent topChild([bool enable = true]) => super.topChild(enable);
  @override
  Parent topLeftChild([bool enable = true]) => super.topLeftChild(enable);
  @override
  Parent topRightChild([bool enable = true]) => super.topRightChild(enable);
  @override
  Parent bottomChild([bool enable = true]) => super.bottomChild(enable);
  @override
  Parent bottomLeftChild([bool enable = true]) => super.bottomLeftChild(enable);
  @override
  Parent bottomRightChild([bool enable = true]) =>
      super.bottomRightChild(enable);
  @override
  Parent alignChild(AlignmentGeometry alignment) => super.alignChild(alignment);
  @override
  Parent animate([int duration = 500, Curve curve = Curves.linear]) =>
      super.animate(duration, curve);

  Parent inject(Parent intruder, {bool override = false}) {
    _styleModel.inject(intruder._styleModel, override);
    return this;
  }

  @override
  Parent gesture({
    GestureTapDownCallback onTapDown,
    GestureTapUpCallback onTapUp,
    GestureTapCallback onTap,
    GestureTapCancelCallback onTapCancel,
    GestureTapDownCallback onSecondaryTapDown,
    GestureTapUpCallback onSecondaryTapUp,
    GestureTapCancelCallback onSecondaryTapCancel,
    GestureTapCallback onDoubleTap,
    GestureLongPressCallback onLongPress,
    GestureLongPressStartCallback onLongPressStart,
    GestureLongPressMoveUpdateCallback onLongPressMoveUpdate,
    GestureLongPressUpCallback onLongPressUp,
    GestureLongPressEndCallback onLongPressEnd,
    GestureDragDownCallback onVerticalDragDown,
    GestureDragStartCallback onVerticalDragStart,
    GestureDragUpdateCallback onVerticalDragUpdate,
    GestureDragEndCallback onVerticalDragEnd,
    GestureDragCancelCallback onVerticalDragCancel,
    GestureDragDownCallback onHorizontalDragDown,
    GestureDragStartCallback onHorizontalDragStart,
    GestureDragUpdateCallback onHorizontalDragUpdate,
    GestureDragEndCallback onHorizontalDragEnd,
    GestureDragCancelCallback onHorizontalDragCancel,
    GestureDragDownCallback onPanDown,
    GestureDragStartCallback onPanStart,
    GestureDragUpdateCallback onPanUpdate,
    GestureDragEndCallback onPanEnd,
    GestureDragCancelCallback onPanCancel,
    GestureScaleStartCallback onScaleStart,
    GestureScaleUpdateCallback onScaleUpdate,
    GestureScaleEndCallback onScaleEnd,
    GestureForcePressStartCallback onForcePressStart,
    GestureForcePressPeakCallback onForcePressPeak,
    GestureForcePressUpdateCallback onForcePressUpdate,
    GestureForcePressEndCallback onForcePressEnd,
    HitTestBehavior behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      super.gesture(
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTap: onTap,
        onTapCancel: onTapCancel,
        onSecondaryTapDown: onSecondaryTapDown,
        onSecondaryTapUp: onSecondaryTapUp,
        onSecondaryTapCancel: onSecondaryTapCancel,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        onLongPressStart: onLongPressStart,
        onLongPressMoveUpdate: onLongPressMoveUpdate,
        onLongPressUp: onLongPressUp,
        onLongPressEnd: onLongPressEnd,
        onVerticalDragDown: onHorizontalDragDown,
        onVerticalDragStart: onHorizontalDragStart,
        onVerticalDragUpdate: onHorizontalDragUpdate,
        onVerticalDragEnd: onHorizontalDragEnd,
        onVerticalDragCancel: onHorizontalDragCancel,
        onHorizontalDragDown: onHorizontalDragDown,
        onHorizontalDragCancel: onHorizontalDragCancel,
        onHorizontalDragEnd: onHorizontalDragEnd,
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onForcePressStart: onForcePressStart,
        onForcePressEnd: onForcePressEnd,
        onForcePressPeak: onForcePressPeak,
        onForcePressUpdate: onForcePressUpdate,
        onPanCancel: onPanCancel,
        onPanDown: onPanDown,
        onPanEnd: onPanEnd,
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onScaleEnd: onScaleEnd,
        onScaleStart: onScaleStart,
        onScaleUpdate: onScaleUpdate,
        behavior: behavior,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
      );

  Widget build() {
    if (_styleModel?.duration != null) {
      return ParentAnimated(
        child: _child,
        styleModel: _styleModel,
      );
    }

    return ParentBuild(
      child: _child,
      styleModel: _styleModel,
    );
  }
}

class Txt extends GeneralStyle {
  Txt(final String text,
      {AngleFormat angleFormat = AngleFormat.cycles, final Txt style})
      : _text = text,
        super(angleFormat: angleFormat) {
    if (style != null) inject(style);
  }

  final String _text;
  final TextModel _textModel = TextModel();

  @override
  Txt width(double width) => super.width(width);
  @override
  Txt minWidth(double minWidth) => super.minWidth(minWidth);
  @override
  Txt maxWidth(double maxWidth) => super.maxWidth(maxWidth);
  @override
  Txt height(double height) => super.height(height);
  @override
  Txt minHeight(double minHeight) => super.minHeight(minHeight);
  @override
  Txt maxHeight(double maxHeight) => super.maxHeight(maxHeight);
  @override
  Txt backgroundColor(Color color) => super.backgroundColor(color);
  @override
  Txt backgroundHex(String xxxxxx) => super.backgroundHex(xxxxxx);
  @override
  Txt backgroundRGBA(int r, int g, int b, [double opacity = 1.0]) =>
      super.backgroundRGBA(r, g, b, opacity);
  @override
  Txt backgroundBlur(double intensity) => super.backgroundBlur(intensity);
  @override
  Txt backgroundImage(
          {String url,
          String path,
          ImageProvider<dynamic> imageProveder,
          ColorFilter colorFilter,
          BoxFit fit,
          AlignmentGeometry alignment = Alignment.center,
          ImageRepeat repeat = ImageRepeat.noRepeat}) =>
      super.backgroundImage(
          url: url,
          path: path,
          imageProveder: imageProveder,
          colorFilter: colorFilter,
          fit: fit,
          alignment: alignment,
          repeat: repeat);
  @override
  Txt linearGradient(
          {AlignmentGeometry begin = Alignment.centerLeft,
          AlignmentGeometry end = Alignment.centerRight,
          @required List<Color> colors,
          TileMode tileMode = TileMode.clamp,
          List<double> stops}) =>
      super.linearGradient(
          begin: begin,
          end: end,
          colors: colors,
          tileMode: tileMode,
          stops: stops);
  @override
  Txt radialGradient(
          {AlignmentGeometry center = Alignment.center,
          double radius = 0.5,
          @required List<Color> colors,
          TileMode tileMode = TileMode.clamp,
          List<double> stops}) =>
      super.radialGradient(
          center: center,
          radius: radius,
          colors: colors,
          tileMode: tileMode,
          stops: stops);
  @override
  Txt sweepGradient(
          {AlignmentGeometry center = Alignment.center,
          double startAngle = 0.0,
          double endAngle,
          @required List<Color> colors,
          TileMode tileMode = TileMode.clamp,
          List<double> stops}) =>
      super.sweepGradient(
          center: center,
          startAngle: startAngle,
          endAngle: endAngle,
          colors: colors,
          tileMode: tileMode,
          stops: stops);
  @override
  Txt border(
          {double all,
          double left,
          double right,
          double top,
          double bottom,
          Color color = const Color(0xFF000000),
          BorderStyle style = BorderStyle.solid}) =>
      super.border(
          all: all,
          left: left,
          right: right,
          top: top,
          bottom: bottom,
          color: color,
          style: style);
  @override
  Txt borderRadius(
          {double all,
          double topLeft,
          double topRight,
          double bottomLeft,
          double bottomRight}) =>
      super.borderRadius(
          all: all,
          topLeft: topLeft,
          topRight: topRight,
          bottomLeft: bottomLeft,
          bottomRight: bottomRight);
  @override
  Txt boxShadow(
          {Color color = const Color(0x33000000),
          double blur,
          List<double> offset,
          double spread}) =>
      super.boxShadow(color: color, blur: blur, offset: offset, spread: spread);
  @override
  Txt elevation(double elevation,
          {double angle = 0.0,
          Color color = const Color(0x33000000),
          double opacity = 1.0}) =>
      super.elevation(elevation, angle: angle, color: color, opacity: opacity);
  @override
  Txt scale(double ratio) => super.scale(ratio);
  @override
  Txt offset(double dx, double dy) => super.offset(dx, dy);
  @override
  Txt rotate(double angle) => super.rotate(angle);
  @override
  Txt opacity(double opacity) => super.opacity(opacity);
  @override
  Txt ripple(bool enable, {Color splashColor, Color highlightColor}) => super
      .ripple(enable, splashColor: splashColor, highlightColor: highlightColor);
  @override
  Txt hidden() => super.hidden();
  @override
  Txt scrollable([Axis direction = Axis.vertical]) =>
      super.scrollable(direction);
  @override
  Txt visible([Axis direction = Axis.vertical]) => super.visible(direction);
  @override
  Txt padding(
          {double all,
          double horizontal,
          double vertical,
          double top,
          double bottom,
          double left,
          double right}) =>
      super.padding(
          all: all,
          horizontal: horizontal,
          vertical: vertical,
          top: top,
          bottom: bottom,
          left: left,
          right: right);
  @override
  Txt margin(
          {double all,
          double horizontal,
          double vertical,
          double top,
          double bottom,
          double left,
          double right}) =>
      super.margin(
          all: all,
          horizontal: horizontal,
          vertical: vertical,
          top: top,
          bottom: bottom,
          left: left,
          right: right);
  @override
  Txt center([bool enable = true]) => super.center(enable);
  @override
  Txt left([bool enable = true]) => super.left(enable);
  @override
  Txt right([bool enable = true]) => super.right(enable);
  @override
  Txt top([bool enable = true]) => super.top(enable);
  @override
  Txt topLeft([bool enable = true]) => super.topLeft(enable);
  @override
  Txt topRight([bool enable = true]) => super.topRight(enable);
  @override
  Txt bottom([bool enable = true]) => super.bottom(enable);
  @override
  Txt bottomLeft([bool enable = true]) => super.bottomLeft(enable);
  @override
  Txt bottomRight([bool enable = true]) => super.bottomRight(enable);
  @override
  Txt align(AlignmentGeometry alignment) => super.align(alignment);
  @override
  Txt centerChild([bool enable = true]) => super.centerChild(enable);
  @override
  Txt leftChild([bool enable = true]) => super.leftChild(enable);
  @override
  Txt rightChild([bool enable = true]) => super.rightChild(enable);
  @override
  Txt topChild([bool enable = true]) => super.topChild(enable);
  @override
  Txt topLeftChild([bool enable = true]) => super.topLeftChild(enable);
  @override
  Txt topRightChild([bool enable = true]) => super.topRightChild(enable);
  @override
  Txt bottomChild([bool enable = true]) => super.bottomChild(enable);
  @override
  Txt bottomLeftChild([bool enable = true]) => super.bottomLeftChild(enable);
  @override
  Txt bottomRightChild([bool enable = true]) => super.bottomRightChild(enable);
  @override
  Txt alignChild(AlignmentGeometry alignment) => super.alignChild(alignment);
  @override
  Txt animate([int duration = 500, Curve curve = Curves.linear]) =>
      super.animate(duration, curve);

  Txt inject(Txt intruder, {bool override = false}) {
    _textModel?.inject(intruder?._textModel, override);
    _styleModel?.inject(intruder?._styleModel, override);
    return this;
  }

  @override
  Txt gesture({
    GestureTapDownCallback onTapDown,
    GestureTapUpCallback onTapUp,
    GestureTapCallback onTap,
    GestureTapCancelCallback onTapCancel,
    GestureTapDownCallback onSecondaryTapDown,
    GestureTapUpCallback onSecondaryTapUp,
    GestureTapCancelCallback onSecondaryTapCancel,
    GestureTapCallback onDoubleTap,
    GestureLongPressCallback onLongPress,
    GestureLongPressStartCallback onLongPressStart,
    GestureLongPressMoveUpdateCallback onLongPressMoveUpdate,
    GestureLongPressUpCallback onLongPressUp,
    GestureLongPressEndCallback onLongPressEnd,
    GestureDragDownCallback onVerticalDragDown,
    GestureDragStartCallback onVerticalDragStart,
    GestureDragUpdateCallback onVerticalDragUpdate,
    GestureDragEndCallback onVerticalDragEnd,
    GestureDragCancelCallback onVerticalDragCancel,
    GestureDragDownCallback onHorizontalDragDown,
    GestureDragStartCallback onHorizontalDragStart,
    GestureDragUpdateCallback onHorizontalDragUpdate,
    GestureDragEndCallback onHorizontalDragEnd,
    GestureDragCancelCallback onHorizontalDragCancel,
    GestureDragDownCallback onPanDown,
    GestureDragStartCallback onPanStart,
    GestureDragUpdateCallback onPanUpdate,
    GestureDragEndCallback onPanEnd,
    GestureDragCancelCallback onPanCancel,
    GestureScaleStartCallback onScaleStart,
    GestureScaleUpdateCallback onScaleUpdate,
    GestureScaleEndCallback onScaleEnd,
    GestureForcePressStartCallback onForcePressStart,
    GestureForcePressPeakCallback onForcePressPeak,
    GestureForcePressUpdateCallback onForcePressUpdate,
    GestureForcePressEndCallback onForcePressEnd,
    HitTestBehavior behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      super.gesture(
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTap: onTap,
        onTapCancel: onTapCancel,
        onSecondaryTapDown: onSecondaryTapDown,
        onSecondaryTapUp: onSecondaryTapUp,
        onSecondaryTapCancel: onSecondaryTapCancel,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        onLongPressStart: onLongPressStart,
        onLongPressMoveUpdate: onLongPressMoveUpdate,
        onLongPressUp: onLongPressUp,
        onLongPressEnd: onLongPressEnd,
        onVerticalDragDown: onHorizontalDragDown,
        onVerticalDragStart: onHorizontalDragStart,
        onVerticalDragUpdate: onHorizontalDragUpdate,
        onVerticalDragEnd: onHorizontalDragEnd,
        onVerticalDragCancel: onHorizontalDragCancel,
        onHorizontalDragDown: onHorizontalDragDown,
        onHorizontalDragCancel: onHorizontalDragCancel,
        onHorizontalDragEnd: onHorizontalDragEnd,
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onForcePressStart: onForcePressStart,
        onForcePressEnd: onForcePressEnd,
        onForcePressPeak: onForcePressPeak,
        onForcePressUpdate: onForcePressUpdate,
        onPanCancel: onPanCancel,
        onPanDown: onPanDown,
        onPanEnd: onPanEnd,
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onScaleEnd: onScaleEnd,
        onScaleStart: onScaleStart,
        onScaleUpdate: onScaleUpdate,
        behavior: behavior,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
      );

  Txt bold([bool enable = true]) {
    if (enable == true) _textModel?.fontWeight = FontWeight.bold;

    return this;
  }

  Txt italic([bool enable = true]) {
    if (enable == true) _textModel?.fontStyle = FontStyle.italic;

    return this;
  }

  Txt fontWeight(FontWeight weight) {
    _textModel?.fontWeight = weight;
    return this;
  }

  Txt fontSize(double fontSize) {
    _textModel?.fontSize = fontSize;
    return this;
  }

  Txt fontFamily(String font, {List<String> fontFamilyFallback}) {
    _textModel?.fontFamily = font;
    _textModel?.fontFamilyFallback = fontFamilyFallback;
    return this;
  }

  Txt textColor(Color textColor) {
    _textModel?.textColor = textColor;
    return this;
  }

  Txt textAlign(TextAlign alignment) {
    _textModel?.textAlign = alignment;
    return this;
  }

  Txt maxLines(int maxLines) {
    _textModel?.maxLines = maxLines;
    return this;
  }

  Txt letterSpacing(double space) {
    _textModel?.letterSpacing = space;
    return this;
  }

  Txt wordSpacing(double space) {
    _textModel?.wordSpacing = space;
    return this;
  }

  /// Make the widget editable just like a TextField.
  ///
  /// If `focusNode` isnt spesified an internal `focusNode` will be created.
  Txt editable(bool enable,
      {TextInputType keyboardType,
      void Function(String) onChange,
      void Function(bool focus) onFocusChange,
      void Function(TextSelection, SelectionChangedCause) onSelectionChanged,
      FocusNode focusNode}) {
    _textModel?.editable = enable;
    _textModel?.keyboardType = keyboardType;
    _textModel?.onFocusChange = onFocusChange;
    _textModel?.onChange = onChange;
    _textModel?.onSelectionChanged = onSelectionChanged;
    _textModel?.focusNode = focusNode;
    return this;
  }

  Widget build() {
    Widget widgetTree;
    if (_textModel?.editable != null && _textModel?.editable == true) {
      widgetTree = TxtBuildEditable(
        text: _text,
        textModel: _textModel,
        styleModel: _styleModel,
      );
    } else {
      widgetTree = TxtBuild(
        text: _text,
        textModel: _textModel,
        styleModel: _styleModel,
      );
    }

    if (_styleModel?.duration != null) {
      return ParentAnimated(
        child: widgetTree,
        styleModel: _styleModel,
      );
    } else {
      return ParentBuild(
        child: widgetTree,
        styleModel: _styleModel,
      );
    }
  }
}
