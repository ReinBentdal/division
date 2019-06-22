import 'package:flutter/material.dart';
import 'dart:math';

import '../format/format_alignment.dart';
import '../format/format_color.dart';
import '../format/format_overflow.dart';
import '../model/ripple.dart';
import '../model/overflow.dart';

/// Responsibe for all the styling for the `Division` widget
///
/// Choose to calculate angles with radians or not through [useRadians] parameter. 0.0 - 1.0 or 0.0 - 2 * pi
/// Applies to the style properties which by default in flutter uses radians, like .rotate() and .sweepGradient()
///
/// ```dart
/// Division(
///   style: StyleClass(useRadians = false)
///     .width(100)
///     .height(150)
///     .borderRadius(all: 30.0)
///     .backgroundColor('#eeeeee'),
///   gesture: GestureClass()
///     .onTap(() => print('Widget pressed!'))
///     .onLongPress(() => print('Widget pressed long!)),
///   child: Text('Some text),
/// )
/// ```
class StyleClass {
  /// Choose to calculate angles with radians or not. 0.0 - 1.0 or 0.0 - 2 * pi
  final bool useRadians;

  StyleClass({this.useRadians = false});

  AlignmentGeometry _alignment;
  AlignmentGeometry _alignmentChild;
  EdgeInsetsGeometry _padding;
  EdgeInsetsGeometry _margin;

  Color _backgroundColor;
  DecorationImage _backgroundImage;
  double _backgroundBlur;

  Gradient _gradient;
  BoxBorder _border;
  BorderRadiusGeometry _borderRadius;
  List<BoxShadow> _boxShadow;

  double _width;
  double _minWidth;
  double _maxWidth;
  double _height;
  double _minHeight;
  double _maxHeight;

  double _scale;
  double _rotate;
  Offset _offset;

  double _opacity;
  RippleModel _ripple;
  OverflowModel _overflow;

  Duration _duration;
  Curve _curve;

  AlignmentGeometry get getAlignment => _alignment;
  AlignmentGeometry get getAlignmentChild => _alignmentChild;
  EdgeInsetsGeometry get getPadding => _padding;
  EdgeInsetsGeometry get getMargin => _margin;
  Color get getBackgroundColor => _backgroundColor;
  DecorationImage get getBackgroundImage => _backgroundImage;
  double get getBackgroundBlur => _backgroundBlur;
  Gradient get getGradient => _gradient;
  BoxBorder get getBorder => _border;
  BorderRadiusGeometry get getBorderRadius => _borderRadius;
  List<BoxShadow> get getBoxShadow => _boxShadow;
  double get getWidth => _width;
  double get getMinWidth => _minWidth;
  double get getMaxWidth => _maxWidth;
  double get getHeight => _height;
  double get getMinHeight => _minHeight;
  double get getMaxHeight => _maxHeight;
  double get getScale => _scale;
  double get getRotate => _rotate;
  Offset get getOffset => _offset;
  Duration get getDuration => _duration;
  Curve get getCurve => _curve;
  double get getOpacity => _opacity;
  RippleModel get getRipple => _ripple;
  OverflowModel get getOverflow => _overflow;

  BoxDecoration get getBoxDecoration {
    if ((_backgroundColor ??
            _backgroundImage ??
            _gradient ??
            _border ??
            _borderRadius ??
            _boxShadow) !=
        null) {
      return BoxDecoration(
        color: _backgroundColor,
        image: _backgroundImage,
        gradient: _gradient,
        border: _border,
        borderRadius: _borderRadius,
        boxShadow: _boxShadow,
      );
    }
    return null;
  }

  BoxConstraints get getBoxConstraints {
    if ((_minHeight ?? _maxHeight ?? _minWidth ?? _maxWidth) != null) {
      return BoxConstraints(
        minHeight: _minHeight ?? 0.0,
        maxHeight: _maxHeight ?? double.infinity,
        minWidth: _minWidth ?? 0.0,
        maxWidth: _maxWidth ?? double.infinity,
      );
    }
    return null;
  }

  Matrix4 get getTransform {
    if ((_scale ?? _rotate ?? _offset) != null) {
      return Matrix4.rotationZ(_rotate ?? 0.0)
        ..scale(_scale ?? 1.0)
        ..translate(
          _offset?.dx ?? 0.0,
          _offset?.dy ?? 0.0,
        );
    }
    return null;
  }

