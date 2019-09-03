import 'package:flutter/material.dart';
import 'dart:math';

import '../model/ripple.dart';
import '../model/overflow.dart';
import '../model/alignment.dart';
import '../model/background.dart';

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
  StyleClass({this.useRadians = false});

  /// Choose to calculate angles with radians or not.
  ///
  /// **if true**
  /// ```dart
  /// 0° -> 0.0
  /// 360° -> 1.0
  /// ```
  /// **if false**
  /// ```dart
  /// 0° -> 0.0
  /// 360° -> 2 * pi
  /// ```
  final bool useRadians;

  EdgeInsetsGeometry $padding;
  EdgeInsetsGeometry $margin;

  Gradient $gradient;
  BoxBorder $border;
  BorderRadiusGeometry $borderRadius;
  List<BoxShadow> $boxShadow;

  double $width;
  double $minWidth;
  double $maxWidth;
  double $height;
  double $minHeight;
  double $maxHeight;

  double $scale;
  double $rotate;
  Offset $offset;

  double $opacity;
  RippleModel $ripple;

  Duration $duration;
  Curve $curve;

  BoxDecoration get $boxDecoration {
    if ((background?.$color ??
            background?.$image ??
            $gradient ??
            $border ??
            $borderRadius ??
            $boxShadow) !=
        null) {
      return BoxDecoration(
        color: background?.$color,
        image: background?.$image,
        gradient: $gradient,
        border: $border,
        borderRadius: $borderRadius,
        boxShadow: $boxShadow,
      );
    }
    return null;
  }

  BoxConstraints get $boxConstraints {
    if (($minHeight ?? $maxHeight ?? $minWidth ?? $maxWidth) != null) {
      return BoxConstraints(
        minHeight: $minHeight ?? 0.0,
        maxHeight: $maxHeight ?? double.infinity,
        minWidth: $minWidth ?? 0.0,
        maxWidth: $maxWidth ?? double.infinity,
      );
    }
    return null;
  }

  Matrix4 get $transform {
    if (($scale ?? $rotate ?? $offset) != null) {
      return Matrix4.rotationZ($rotate ?? 0.0)
        ..scale($scale ?? 1.0)
        ..translate(
          $offset?.dx ?? 0.0,
          $offset?.dy ?? 0.0,
        );
    }
    return null;
  }

  /// Alignment relative to its surroundings
  AlignmentModel alignment = AlignmentModel();

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

    $padding = EdgeInsets.only(
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

    $margin = EdgeInsets.only(
      top: top ?? 0.0,
      bottom: bottom ?? 0.0,
      left: left ?? 0.0,
      right: right ?? 0.0,
    );
  }

  /// Widget background styling
  BackgroundModel background = BackgroundModel();

  /// Creates a linear gradient.
  ///
  /// The [colors] argument must not be null. If [stops] is non-null, it must have the same length as [colors].
  void linearGradient(
      {AlignmentGeometry begin = Alignment.centerLeft,
      AlignmentGeometry end = Alignment.centerRight,
      @required List<Color> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops}) {
    $gradient = LinearGradient(
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
    $gradient = RadialGradient(
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
    if (useRadians == false) startAngle = startAngle * pi * 2;

    if (endAngle == null) {
      //default value
      endAngle = pi * 2;
    } else if (useRadians == false) {
      //converts value to radians
      endAngle = endAngle * pi * 2;
    }

    $gradient = SweepGradient(
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

    $border = Border(
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

    $borderRadius = BorderRadius.only(
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

    $boxShadow = [
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
      $boxShadow = null;
    }

    double offsetX = 0.0;
    double offsetY = 0.0;

    if (angle != null) {
      if (useRadians == false) angle = 2 * pi * angle;

      offsetX = sin(angle) * elevation;
      offsetY = cos(angle) * elevation;
    }

    final double spread = 0.0;
    final double blur = elevation;

    //custom curve defining the opacity
    double finalOpacity = (0.5 - (sqrt(elevation) / 19)) * opacity;
    if (finalOpacity < 0.0) finalOpacity = 0.0;

    Color colorWithOpacity = color.withOpacity(finalOpacity);

    $boxShadow = [
      BoxShadow(
          color: colorWithOpacity,
          blurRadius: blur,
          spreadRadius: spread,
          offset: Offset(offsetX, offsetY))
    ];
  }

  void width(double width) => $width = width;

  void minWidth(double minWidth) => $minWidth = minWidth;

  void maxWidth(double maxWidth) => $maxWidth = maxWidth;

  void height(double height) => $height = height;

  void minHeight(double minHeight) => $minHeight = minHeight;

  void maxHeight(double maxHeight) => $maxHeight = maxHeight;

  /// Must not be negative.
  /// 1 corresponds to normal size. 2 corresponds to double the size.
  /// ```dart
  /// ..scale(0.7);
  /// ```
  void scale(double ratio) {
    if (ratio < 0) throw ('The widget scale cannot be negative: $ratio');
    $scale = ratio;
  }

  /// Offsetts the widget.
  /// ```dart
  /// ..offset(10.0, 5.0);
  /// ```
  void offset(double dx, double dy) => $offset = Offset(dx, dy);

  /// Widget rotation
  /// ```dart
  /// StyleClass(userRadians = false)..rotate(0.75);
  ///
  /// StyleClass(useRadians = true)..rotate(0.75 * pi * 2)
  /// ```
  /// Choose to calculate angles with radians or not through [useRadians] `StyleClass` parameter. 0.0 - 1.0 or 0.0 - 2 * pi
  void rotate(double angle) {
    if (useRadians == true) {
      $rotate = angle;
    } else {
      $rotate = angle * pi * 2;
    }
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
      throw ('Invalid opacity value: $opacity');

    $opacity = opacity;
  }

  /// Material ripple effect
  /// ```dart
  /// ..ripple(true);
  /// ```
  void ripple(bool enable, {Color splashColor, Color highlightColor}) {
    $ripple = RippleModel(
      enable: enable,
      splashColor: splashColor,
      highlightColor: highlightColor,
    );
  }

  /// Change child overflow behaviour.
  ///
  ///```dart
  ///..overflow.visible(Axis.vertical) // overflows outside its parent
  ///..overflow.hidden() // CLips to parent shape
  ///..overflow.scrollable(Axis.vertical) // scrollable if bigger than parent
  ///```
  OverflowModel overflow = OverflowModel();

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

    $duration = Duration(milliseconds: duration);
    $curve = curve;
  }

  /// Adds a `StyleClass` to a `StyleClass`.
  /// ```dart
  /// ..add(StyleClass()..width(100));
  /// ```
  void add(StyleClass styleClass, {bool override = false}) {
    // if override is true, all style from the added class will override current style
    if (override == true) {
      alignment = styleClass?.alignment ?? alignment;
      // alignmentChild = styleClass?.alignmentChild ?? alignmentChild;
      $padding = styleClass?.$padding ?? $padding;
      $margin = styleClass?.$margin ?? $margin;
      background?.$color = styleClass?.background?.$color ?? background?.$color;
      background?.$image = styleClass?.background?.$image ?? background?.$image;
      background?.$blur = styleClass?.background?.$blur ?? background?.$blur;
      $gradient = styleClass?.$gradient ?? $gradient;
      $border = styleClass?.$border ?? $border;
      $borderRadius = styleClass?.$borderRadius ?? $borderRadius;
      $boxShadow = styleClass?.$boxShadow ?? $boxShadow;
      $width = styleClass?.$width ?? $width;
      $minWidth = styleClass?.$minWidth ?? $minWidth;
      $maxWidth = styleClass?.$maxWidth ?? $maxWidth;
      $height = styleClass?.$height ?? $height;
      $minHeight = styleClass?.$minHeight ?? $minHeight;
      $maxHeight = styleClass?.$maxHeight ?? $minHeight;
      $scale = styleClass?.$scale ?? $scale;
      $rotate = styleClass?.$rotate ?? $rotate;
      $offset = styleClass?.$offset ?? $offset;
      $duration = styleClass?.$duration ?? $duration;
      $curve = styleClass?.$curve ?? $curve;
      $ripple = styleClass?.$ripple ?? $ripple;
      $opacity = styleClass?.$opacity ?? $opacity;
      overflow = styleClass?.overflow ?? overflow;
    } else {
      alignment = alignment ?? styleClass?.alignment;
      // alignmentChild = alignmentChild ?? styleClass?.alignmentChild;
      $padding = $padding ?? styleClass?.$padding;
      $margin = $margin ?? styleClass?.$margin;
      background?.$color = background?.$color ?? styleClass?.background?.$color;
      background?.$image = styleClass?.background?.$image ?? background?.$image;
      background?.$blur = styleClass?.background?.$blur ?? background?.$blur;
      $gradient = $gradient ?? styleClass?.$gradient;
      $border = $border ?? styleClass?.$border;
      $borderRadius = $borderRadius ?? styleClass?.$borderRadius;
      $boxShadow = $boxShadow ?? styleClass?.$boxShadow;
      $width = $width ?? styleClass?.$width;
      $minWidth = $minWidth ?? styleClass?.$minWidth;
      $maxWidth = $maxWidth ?? styleClass?.$maxWidth;
      $height = $height ?? styleClass?.$height;
      $minHeight = $minHeight ?? styleClass?.$minHeight;
      $maxHeight = $maxHeight ?? styleClass?.$maxHeight;
      $scale = $scale ?? styleClass?.$scale;
      $rotate = $rotate ?? styleClass?.$rotate;
      $offset = $offset ?? styleClass?.$offset;
      $duration = $duration ?? styleClass?.$duration;
      $curve = $curve ?? styleClass?.$curve;
      $ripple = $ripple ?? styleClass?.$ripple;
      $opacity = $opacity ?? styleClass?.$opacity;
      overflow = overflow ?? styleClass?.overflow;
    }
  }

  StyleClass get export => this;
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
  S({this.useRadians = false}) : super(useRadians: useRadians);

  /// Choose to calculate angles with radians or not.
  ///
  /// **if true**
  /// ```dart
  /// 0° -> 0.0
  /// 360° -> 1.0
  /// ```
  /// **if false**
  /// ```dart
  /// 0° -> 0.0
  /// 360° -> 2 * pi
  /// ```
  final bool useRadians;
}
