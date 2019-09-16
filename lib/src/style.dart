import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'model.dart';

enum AngleFormat { degree, radians, cycles }

class StyleClass {
  /// Styling for the `Division` widget
  ///
  /// Choose to calculate angles with radians or not through [useRadians] parameter. 0.0 - 1.0 or 0.0 - 2 * pi
  /// Applies to the style properties which by default in flutter uses radians, like ..rotate() and ..sweepGradient()
  ///
  /// ```dart
  /// Division(
  ///   style: StyleClass(useRadians = false)
  ///     ..width(100)
  ///     ..height(150)
  ///     ..borderRadius(all: 30.0)
  ///     ..backgroundColor(hex('#eeeeee')),
  ///   gesture: GestureClass()
  ///     ..onTap(() => print('Widget pressed!'))
  ///     ..onLongPress(() => print('Widget pressed long!)),
  ///   child: Text('Some text),
  /// )
  /// ```
  StyleClass({this.angleFormat = AngleFormat.cycles}) {
    _addListeners();
  }

  @mustCallSuper
  _addListeners() {
    alignment = AlignmentModel()
      ..addListener(() {
        _styleModel?.alignment = alignment?.getAlignment;
      });

    alignmentContent = AlignmentModel()
      ..addListener(() {
        _styleModel?.alignmentContent = alignmentContent?.getAlignment;
      });

    background = BackgroundModel()
      ..addListener(() {
        _styleModel?.backgroundColor = background?.exportBackgroundColor;
        _styleModel?.backgroundBlur = background?.exportBackgroundBlur;
        _styleModel?.backgroundImage = background?.exportBackgroundImage;
      });

    overflow = OverflowModel()
      ..addListener(() {
        _styleModel?.overflow = overflow?.getOverflow;
        _styleModel?.overflowDirection = overflow?.getDirection;
      });
  }

  final AngleFormat angleFormat;

  StyleModel _styleModel = StyleModel();

  /// Alignment relative to its surroundings
  AlignmentModel alignment;

  /// Alignment of the child
  AlignmentModel alignmentContent;

  /// Widget background styling
  BackgroundModel background;

  /// Change child overflow behaviour.
  ///
  ///```dart
  ///..overflow.visible(Axis.vertical) // overflows outside its parent
  ///..overflow.hidden() // CLips to parent shape
  ///..overflow.scrollable(Axis.vertical) // scrollable if bigger than parent
  ///```
  OverflowModel overflow;

  /// Empty space to inscribe inside the [decoration]. The [child], if any, is placed inside this padding.
  ///
  /// All properties work together
  /// ```dart
  /// ..padding(all: 10, bottom: 20) // gives a different padding at the bottom
  /// ```
  void padding(
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
  }

  /// Empty space to surround the [decoration] and [child].
  ///
  /// All properties work together
  /// ```dart
  /// ..margin(all: 10, bottom: 20) // gives a different margin at the bottom
  /// ```
  void margin(
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
  }

  /// Creates a linear gradient.
  ///
  /// The [colors] argument must not be null. If [stops] is non-null, it must have the same length as [colors].
  void linearGradient(
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
  }

  /// Creates a radial gradient.
  ///
  /// The [colors] argument must not be null. If [stops] is non-null, it must have the same length as [colors].
  void radialGradient(
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
  }

  /// Creates a sweep gradient.
  ///
  /// The [colors] argument must not be null. If [stops] is non-null, it must have the same length as [colors].
  ///
  /// Choose to calculate angles with radians or not through [useRadians] parameter.
  /// [end] default to 1.0 if [useRadians] is false and 2 * pi if [useRadians] is true,
  void sweepGradient(
      {AlignmentGeometry center = Alignment.center,
      double startAngle = 0.0,
      double endAngle,
      @required List<Color> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops}) {
    startAngle = _angleToRadians(startAngle, angleFormat);

    if (endAngle == null)
      endAngle = pi * 2;
    else
      endAngle = _angleToRadians(endAngle, angleFormat);

    _styleModel?.gradient = SweepGradient(
      center: center,
      startAngle: startAngle,
      endAngle: endAngle,
      colors: colors,
      stops: stops,
      tileMode: tileMode,
    );
  }

  /// Border for the widget
  /// ```dart
  /// ..border(all: 3.0, color: hex('#55ffff'), style: BorderStyle.solid)
  /// ```
  /// Choose between `all`, `left`, `right`, `top` and `bottom`. `all` works together with the other properties.
  void border(
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
  }

