import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RippleModel {
  final bool enable;
  final Color highlightColor;
  final Color splashColor;

  RippleModel({this.enable, this.highlightColor, this.splashColor});
}

class BackgroundModel {
  Color _color;
  double _blur;
  DecorationImage _image;

  Color get exportBackgroundColor => _color;
  double get exportBackgroundBlur => _blur;
  DecorationImage get exportBackgroundImage => _image;

  /// BackgroundColor
  void color(Color color) {
    _color = color;
  }

  /// background color in the rgba format
  void rgba(int r, int g, int b, [double opacity = 1.0]) {
    _color = Color.fromRGBO(r, g, b, opacity);
  }

  /// Background color in the hex format
  /// ```dart
  /// background.hex('f5f5f5')
  /// ```
  void hex(String xxxxxx) {
    _color = HexColor(xxxxxx);
  }
 
  /// Blurs the background
  ///
  /// Frosted glass example:
  /// ```dart
  /// ..background.blur(10)
  /// ..background.rgba(255,255,255,0.15)
  /// ```
  /// Does not work together with `rotate()`.
  void blur(double blur) {
    if (blur < 0) throw ('Blur cannot be negative: $blur');
    _blur = blur;
  }

  /// Eighter the [url] or the [path] has to be specified.
  /// [url] is for network images and [path] is for local images.
  /// [path] trumps [url].
  ///
  /// ```dart
  /// ..backgroundImage(
  ///   url: 'path/to/image'
  ///   fit: BoxFit.cover
  /// )
  /// ```
  void image(
      {String url,
      String path,
      ImageProvider<dynamic> imageProveder,
      ColorFilter colorFilter,
      BoxFit fit,
      AlignmentGeometry alignment = Alignment.center,
      ImageRepeat repeat = ImageRepeat.noRepeat}) {
    if ((url ?? path ?? imageProveder) == null) throw ('Eighter the [imageProvider], [url] or the [path] has to be provided');

    ImageProvider<dynamic> image;
    if (imageProveder != null)
      image = imageProveder;
    else if (path != null)
      image = AssetImage(path);
    else
      image = NetworkImage(url);

    _image = DecorationImage(
      image: image,
      colorFilter: colorFilter,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
    );
  }
}

class AlignmentModel {
  AlignmentGeometry _alignment;

  AlignmentGeometry get getAlignment => _alignment;

  void topLeft() => _alignment = Alignment.topLeft;
  void topCenter() => _alignment = Alignment.topCenter;
  void topRight() => _alignment = Alignment.topRight;

  void bottomLeft() => _alignment = Alignment.bottomLeft;
  void bottomCenter() => _alignment = Alignment.bottomCenter;
  void bottomRight() => _alignment = Alignment.bottomRight;

  void centerLeft() => _alignment = Alignment.centerLeft;
  void center() => _alignment = Alignment.center;
  void centerRight() => _alignment = Alignment.centerRight;

  void coordinate(double x, double y) =>
      _alignment = Alignment(x, y);
}

enum OverflowType { hidden, scroll, visible }

class OverflowModel {
  Axis _direction;
  OverflowType _overflow;

  Axis get getDirection => _direction;
  OverflowType get getOverflow => _overflow;

  void hidden() => _overflow = OverflowType.hidden;

  void scrollable([Axis direction = Axis.vertical]) {
    _overflow = OverflowType.scroll;
    _direction = direction;
  }

  void visible([Axis direction = Axis.vertical]) {
    _overflow = OverflowType.visible;
    _direction = direction;
  }
}

class StyleModel {
  AlignmentGeometry alignment;
  AlignmentGeometry alignmentChild;
  double width;
  double minWidth;
  double maxWidth;
  double height;
  double minHeight;
  double maxHeight;
  Color backgroundColor;
  double backgroundBlur;
  DecorationImage image;
  EdgeInsetsGeometry padding;
  EdgeInsetsGeometry margin;
  Gradient gradient;
  BoxBorder border;
  BorderRadiusGeometry borderRadius;
  List<BoxShadow> boxShadow;
  double scale;
  double rotate;
  Offset offset;
  Duration duration;
  Curve curve;
  RippleModel ripple;
  double opacity;
  OverflowType overflow;
  Axis overflowDirection;