  /// Alignment of the widget
  ///
  /// ### Supported alignment formats
  /// #### Alignment
  /// Built in Alignment class.
  /// ```dart
  /// Alignment.center, Alignment(0.2, -0.8), etc
  /// ```
  /// #### String
  /// ```dart
  /// 'center', 'top', 'bottom', 'left', 'right',
  /// 'topLeft', 'topRight', 'bottomLeft', 'bottomRight'
  /// ```
  /// #### List<double>
  /// 0.0 equals centered. -1.0 and 1.0 equals to the side
  ///```dart
  /// [double dx, double dy]
  /// ```
  /// #### double
  /// Same value for dx and dy
  /// ```dart
  /// double align
  /// ```
  StyleClass align(dynamic alignment) { 
    _alignment = formatAlignment(alignment);
    return this;  
  }

  /// Alignment of the widget.
  ///
  /// ### Supported alignment formats
  /// #### Alignment
  /// Built in Alignment class.
  /// ```dart
  /// Alignment.center, Alignment(0.2, -0.8), etc
  /// ```
  /// #### String
  /// ```dart
  /// 'center', 'top', 'bottom', 'left', 'right',
  /// 'topLeft', 'topRight', 'bottomLeft', 'bottomRight'
  /// ```
  /// #### List<double>
  /// 0.0 equals centered. -1.0 and 1.0 equals to the side
  ///```dart
  /// [double dx, double dy]
  /// ```
  /// #### double
  /// Same value for dx and dy
  /// ```dart
  /// double align
  /// ```
  StyleClass alignChild(dynamic alignment) {
    _alignmentChild = formatAlignment(alignment);
    return this;
  }
     
  /// Empty space to inscribe inside the [decoration]. The [child], if any, is placed inside this padding.
  ///
  /// All properties work together
  /// ```dart
  /// .padding(all: 10, bottom: 20) // gives a different padding at the bottom
  /// ```
  StyleClass padding(
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

    _padding = EdgeInsets.only(
        top: top ?? 0.0,
        bottom: bottom ?? 0.0,
        left: left ?? 0.0,
        right: right ?? 0.0);
    return this;
  }

  /// Empty space to surround the [decoration] and [child].
  ///
  /// All properties work together
  /// ```dart
  /// .margin(all: 10, bottom: 20) // gives a different margin at the bottom
  /// ```
  StyleClass margin(
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

    _margin = EdgeInsets.only(
      top: top ?? 0.0,
      bottom: bottom ?? 0.0,
      left: left ?? 0.0,
      right: right ?? 0.0,
    );
    return this;
  }

  /// Blurs the background
  ///
  /// Frosted glass example:
  /// ```dart
  /// .backgroundBlur(10)
  /// .backgroundColor(rgba(255,255,255,0.15))
  /// ```
  /// Does not work together with `..rotate()`.
  StyleClass backgroundBlur(double blur) {
    _backgroundBlur = blur;
    return this;
  }

  /// ### Supported color formats
  /// #### Color
  /// Built in Color method. For example
  /// ```dart
  /// Color(0xFFEEEEEE) or Colors.blue
  /// ```
  /// #### HEX String
  /// 6 digit hex color. Optional to use #
  /// ```dart
  /// '#eeeeee' or 'eeeeee'
  /// ```
  /// #### RGBA
  /// ```dart
  /// rgba(43, 120, 32, 0.6)
  /// ```
  /// #### RGB
  /// ```dart
  /// rgb(43, 120, 32])
  /// ```
  StyleClass backgroundColor(dynamic color) {
    _backgroundColor = formatColor(color);
    return this;
  }