  /// It is valid to use `all` together with single sided properties. Single sided properties will trump over the `all` property.
  void borderRadius(
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
  }

  /// If defined while the elevation method is defined, the last one defined will be the one applied.
  void boxShadow(
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
  }

  /// Elevates the widget with a boxShadow.
  ///
  /// [angle] parameter takes a circular value.
  /// Eighter radians or not, depending on what is specified in the `StyleClass` constructor. 0.0 is down.
  /// If [angle] equals [null] the shadow will be directly under the widget.
  /// [opacity] is a relative opacity constant. A value of 0.5 bisects the opacity value with a given elevation.
  /// ```dart
  /// ..elevation(30.0, color: '#f5f5f5', angle: 0.0)
  /// ```
  ///
  /// If the elevation property is used at the same time as the boxShadow property, the last one
  /// defined will be the one applied.
  void elevation(double elevation,
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
      angle = _angleToRadians(angle, angleFormat);

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
  }

  void width(double width) => _styleModel?.width = width;

  void minWidth(double minWidth) => _styleModel?.minWidth = minWidth;

  void maxWidth(double maxWidth) => _styleModel?.maxWidth = maxWidth;

  void height(double height) => _styleModel?.height = height;

  void minHeight(double minHeight) => _styleModel?.minHeight = minHeight;

  void maxHeight(double maxHeight) => _styleModel?.maxHeight = maxHeight;

  /// Must not be negative.
  /// 1 corresponds to normal size. 2 corresponds to double the size.
  /// ```dart
  /// ..scale(0.7);
  /// ```
  void scale(double ratio) {
    if (ratio < 0)
      throw ('The widget scale cannot be negative: _styleModel?.ratio');
    _styleModel?.scale = ratio;
  }

  /// Offsetts the widget.
  /// ```dart
  /// ..offset(10.0, 5.0);
  /// ```
  void offset(double dx, double dy) => _styleModel?.offset = Offset(dx, dy);

  /// Widget rotation
  /// ```dart
  /// StyleClass(userRadians = false)..rotate(0.75);
  ///
  /// StyleClass(useRadians = true)..rotate(0.75 * pi * 2)
  /// ```
  /// Choose to calculate angles with radians or not through [useRadians] `StyleClass` parameter. 0.0 - 1.0 or 0.0 - 2 * pi
  void rotate(double angle) {
    _styleModel?.rotate = _angleToRadians(angle, angleFormat);
  }

  /// Opacity applied to the whole widget
  ///
  /// Can not be higher than 1.0 or lower than 0.0
  ///
  /// ```dart
  /// ..opacity(0.7);
  /// ```
  void opacity(double opacity) {
    if (opacity < 0.0 || opacity > 1.0)
      throw ('Invalid opacity value: _styleModel?.opacity');

    _styleModel?.opacity = opacity;
  }

  /// Material ripple effect
  /// ```dart
  /// ..ripple(true);
  /// ```
  void ripple(bool enable, {Color splashColor, Color highlightColor}) {
    _styleModel?.ripple = RippleModel(
      enable: enable,
      splashColor: splashColor,
      highlightColor: highlightColor,
    );
  }

  /// `Duration` is given in milliseconds.
  ///
  /// ```dart
  /// ..animate(400, Curves.easeInOut);
  /// ```
  ///
  /// **Adding a delay to your animation**
  /// ```
  /// .onTapDown((details) {
  ///   // change styling without a delay
  ///   thisStyle..backgroundColor(rgb(255,255,0));
  ///
  ///   // Trigger the setState with a delay
  ///   Future.delayed(Duration(milliseconds: 500)).then((value) => setState(() {}));
  /// })
  /// ```
  void animate([int duration = 500, Curve curve = Curves.linear]) {
    if (duration < 0) throw ('Duration cannot be negative');

    _styleModel?.duration = Duration(milliseconds: duration);
    _styleModel?.curve = curve;
  }

  // export raw styledata
  StyleModel get exportStyle => _styleModel;

  double _angleToRadians(double value, AngleFormat angleFormat) {
    if (angleFormat == AngleFormat.radians)
      return value;
    else if (angleFormat == AngleFormat.cycles)
      return value * 2 * pi;
    else if (angleFormat == AngleFormat.degree) return (value / 360) * 2 * pi;

    return null;
  }
}