  BoxDecoration _decoration;
  BoxConstraints _constraints;
  Matrix4 _transform;

  // GestureModel gesture;

  void inject(StyleModel intruder, bool override) {
    alignment = _replace(alignment, intruder?.alignment, override);
    alignmentChild =
        _replace(alignmentChild, intruder?.alignmentChild, override);
    width = _replace(width, intruder?.width, override);
    minWidth = _replace(minWidth, intruder?.minWidth, override);
    maxWidth = _replace(maxWidth, intruder?.maxWidth, override);
    height = _replace(height, intruder?.height, override);
    minHeight = _replace(minHeight, intruder?.minHeight, override);
    maxHeight = _replace(maxHeight, intruder?.maxHeight, override);
    backgroundColor =
        _replace(backgroundColor, intruder?.backgroundColor, override);
    backgroundBlur =
        _replace(backgroundBlur, intruder?.backgroundBlur, override);
    image = _replace(image, intruder?.image, override);
    padding = _replace(padding, intruder?.padding, override);
    margin = _replace(margin, intruder?.margin, override);
    gradient = _replace(gradient, intruder?.gradient, override);
    border = _replace(border, intruder?.border, override);
    borderRadius = _replace(borderRadius, intruder?.borderRadius, override);
    boxShadow = _replace(boxShadow, intruder?.boxShadow, override);
    scale = _replace(scale, intruder?.scale, override);
    rotate = _replace(rotate, intruder?.rotate, override);
    offset = _replace(offset, intruder?.offset, override);
    duration = _replace(duration, intruder?.duration, override);
    curve = _replace(curve, intruder?.curve, override);
    ripple = _replace(ripple, intruder?.ripple, override);
    opacity = _replace(opacity, intruder?.opacity, override);
    overflow = _replace(overflow, intruder?.overflow, override);
    overflowDirection =
        _replace(overflowDirection, intruder?.overflowDirection, override);
    // gesture = _replace(gesture, intruder?.gesture, override);
  }

  dynamic _replace(dynamic current, dynamic intruder, bool override) {
    if (override == true)
      return intruder ?? current;
    else
      return current ?? intruder;
  }

  BoxConstraints get constraints {
    if (_constraints != null) return _constraints;

    BoxConstraints boxConstraints;
    if ((minHeight ?? maxHeight ?? minWidth ?? maxWidth) != null) {
      boxConstraints = BoxConstraints(
        minWidth: minWidth ?? 0.0,
        maxWidth: maxWidth ?? double.infinity,
        minHeight: minHeight ?? 0.0,
        maxHeight: maxHeight ?? double.infinity,
      );
    }
    boxConstraints = (width != null || height != null)
        ? boxConstraints?.tighten(width: width, height: height) ??
            BoxConstraints.tightFor(width: width, height: height)
        : boxConstraints;

    return boxConstraints;
  }

  BoxDecoration get decoration {
    if (_decoration != null) return _decoration;

    if ((backgroundColor ??
            image ??
            gradient ??
            border ??
            borderRadius ??
            boxShadow) !=
        null) {
      BoxDecoration boxDecoration = BoxDecoration(
          color: backgroundColor,
          image: image,
          gradient: gradient,
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow);
      return boxDecoration;
    }
    return null;
  }

  Matrix4 get transform {
    if (_transform != null) return _transform;

    if ((scale ?? rotate ?? offset) != null) {
      return Matrix4.rotationZ(rotate ?? 0.0)
        ..scale(scale ?? 1.0)
        ..translate(
          offset?.dx ?? 0.0,
          offset?.dy ?? 0.0,
        );
    }
    return null;
  }

  set setBoxDecoration(BoxDecoration boxDecoration) =>
      _decoration = boxDecoration;
  set setBoxConstraints(BoxConstraints boxConstraints) =>
      _constraints = boxConstraints;
  set setTransform(Matrix4 transform) => _transform = transform;
}