  /// Eighter the [url] or the [path] has to be specified.
  /// [url] is for network images and [path] is for local images.
  /// [path] trumps [url].
  ///
  /// ```dart
  /// .backgroundImage(
  ///   url: 'path/to/image'
  ///   fit: BoxFit.cover
  /// )
  /// ```
  StyleClass backgroundImage(
      {String url,
      String path,
      ColorFilter colorFilter,
      BoxFit fit,
      dynamic alignment = Alignment.center,
      ImageRepeat repeat = ImageRepeat.noRepeat}) {
    if ((url ?? path) == null) throw ('A [url] or a [path] has to be provided');

    AlignmentGeometry formattedAlignment = formatAlignment(alignment);

    ImageProvider<dynamic> image;
    if (path != null) {
      image = AssetImage(path);
    } else {
      image = NetworkImage(url);
    }

    _backgroundImage = DecorationImage(
      image: image,
      colorFilter: colorFilter,
      fit: fit,
      alignment: formattedAlignment,
      repeat: repeat,
    );
    return this;
  }

  /// ### Supported alignment formats
  /// #### Alignment
  /// Built in Alignment class.
  /// ```dart
  /// Alignment.center, Alignment(0.2, -0.8), etc
  /// ```
  /// #### String
  /// ```dart
  /// 'center', 'top', 'bottom', 'left', 'right',
  /// 'topLeft', 'topRight', 'bottomLeft', 'bottomRight'
  /// ```
  /// #### List<double>
  /// 0.0 equals centered. -1.0 and 1.0 equals to the side
  ///```dart
  /// [double dx, double dy]
  /// ```
  /// #### double
  /// Same value for dx and dy
  /// ```dart
  /// double align
  /// ```
  StyleClass linearGradient(
      {dynamic beginAlign = 'left',
      dynamic endAlign = 'right',
      @required List<dynamic> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops}) {
    AlignmentGeometry begin = formatAlignment(beginAlign);
    AlignmentGeometry end = formatAlignment(endAlign);

    // List<dynamic> -> List<Color>
    List<Color> finalColors = [];
    for (dynamic color in colors) finalColors.add(formatColor(color));

    _gradient = LinearGradient(
        begin: begin,
        end: end,
        colors: finalColors,
        tileMode: tileMode,
        stops: stops);
    return this;
  }

  /// ### Supported alignment formats
  /// #### Alignment
  /// Built in Alignment class.
  /// ```dart
  /// Alignment.center, Alignment(0.2, -0.8), etc
  /// ```
  /// #### String
  /// ```dart
  /// 'center', 'top', 'bottom', 'left', 'right',
  /// 'topLeft', 'topRight', 'bottomLeft', 'bottomRight'
  /// ```
  /// #### List<double>
  /// 0.0 equals centered. -1.0 and 1.0 equals to the side
  ///```dart
  /// [double dx, double dy]
  /// ```
  /// #### double
  /// Same value for dx and dy
  /// ```dart
  /// double align
  /// ```
  StyleClass radialGradient(
      {dynamic centerAlign = 'center',
      double radius = 0.5,
      @required List<dynamic> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops}) {
    AlignmentGeometry center = formatAlignment(centerAlign);

    // List<dynamic> -> List<Color>
    List<Color> finalColors = [];
    for (dynamic color in colors) finalColors.add(formatColor(color));

    _gradient = RadialGradient(
      center: center,
      radius: radius,
      colors: finalColors,
      tileMode: tileMode,
      stops: stops,
    );
    return this;
  }

  /// Choose to calculate angles with radians or not through [useRadians] parameter.
  /// [endAngle] default to 1.0 if [useRadians] is false and 2 * pi if [useRadians] is true,
  ///
  /// ### Supported alignment formats
  /// #### Alignment
  /// Built in Alignment class.
  /// ```dart
  /// Alignment.center, Alignment(0.2, -0.8), etc
  /// ```
  /// #### String
  /// ```dart
  /// 'center', 'top', 'bottom', 'left', 'right',
  /// 'topLeft', 'topRight', 'bottomLeft', 'bottomRight'
  /// ```
  /// #### List<double>
  /// 0.0 equals centered. -1.0 and 1.0 equals to the side
  ///```dart
  /// [double dx, double dy]
  /// ```
  /// #### double
  /// Same value for dx and dy
  /// ```dart
  /// double align
  /// ```
  StyleClass sweepGradient(
      {dynamic centerAlign = 'center',
      double startAngle = 0.0,
      double endAngle,
      @required List<dynamic> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops}) {
    AlignmentGeometry center = formatAlignment(centerAlign);

    if (useRadians == false) startAngle = startAngle * pi * 2;

    if (endAngle == null) {
      //default value
      endAngle = pi * 2;
    } else if (useRadians == false) {
      //converts value to radians
      endAngle = endAngle * pi * 2;
    }

    // List<dynamic> -> List<Color>
    List<Color> finalColors = [];
    for (dynamic color in colors) finalColors.add(color);

    _gradient = SweepGradient(
      center: center,
      startAngle: startAngle,
      endAngle: endAngle,
      colors: finalColors,
      stops: stops,
      tileMode: tileMode,
    );
    return this;
  }