class S extends StyleClass {
  /// Styling for the `Division` widget
  ///
  /// Choose to calculate angles with radians or not through [useRadians] parameter. 0.0 - 1.0 or 0.0 - 2 * pi
  /// Applies to the style properties which by default in flutter uses radians, like ..rotate() and ..sweepGradient()
  ///
  /// ```dart
  /// Division(
  ///   style: S(useRadians = false)
  ///     ..width(100)
  ///     ..height(150)
  ///     ..borderRadius(all: 30.0)
  ///     ..backgroundColor(hex('#eeeeee')),
  ///   gesture: G()
  ///     ..onTap(() => print('Widget pressed!'))
  ///     ..onLongPress(() => print('Widget pressed long!)),
  ///   child: Text('Some text),
  /// )
  /// ```
  S({this.angleFormat = AngleFormat.cycles}) : super(angleFormat: angleFormat);

  final AngleFormat angleFormat;
}

class ParentStyle extends StyleClass {
  ParentStyle({this.angleFormat = AngleFormat.cycles})
      : super(angleFormat: angleFormat);

  final AngleFormat angleFormat;

  /// Combines style from another StyleClass
  /// ```dart
  /// ..add(ParentStyle()..width(100));
  /// ```
  void add(ParentStyle parentStyle, {bool override = false}) {
    if (parentStyle != null) {
      _styleModel?.inject(parentStyle?._styleModel, override);
    }
  }

  /// Clone object
  /// ```dart
  /// Parent(
  ///   'some text',
  ///   style: myStyle.clone()
  ///     ..width(100)
  ///     // etc..
  /// )
  /// ```
  ParentStyle clone() => ParentStyle(angleFormat: angleFormat)..add(this);
}

class GestureClass {
  /// Responsible for all the gestures for the `Division` widget
  ///
  /// ```dart
  /// Division(
  ///   style: StyleClass()
  ///     ..width(100)
  ///     ..height(150)
  ///     ..borderRadius(all: 30.0)
  ///     ..backgroundColor(hex('#eeeeee')),
  ///   gesture: GestureClass()
  ///     ..onTap(() => print('Widget pressed!'))
  ///     ..onLongPress(() => print('Widget longpress)),
  ///   child: Text('Some text),
  /// )
  /// ```
  GestureClass(
      {this.behavior,
      this.excludeFromSemantics = false,
      this.dragStartBehavior = DragStartBehavior.start})
      : this.gestureModel = GestureModel(
            behavior: behavior,
            excludeFromSemantics: excludeFromSemantics,
            dragStartBehavior: dragStartBehavior);

  /// How this gesture detector should behave during hit testing.
  ///
  /// This defaults to [HitTestBehavior.deferToChild] if [child] is not null and
  /// [HitTestBehavior.translucent] if child is null.
  final HitTestBehavior behavior;

  /// Whether to exclude these gestures from the semantics tree. For
  /// example, the long-press gesture for showing a tooltip is
  /// excluded because the tooltip itself is included in the semantics
  /// tree directly and so having a gesture to show it would result in
  /// duplication of information.
  final bool excludeFromSemantics;

  /// Determines the way that drag start behavior is handled.
  ///
  /// If set to [DragStartBehavior.start], gesture drag behavior will
  /// begin upon the detection of a drag gesture. If set to
  /// [DragStartBehavior.down] it will begin when a down event is first detected.
  ///
  /// In general, setting this to [DragStartBehavior.start] will make drag
  /// animation smoother and setting it to [DragStartBehavior.down] will make
  /// drag behavior feel slightly more reactive.
  ///
  /// By default, the drag start behavior is [DragStartBehavior.start].
  ///
  /// Only the [onStart] callbacks for the [VerticalDragGestureRecognizer],
  /// [HorizontalDragGestureRecognizer] and [PanGestureRecognizer] are affected
  /// by this setting.
  ///
  /// See also:
  ///
  ///  * [DragGestureRecognizer.dragStartBehavior], which gives an example for the different behaviors.
  final DragStartBehavior dragStartBehavior;

  final GestureModel gestureModel;

  void onTap(void Function() function) => gestureModel?.onTap = function;

  void onTapUp(void Function(TapUpDetails) function) =>
      gestureModel?.onTapUp = function;

  void onTapDown(void Function(TapDownDetails) function) =>
      gestureModel?.onTapDown = function;