class GestureModel {
  GestureModel(
    {
  //   @required this.onTapDown,
  //   @required this.onTapUp,
  //   @required this.onTap,
  //   @required this.onTapCancel,
  //   @required this.onSecondaryTapDown,
  //   @required this.onSecondaryTapUp,
  //   @required this.onSecondaryTapCancel,
  //   @required this.onDoubleTap,
  //   @required this.onLongPress,
  //   @required this.onLongPressStart,
  //   @required this.onLongPressMoveUpdate,
  //   @required this.onLongPressUp,
  //   @required this.onLongPressEnd,
  //   @required this.onVerticalDragDown,
  //   @required this.onVerticalDragStart,
  //   @required this.onVerticalDragUpdate,
  //   @required this.onVerticalDragEnd,
  //   @required this.onVerticalDragCancel,
  //   @required this.onHorizontalDragDown,
  //   @required this.onHorizontalDragStart,
  //   @required this.onHorizontalDragUpdate,
  //   @required this.onHorizontalDragEnd,
  //   @required this.onHorizontalDragCancel,
  //   @required this.onForcePressStart,
  //   @required this.onForcePressPeak,
  //   @required this.onForcePressUpdate,
  //   @required this.onForcePressEnd,
  //   @required this.onPanDown,
  //   @required this.onPanStart,
  //   @required this.onPanUpdate,
  //   @required this.onPanEnd,
  //   @required this.onPanCancel,
  //   @required this.onScaleStart,
  //   @required this.onScaleUpdate,
  //   @required this.onScaleEnd,
    @required this.behavior,
    @required this.excludeFromSemantics,
    @required this.dragStartBehavior,
  }
  );

  GestureTapDownCallback onTapDown;
  GestureTapUpCallback onTapUp;
  GestureTapCallback onTap;
  GestureTapCancelCallback onTapCancel;
  GestureTapDownCallback onSecondaryTapDown;
  GestureTapUpCallback onSecondaryTapUp;
  GestureTapCancelCallback onSecondaryTapCancel;
  GestureTapCallback onDoubleTap;
  GestureLongPressCallback onLongPress;
  GestureLongPressStartCallback onLongPressStart;
  GestureLongPressMoveUpdateCallback onLongPressMoveUpdate;
  GestureLongPressUpCallback onLongPressUp;
  GestureLongPressEndCallback onLongPressEnd;
  GestureDragDownCallback onVerticalDragDown;
  GestureDragStartCallback onVerticalDragStart;
  GestureDragUpdateCallback onVerticalDragUpdate;
  GestureDragEndCallback onVerticalDragEnd;
  GestureDragCancelCallback onVerticalDragCancel;
  GestureDragDownCallback onHorizontalDragDown;
  GestureDragStartCallback onHorizontalDragStart;
  GestureDragUpdateCallback onHorizontalDragUpdate;
  GestureDragEndCallback onHorizontalDragEnd;
  GestureDragCancelCallback onHorizontalDragCancel;
  GestureDragDownCallback onPanDown;
  GestureDragStartCallback onPanStart;
  GestureDragUpdateCallback onPanUpdate;
  GestureDragEndCallback onPanEnd;
  GestureDragCancelCallback onPanCancel;
  GestureScaleStartCallback onScaleStart;
  GestureScaleUpdateCallback onScaleUpdate;
  GestureScaleEndCallback onScaleEnd;
  GestureForcePressStartCallback onForcePressStart;
  GestureForcePressPeakCallback onForcePressPeak;
  GestureForcePressUpdateCallback onForcePressUpdate;
  GestureForcePressEndCallback onForcePressEnd;
  final HitTestBehavior behavior;
  final bool excludeFromSemantics;
  final DragStartBehavior dragStartBehavior;