  /// Border for the widget
  /// ```dart
  /// .border(all: 3.0, color: '#55ffff', style: BorderStyle.solid)
  /// ```
  /// If `all` is declared, `left`, `right`, `top`, and `bottom` will have no effect. These parameters define the width.
  /// `style` define the border style.
  StyleClass border(
      {double all,
      double left,
      double right,
      double top,
      double bottom,
      dynamic color = const Color(0xFF000000),
      BorderStyle style = BorderStyle.solid}) {
    Color finalColor = formatColor(color);

    left = left ?? all;
    right = right ?? all;
    top = top ?? all;
    bottom = bottom ?? all;

    _border = Border(
      left: left == null
          ? BorderSide.none
          : BorderSide(color: finalColor, width: left, style: style),
      right: right == null
          ? BorderSide.none
          : BorderSide(color: finalColor, width: right, style: style),
      top: top == null
          ? BorderSide.none
          : BorderSide(color: finalColor, width: top, style: style),
      bottom: bottom == null
          ? BorderSide.none
          : BorderSide(color: finalColor, width: bottom, style: style),
    );
    return this;
  }

  /// It is valid to use `all` together with single sided properties. Single sided properties will trump over the `all` property.
  StyleClass borderRadius(
      {double all,
      double topLeft,
      double topRight,
      double bottomLeft,
      double bottomRight}) {
    topLeft = topLeft ?? all;
    topRight = topRight ?? all;
    bottomLeft = bottomLeft ?? all;
    bottomRight = bottomRight ?? all;

    _borderRadius = BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? 0.0),
      topRight: Radius.circular(topRight ?? 0.0),
      bottomLeft: Radius.circular(bottomLeft ?? 0.0),
      bottomRight: Radius.circular(bottomRight ?? 0.0),
    );
    return this;
  }

  /// If defined while the elevation method is defined, the last one defined will be the one applied.
  /// ### Supported color formats
  /// #### Color
  /// Built in Color method. For example
  /// ```dart
  /// Color(0xFFEEEEEE) or Colors.blue
  /// ```
  /// #### HEX String
  /// 6 digit hex color. Optional to use #
  /// ```dart
  /// '#eeeeee' or 'eeeeee'
  /// ```
  /// #### RGBA
  /// ```dart
  /// rgba(43, 120, 32, 0.6)
  /// ```
  /// #### RGB
  /// ```dart
  /// rgb(43, 120, 32])
  /// ```
  StyleClass boxShadow(
      {dynamic color = const Color(0x33000000),
      double blur,
      List<double> offset,
      double spread}) {
    Offset finalOffset;
    Color shadowColor = formatColor(color);

    if (offset.length == 1) {
      finalOffset = Offset(offset[0] ?? 0.0, offset[0] ?? 0.0);
    } else if (offset.length == 2) {
      finalOffset = Offset(offset[0] ?? 0.0, offset[1] ?? 0.0);
    }

    _boxShadow = [
      BoxShadow(
        color: shadowColor,
        blurRadius: blur ?? 0.0,
        spreadRadius: spread ?? 0.0,
        offset: finalOffset ?? Offset(0.0, 0.0),
      ),
    ];
    return this;
  }

  /// Elevates the widget with a boxShadow.
  ///
  /// [angle] parameter takes a circular value.
  /// Eighter radians or not, depending on what is specified in the `StyleClass` constructor. 0.0 is down.
  /// If [angle] equals [null] the shadow will be directly under the widget.
  /// ```dart
  /// StyleClass.elevation(30.0, color: '#f5f5f5', angle: 0.0)
  /// ```
  ///
  /// If the elevation property is used at the same time as the boxShadow property, the last one
  /// defined will be the one applied.
  StyleClass elevation(double elevation,
      {double angle = 0.0, dynamic color = const Color(0x33000000)}) {
    if (elevation < 0)
      throw ('Elevation cant be negative. Recieved a value of $elevation');

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
    double opacity = 0.5 - (sqrt(elevation) / 19);
    if (opacity < 0.0) opacity = 0.0;

    //find which color format used: hex, rgba or color
    Color formattedColor = formatColor(color).withOpacity(opacity);

    _boxShadow = [
      BoxShadow(
          color: formattedColor,
          blurRadius: blur,
          spreadRadius: spread,
          offset: Offset(offsetX, offsetY))
    ];
    return this;
  }

  StyleClass width(double width) {_width = width; return this;} 
  StyleClass minWidth(double minWidth) {_minWidth = minWidth; return this;}
  StyleClass maxWidth(double maxWidth) {_maxWidth = maxWidth; return this;}
  StyleClass height(double height) {_height = height; return this;}
  StyleClass minHeight(double minHeight) {_minHeight = minHeight; return this;}
  StyleClass maxHeight(double maxHeight) {_maxHeight = maxHeight; return this;}

  /// Must not be negative.
  /// 1 corresponds to normal size. 2 corresponds to double the size.
  /// ```dart
  /// StyleClass().scale(0.7);
  /// ```
  StyleClass scale(double ratio) {
    if (ratio < 0) throw ('The widget scale cannot be negative: $ratio');
    _scale = ratio;
    return this;
  }

  /// Offsetts the widget.
  /// ```dart
  /// StyleClass().offset(10.0, 5.0);
  /// ```
  StyleClass offset(double dx, double dy) {_offset = Offset(dx, dy); return this;}

  /// Widget rotation
  /// ```dart
  /// StyleClass(userRadians = false).rotate(0.75);
  ///
  /// StyleClass(useRadians = true).rotate(0.75 * pi * 2)
  /// ```
  /// Choose to calculate angles with radians or not through [useRadians] `StyleClass` parameter. 0.0 - 1.0 or 0.0 - 2 * pi
  StyleClass rotate(double angle) {
    if (useRadians == true) {
      _rotate = angle;
    } else {
      _rotate = angle * pi * 2;
    }
    return this;
  }

  /// Opacity applied to the whole widget
  ///
  /// Can not be higher than 1.0 or lower than 0.0
  ///
  /// ```dart
  /// StyleClass().opacity(0.7);
  /// ```
  StyleClass opacity(double opacity) {
    if (opacity < 0.0 || opacity > 1.0)
      throw ('Invalid opacity value: $opacity');

    _opacity = opacity;
    return this;
  }

  /// Material ripple effect
  /// ```dart
  /// StyleClass().ripple(true);
  /// ```
  /// **`onTap` does not work if `ripple` is defined.**
  /// You may use `onTapDown`, `onTapUp` or `onTapCancel` instead.
  StyleClass ripple(bool enable, {dynamic splashColor, dynamic highlightColor}) {
    _ripple = RippleModel(
      enable: enable,
      splashColor: splashColor != null ? formatColor(splashColor) : null,
      highlightColor:
          highlightColor != null ? formatColor(highlightColor) : null,
    );
    return this;
  }

  /// Change child overflow behaviour.
  ///
  /// #### Overflow visible
  /// ```dart
  /// .overflow('visible', direction: Axis.vertical)
  /// ```
  /// The child will grow outside of the parent.
  ///
  /// Specify the overflow direction with the [direction] parameter.
  /// #### Overflow hidden
  /// ```dart
  /// .overflow('hidden')
  /// ```
  /// The child will be clipped to fit in the parent.
  /// #### Overflow scroll
  /// ```dart
  /// .overflow('scroll', direction: Axis.vertical)
  /// ```
  /// The child will become scrollable if it gets bigger than its parent.
  /// ##### The overflow method does not support animation
  StyleClass overflow(String overflow, {Axis direction = Axis.vertical}) {
    _overflow = OverflowModel(
      overflow: formatOverflow(overflow),
      direction: direction,
    );
    return this;
  }

  /// `Duration` is given in milliseconds.
  ///
  /// ```dart
  /// StyleClass().animate(400, Curves.easeInOut);
  /// ```
  ///
  /// **Adding a delay to your animation**
  /// ```
  /// .onTapDown((details) {
  ///   // change styling without a delay
  ///   thisStyle.backgroundColor(rgb(255,255,0));
  ///
  ///   // Trigger the setState with a delay
  ///   Future.delayed(Duration(milliseconds: 500)).then((value) => setState(() {}));
  /// })
  /// ```
  StyleClass animate([int duration = 500, Curve curve = Curves.linear]) {
    if (duration < 0) throw ('Duration cannot be negative');

    _duration = Duration(milliseconds: duration);
    _curve = curve;
    return this;
  }

  /// Adds a `StyleClass` to a `StyleClass`.
  /// ```dart
  /// StyleClass().add(StyleClass.width(100));
  /// ```
  ///
  /// The add property does not override already defined properties, just adds new ones.
  StyleClass add(StyleClass styleClass, {bool override = false}) {
    // if override is true, all style from the added class will override current style
    if (override == true) {
      _alignment = styleClass?.getAlignment ?? _alignment;
      _alignmentChild = styleClass?.getAlignmentChild ?? _alignmentChild;
      _padding = styleClass?.getPadding ?? _padding;
      _margin = styleClass?.getMargin ?? _margin;
      _backgroundColor = styleClass?.getBackgroundColor ?? _backgroundColor;
      _backgroundImage = styleClass?.getBackgroundImage ?? _backgroundImage;
      _backgroundBlur = styleClass?.getBackgroundBlur ?? _backgroundBlur;
      _gradient = styleClass?.getGradient ?? _gradient;
      _border = styleClass?.getBorder ?? _border;
      _borderRadius = styleClass?.getBorderRadius ?? _borderRadius;
      _boxShadow = styleClass?.getBoxShadow ?? _boxShadow;
      _width = styleClass?.getWidth ?? _width;
      _minWidth = styleClass?.getMinWidth ?? _minWidth;
      _maxWidth = styleClass?.getMaxWidth ?? _maxWidth;
      _height = styleClass?.getHeight ?? _height;
      _minHeight = styleClass?.getMinHeight ?? _minHeight;
      _maxHeight = styleClass?.getMaxHeight ?? _minHeight;
      _scale = styleClass?.getScale ?? _scale;
      _rotate = styleClass?.getRotate ?? _rotate;
      _offset = styleClass?.getOffset ?? _offset;
      _duration = styleClass?.getDuration ?? _duration;
      _curve = styleClass?.getCurve ?? _curve;
      _ripple = styleClass?.getRipple ?? _ripple;
      _opacity = styleClass?.getOpacity ?? _opacity;
    } else {
      _alignment = _alignment ?? styleClass?.getAlignment;
      _alignmentChild = _alignmentChild ?? styleClass?.getAlignmentChild;
      _padding = _padding ?? styleClass?.getPadding;
      _margin = _margin ?? styleClass?.getMargin;
      _backgroundColor = _backgroundColor ?? styleClass?.getBackgroundColor;
      _backgroundImage = styleClass?.getBackgroundImage ?? _backgroundImage;
      _backgroundBlur = styleClass?.getBackgroundBlur ?? _backgroundBlur;
      _gradient = _gradient ?? styleClass?.getGradient;
      _border = _border ?? styleClass?.getBorder;
      _borderRadius = _borderRadius ?? styleClass?.getBorderRadius;
      _boxShadow = _boxShadow ?? styleClass?.getBoxShadow;
      _width = _width ?? styleClass?.getWidth;
      _minWidth = _minWidth ?? styleClass?.getMinWidth;
      _maxWidth = _maxWidth ?? styleClass?.getMaxWidth;
      _height = _height ?? styleClass?.getHeight;
      _minHeight = _minHeight ?? styleClass?.getMinHeight;
      _maxHeight = _maxHeight ?? styleClass?.getMaxHeight;
      _scale = _scale ?? styleClass?.getScale;
      _rotate = _rotate ?? styleClass?.getRotate;
      _offset = _offset ?? styleClass?.getOffset;
      _duration = _duration ?? styleClass?.getDuration;
      _curve = _curve ?? styleClass?.getCurve;
      _ripple = _ripple ?? styleClass?.getRipple;
      _opacity = _opacity ?? styleClass?.getOpacity;
    }
    return this;
  }
}