  void onTapCancel(void Function() function) =>
      gestureModel?.onTapCancel = function;

  void onDoubleTap(void Function() function) =>
      gestureModel?.onDoubleTap = function;

  void onLongPress(void Function() function) =>
      gestureModel?.onLongPress = function;

  void onLongPressStart(void Function(LongPressStartDetails) function) =>
      gestureModel?.onLongPressStart = function;

  void onLongPressEnd(void Function(LongPressEndDetails) function) =>
      gestureModel?.onLongPressEnd = function;

  void onLongPressMoveUpdate(
          void Function(LongPressMoveUpdateDetails) function) =>
      gestureModel?.onLongPressMoveUpdate = function;

  void onLongPressUp(void Function() function) =>
      gestureModel?.onLongPressUp = function;

  void onVerticalDragStart(void Function(DragStartDetails) function) =>
      gestureModel?.onVerticalDragStart = function;

  void onVerticalDragEnd(void Function(DragEndDetails) function) =>
      gestureModel?.onVerticalDragEnd = function;

  void onVerticalDragDown(void Function(DragDownDetails) function) =>
      gestureModel?.onVerticalDragDown = function;

  void onVerticalDragCancel(void Function() function) =>
      gestureModel?.onVerticalDragCancel = function;

  void onVerticalDragUpdate(void Function(DragUpdateDetails) function) =>
      gestureModel?.onVerticalDragUpdate = function;

  void onHorizontalDragStart(void Function(DragStartDetails) function) =>
      gestureModel?.onHorizontalDragStart = function;

  void onHorizontalDragEnd(void Function(DragEndDetails) function) =>
      gestureModel?.onHorizontalDragEnd = function;

  void onHorizontalDragDown(void Function(DragDownDetails) function) =>
      gestureModel?.onHorizontalDragDown = function;

  void onHorizontalDragCancel(void Function() function) =>
      gestureModel?.onHorizontalDragCancel = function;

  void onHorizontalDragUpdate(void Function(DragUpdateDetails) function) =>
      gestureModel?.onHorizontalDragUpdate = function;

  void onForcePressStart(void Function(ForcePressDetails) function) =>
      gestureModel?.onForcePressStart = function;

  void onForcePressEnd(void Function(ForcePressDetails) function) =>
      gestureModel?.onForcePressEnd = function;

  void onForcePressPeak(void Function(ForcePressDetails) function) =>
      gestureModel?.onForcePressPeak = function;

  void onForcePressUpdate(void Function(ForcePressDetails) function) =>
      gestureModel?.onForcePressUpdate = function;

  void onPanStart(void Function(DragStartDetails) function) =>
      gestureModel?.onPanStart = function;

  void onPanEnd(void Function(DragEndDetails) function) =>
      gestureModel?.onPanEnd = function;

  void onPanCancel(void Function() function) =>
      gestureModel?.onPanCancel = function;

  void onPanDown(void Function(DragDownDetails) function) =>
      gestureModel?.onPanDown = function;

  void onPanUpdate(void Function(DragUpdateDetails) function) =>
      gestureModel?.onPanUpdate = function;

  void onScaleStart(void Function(ScaleStartDetails) function) =>
      gestureModel?.onScaleStart = function;

  void onScaleEnd(void Function(ScaleEndDetails) function) =>
      gestureModel?.onScaleEnd = function;

  void onScaleUpdate(void Function(ScaleUpdateDetails) function) =>
      gestureModel?.onScaleUpdate = function;

  GestureModel get exportGesture => gestureModel;
}

class G extends GestureClass {
  /// Responsible for all the gestures for the `Division` widget
  ///
  /// ```dart
  /// Division(
  ///   style: S()
  ///     ..width(100)
  ///     ..height(150)
  ///     ..borderRadius(all: 30.0)
  ///     ..backgroundColor(hex('#eeeeee')),
  ///   gesture: G()
  ///     ..onTap(() => print('Widget pressed!'))
  ///     ..onLongPress(() => print('Widget longpress)),
  ///   child: Text('Some text),
  /// )
  /// ```
  G(
      {this.behavior,
      this.excludeFromSemantics = false,
      this.dragStartBehavior = DragStartBehavior.start})
      : super(
            behavior: behavior,
            excludeFromSemantics: excludeFromSemantics,
            dragStartBehavior: dragStartBehavior);