  // void inject(GestureModel intruder, bool override) {
  //   onTapDown = _replace(onTapDown, intruder?.onTapDown, override);
  // onTapUp;
  // onTap;
  // onTapCancel;
  // onSecondaryTapDown;
  // onSecondaryTapUp;
  // onSecondaryTapCancel;
  // onDoubleTap;
  // onLongPress;
  // onLongPressStart;
  // onLongPressMoveUpdate;
  // onLongPressUp;
  // onLongPressEnd;
  // onVerticalDragDown;
  // final GestureDragStartCallback onVerticalDragStart;
  // final GestureDragUpdateCallback onVerticalDragUpdate;
  // final GestureDragEndCallback onVerticalDragEnd;
  // final GestureDragCancelCallback onVerticalDragCancel;
  // final GestureDragDownCallback onHorizontalDragDown;
  // final GestureDragStartCallback onHorizontalDragStart;
  // final GestureDragUpdateCallback onHorizontalDragUpdate;
  // final GestureDragEndCallback onHorizontalDragEnd;
  // final GestureDragCancelCallback onHorizontalDragCancel;
  // final GestureDragDownCallback onPanDown;
  // final GestureDragStartCallback onPanStart;
  // final GestureDragUpdateCallback onPanUpdate;
  // final GestureDragEndCallback onPanEnd;
  // final GestureDragCancelCallback onPanCancel;
  // final GestureScaleStartCallback onScaleStart;
  // final GestureScaleUpdateCallback onScaleUpdate;
  // final GestureScaleEndCallback onScaleEnd;
  // final GestureForcePressStartCallback onForcePressStart;
  // final GestureForcePressPeakCallback onForcePressPeak;
  // final GestureForcePressUpdateCallback onForcePressUpdate;
  // final GestureForcePressEndCallback onForcePressEnd;
  // final HitTestBehavior behavior;
  // final bool excludeFromSemantics;
  // final DragStartBehavior dragStartBehavior;
  // }

  // dynamic _replace(dynamic current, dynamic intruder, bool override) {
  //   if (override == true)
  //     return intruder ?? current;
  //   else
  //     return current ?? intruder;
  // }
}

class TextModel {
  FontWeight fontWeight;
  TextAlign textAlign;
  FontStyle fontStyle;
  String fontFamily;
  List<String> fontFamilyFallback;
  double fontSize;
  Color textColor;
  int maxLines;
  double letterSpacing;
  double wordSpacing;

  bool editable;
  TextInputType keyboardType;
  // String _placeholder;
  void Function(String) onChange;
  void Function(bool focus) onFocusChange;
  void Function(TextSelection, SelectionChangedCause)
      onSelectionChanged; // TODO: not working (only tested on android emulator)
  FocusNode focusNode;

  void inject(TextModel textModel, bool override) {
    fontWeight = _replace(fontWeight, textModel?.fontWeight, override);
    textAlign = _replace(textAlign, textModel?.textAlign, override);
    fontStyle = _replace(fontStyle, textModel?.fontStyle, override);
    fontFamily = _replace(fontFamily, textModel?.fontFamily, override);
    fontFamilyFallback = _replace(fontFamilyFallback, textModel?.fontFamilyFallback, override);
    fontSize = _replace(fontSize, textModel?.fontSize, override);
    textColor = _replace(textColor, textModel?.textColor, override);
    maxLines = _replace(maxLines, textModel?.maxLines, override);
    letterSpacing = _replace(letterSpacing, textModel?.letterSpacing, override);
    wordSpacing = _replace(wordSpacing, textModel?.wordSpacing, override);

    editable = _replace(editable, textModel?.editable, override);
    keyboardType = _replace(keyboardType, textModel?.keyboardType, override);
    onChange = _replace(onChange, textModel?.onChange, override);
    onFocusChange = _replace(onFocusChange, textModel?.onFocusChange, override);
    onSelectionChanged = _replace(onSelectionChanged, textModel?.onSelectionChanged, override);
    focusNode = _replace(focusNode, textModel?.focusNode, override);
  }

  dynamic _replace(dynamic current, dynamic intruder, bool override) {
    if (override == true)
      return intruder ?? current;
    else
      return current ?? intruder;
  }

  TextStyle get textStyle {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: textColor ?? Colors.black,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