  /// How this gesture detector should behave during hit testing.
  ///
  /// This defaults to [HitTestBehavior.deferToChild] if [child] is not null and
  /// [HitTestBehavior.translucent] if child is null.
  final HitTestBehavior behavior;

  /// Whether to exclude these gestures from the semantics tree. For
  /// example, the long-press gesture for showing a tooltip is
  /// excluded because the tooltip itself is included in the semantics
  /// tree directly and so having a gesture to show it would result in
  /// duplication of information.
  final bool excludeFromSemantics;

  /// Determines the way that drag start behavior is handled.
  ///
  /// If set to [DragStartBehavior.start], gesture drag behavior will
  /// begin upon the detection of a drag gesture. If set to
  /// [DragStartBehavior.down] it will begin when a down event is first detected.
  ///
  /// In general, setting this to [DragStartBehavior.start] will make drag
  /// animation smoother and setting it to [DragStartBehavior.down] will make
  /// drag behavior feel slightly more reactive.
  ///
  /// By default, the drag start behavior is [DragStartBehavior.start].
  ///
  /// Only the [onStart] callbacks for the [VerticalDragGestureRecognizer],
  /// [HorizontalDragGestureRecognizer] and [PanGestureRecognizer] are affected
  /// by this setting.
  ///
  /// See also:
  ///
  ///  * [DragGestureRecognizer.dragStartBehavior], which gives an example for the different behaviors.
  final DragStartBehavior dragStartBehavior;
}

class TxtStyle extends StyleClass {
  TxtStyle({AngleFormat angleFormat = AngleFormat.cycles})
      : super(angleFormat: angleFormat);

  @override
  void _addListeners() {
    super._addListeners();
    textAlign = TextAlignModel()
      ..addListener(() {
        _textModel?.textAlign = textAlign?.exportTextAlign;
      });
  }

  final TextModel _textModel = TextModel();

  TextAlignModel textAlign;

  void bold([bool enable = true]) {
    if (enable == true) _textModel?.fontWeight = FontWeight.bold;
  }

  void italic([bool enable = true]) {
    if (enable == true) _textModel?.fontStyle = FontStyle.italic;
  }

  void fontWeight(FontWeight weight) => _textModel?.fontWeight = weight;

  void fontSize(double fontSize) => _textModel?.fontSize = fontSize;

  void fontFamily(String font, {List<String> fontFamilyFallback}) {
    _textModel?.fontFamily = font;
    _textModel?.fontFamilyFallback = fontFamilyFallback;
  }

  void textColor(Color textColor) => _textModel?.textColor = textColor;

  // void textAlign(TextAlign textAlign) => _textModel?.textAlign = textAlign;

  void maxLines(int maxLines) => _textModel?.maxLines = maxLines;

  void letterSpacing(double space) => _textModel?.letterSpacing = space;

  void wordSpacing(double space) => _textModel?.wordSpacing = space;

  void textDecoration(TextDecoration decoration) => _textModel?.textDecoration = decoration;

  /// Make the widget editable just like a TextField.
  ///
  /// If `focusNode` isnt spesified an internal `focusNode` will be created.
  void editable(bool enable,
      {TextInputType keyboardType,
      String placeholder,
      bool obscureText = false,
      void Function(String) onChange,
      void Function(bool focus) onFocusChange,
      void Function(TextSelection, SelectionChangedCause) onSelectionChanged,
      void Function() onEditingComplete,
      FocusNode focusNode}) {
    _textModel
      ..editable = enable
      ..keyboardType = keyboardType
      ..placeholder = placeholder
      ..obscureText = obscureText
      ..onChange = onChange
      ..onFocusChange = onFocusChange
      ..onSelectionChanged = onSelectionChanged
      ..onEditingComplete = onEditingComplete
      ..focusNode = focusNode;
  }

  /// Combines style from another StyleClass
  /// ```dart
  /// ..add(TxtStyle()..width(100));
  /// ```
  void add(TxtStyle txtStyle, {bool override = false}) {
    if (txtStyle != null) {
      _styleModel?.inject(txtStyle?._styleModel, override);
      _textModel?.inject(txtStyle?._textModel, override);
    }
  }

  /// Clone object
  /// ```dart
  /// Txt(
  ///   'some text',
  ///   style: myStyle.clone()
  ///     ..width(100)
  ///     // etc..
  /// )
  /// ```
  TxtStyle clone() => TxtStyle(angleFormat: angleFormat)..add(this);

  TextModel get exportTextStyle => _textModel;
}
