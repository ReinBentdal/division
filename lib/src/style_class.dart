import 'format/format_alignment.dart';
import 'format/format_color.dart';
import 'package:flutter/material.dart';
import 'dart:math';

/// Holds all the styling for the `Division` widget
///
/// If `useRadians` parameter is false, one full circle equals 1. If true one full circle equals 2 * pi.
/// Applies to the style properties which by default in flutter uses radians, like ..rotate() nad ..sweepGradient()
///
/// ```dart
/// Division(
///   style: StyleClass(useRadians = false)
///     ..width(100)
///     ..height(150)
///     ..borderRadius(all: 30.0)
///     ..backgroundColor(hex; 'eeeeee'),
///   gesture: GestureClass()
///     ..onTap(() => print('Widget pressed!'))
///     ..onLongPress(() => print('Widget pressed long!)),
///   child: Text('Some text),
/// )
/// ```
class StyleClass {
  //Choose to calculate using radians or from 0 to 1
  final bool useRadians;

  BuildContext context;

  //May include context as a required parameter if needed.
  // BuildContext context;

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

  //Animation duration in milliseconds
  int _duration;

  //animation curve
  Curve _curve;

  //The only styleproperties to be animated. If null all properties will be animated
  // TODO: implement _only functionality
  // StyleClass _only;

  /// used to get the final style property
  AlignmentGeometry get getAlignment => _alignment;

  /// used to get the final style property
  AlignmentGeometry get getAlignmentChild => _alignmentChild;

  /// used to get the final style property
  EdgeInsetsGeometry get getPadding => _padding;

  /// used to get the final style property
  EdgeInsetsGeometry get getMargin => _margin;

  /// used to get the final style property
  Color get getBackgroundColor => _backgroundColor;

  /// used to get the final style property
  DecorationImage get getBackgroundImage => _backgroundImage;

  /// used to get the final style property
  double get getBackgroundBlur => _backgroundBlur;

  /// used t get the final style property
  Gradient get getGradient => _gradient;

  /// used to get the final style property
  BoxBorder get getBorder => _border;

  /// used to get the final style property
  BorderRadiusGeometry get getBorderRadius => _borderRadius;

  /// used to get the final style property
  List<BoxShadow> get getBoxShadow => _boxShadow;

  /// used to get the final style property
  double get getWidth => _width;

  /// used to get the final style property
  double get getMinWidth => _minWidth;

  /// used to get the final style property
  double get getMaxWidth => _maxWidth;

  /// used to get the final style property
  double get getHeight => _height;

  /// used to get the final style property
  double get getMinHeight => _minHeight;

  /// used to get the final style property
  double get getMaxHeight => _maxHeight;

  /// used to get the final style property
  double get getScale => _scale;

  /// used to get the final style property
  double get getRotate => _rotate;

  /// used to get the final style property
  Offset get getOffset => _offset;

  /// used to get the final style property
  int get getDuration => _duration;

  /// used to get the final style property
  Curve get getCurve => _curve;

  /// used to get the final style property
  // StyleClass get getOnly => _only;

  /// Alignment of the widget.
  ///
  /// ### Supported alignment formats
  /// #### Alignment
  /// Built in Alignment method. For example
  /// ```dart
  /// Alignment.center
  /// ```
  ///
  /// #### String
  /// ```dart
  /// 'center', 'top', 'bottom', 'left', 'right', 'topLeft', 'topRight', 'bottomLeft', 'bottomRight'
  /// ```
  /// #### List<double>
  ///
  /// 0.0 equals centered. -1.0 and 1.0 equals to the side
  ///```dart
  /// [double dx, double dy]
  /// ```
  /// #### double
  ///
  /// Same value for dx and dy
  /// ```dart
  /// double align
  /// ```
  ///
  void align(dynamic alignment) {
    _alignment = formatAlignment(alignment);
  }

  /// Alignment of the child widget.
  ///
  /// ### Supported alignment formats
  /// #### Alignment
  /// Built in Alignment method. For example
  /// ```dart
  /// Alignment.center
  /// ```
  ///
  /// #### String
  /// ```dart
  /// 'center', 'top', 'bottom', 'left', 'right', 'topLeft', 'topRight', 'bottomLeft', 'bottomRight'
  /// ```
  /// #### List<double>
  ///
  /// 0.0 equals centered. -1.0 and 1.0 equals to the side
  ///```dart
  /// [double dx, double dy]
  /// ```
  /// #### double
  ///
  /// Same value for dx and dy
  /// ```dart
  /// double align
  /// ```
  ///
  void alignChild(dynamic alignment) {
    _alignmentChild = formatAlignment(alignment);
  }

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

    _padding = EdgeInsets.only(
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

    _margin = EdgeInsets.only(
      top: top ?? 0.0,
      bottom: bottom ?? 0.0,
      left: left ?? 0.0,
      right: right ?? 0.0,
    );
  }

  /// Blurs the background
  ///
  /// Frosted glass example:
  /// ```dart
  /// ..backgroundBlur(10)
  /// ..backgroundColor(rgba(255,255,255,0.15))
  /// ```
  /// Does not work together with `..rotate()`.
  void backgroundBlur(double blur) {
    _backgroundBlur = blur;
  }

  /// ### Supported color formats
  /// #### Color
  /// Built in Color method. For example
  /// ```dart
  /// Color(0xFFEEEEEE) or Colors.blue
  /// ```
  /// #### HEX String
  /// 6 digit hex color. Optional to use # or not
  /// ```dart
  /// '#eeeeee' or 'eeeeee'
  /// ```
  /// #### RGBA List<dynamic>
  /// Formatted as [int, int, int, double]
  /// ```dart
  /// [43, 120, 32, 0.6]
  /// ```
  /// #### RGB List<int>
  /// ```dart
  /// [43, 120, 32]
  /// ```
  void backgroundColor(dynamic color) {
    _backgroundColor = formatColor(color);
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
  void backgroundImage(
      {String url,
      String path,
      ColorFilter colorFilter,
      BoxFit fit,
      dynamic alignment = Alignment.center,
      ImageRepeat repeat = ImageRepeat.noRepeat}) {
    if ((url ?? path) == null) {
      throw ('A [url] or a [path] has to be provided');
    }

    alignment = formatAlignment(alignment);

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
      alignment: alignment,
      repeat: repeat,
    );
  }

  /// ### Supported alignment formats
  /// #### Alignment
  /// Built in Alignment method. For example
  /// ```dart
  /// Alignment.center
  /// ```
  ///
  /// #### String
  /// ```dart
  /// 'center', 'top', 'bottom', 'left', 'right', 'topLeft', 'topRight', 'bottomLeft', 'bottomRight'
  /// ```
  /// #### List<double>
  ///
  /// 0.0 equals centered. -1.0 and 1.0 equals to the side
  ///```dart
  /// [double dx, double dy]
  /// ```
  /// #### double
  ///
  /// Same value for dx and dy
  /// ```dart
  /// double align
  /// ```
  ///
  void linearGradient(
      {dynamic beginAlign = 'left',
      dynamic endAlign = 'right',
      @required List<dynamic> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops}) {
    AlignmentGeometry begin = formatAlignment(beginAlign);
    AlignmentGeometry end = formatAlignment(endAlign);

    // Converts the dynamic list of colors to a List<Color>
    List<Color> finalColors = [];
    for (dynamic color in colors) {
      finalColors.add(formatColor(color));
    }

    _gradient = LinearGradient(
        begin: begin,
        end: end,
        colors: finalColors,
        tileMode: tileMode,
        stops: stops);
  }

  /// ### Supported alignment formats
  /// #### Alignment
  /// Built in Alignment method. For example
  /// ```dart
  /// Alignment.center
  /// ```
  ///
  /// #### String
  /// ```dart
  /// 'center', 'top', 'bottom', 'left', 'right', 'topLeft', 'topRight', 'bottomLeft', 'bottomRight'
  /// ```
  /// #### List<double>
  ///
  /// 0.0 equals centered. -1.0 and 1.0 equals to the side
  ///```dart
  /// [double dx, double dy]
  /// ```
  /// #### double
  ///
  /// Same value for dx and dy
  /// ```dart
  /// double align
  /// ```
  ///
  void radialGradient(
      {dynamic centerAlign = 'center',
      double radius = 0.5,
      @required List<dynamic> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops}) {
    AlignmentGeometry center = formatAlignment(centerAlign);

    // Converts the dynamic list of colors to a List<Color>
    List<Color> finalColors = [];
    for (dynamic color in colors) {
      finalColors.add(formatColor(color));
    }

    _gradient = RadialGradient(
      center: center,
      radius: radius,
      colors: finalColors,
      tileMode: tileMode,
      stops: stops,
    );
  }

  /// ### Supported alignment formats
  /// #### Alignment
  /// Built in Alignment method. For example
  /// ```dart
  /// Alignment.center
  /// ```
  ///
  /// #### String
  /// ```dart
  /// 'center', 'top', 'bottom', 'left', 'right', 'topLeft', 'topRight', 'bottomLeft', 'bottomRight'
  /// ```
  /// #### List<double>
  ///
  /// 0.0 equals centered. -1.0 and 1.0 equals to the side
  ///```dart
  /// [double dx, double dy]
  /// ```
  /// #### double
  ///
  /// Same value for dx and dy
  /// ```dart
  /// double align
  /// ```
  ///
  void sweepGradient(
      {dynamic centerAlign = 'center',
      double startAngle = 0.0,
      double endAngle,
      @required List<dynamic> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops}) {
    AlignmentGeometry center = formatAlignment(centerAlign);

    if (useRadians == false) {
      startAngle = startAngle * pi * 2;
    }

    if (endAngle == null) {
      //default value
      endAngle = pi * 2;
    } else if (useRadians == false) {
      //converts value to radians
      endAngle = endAngle * pi * 2;
    }

    // Converts the dynamic list of colors to a List<Color>
    List<Color> finalColors = [];
    for (dynamic color in colors) {
      finalColors.add(color);
    }

    _gradient = SweepGradient(
      center: center,
      startAngle: startAngle,
      endAngle: endAngle,
      colors: finalColors,
      stops: stops,
      tileMode: tileMode,
    );
  }

  /// Border for the widget
  /// ```dart
  /// ..border(all: 3.0, color: '#55ffff', style: BorderStyle.solid)
  /// ```
  /// If `all` is declared, `left`, `right`, `top`, and `bottom` will have no effect. These parameters define the width.
  /// `style` define the border style.
  void border(
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
  }

  /// Eigther use the `all` property to apply to all corners, or user `topLeft`, `topRight`, `bottomLeft` and `bottomRight`.
  /// If the `all` property is defined, the other properties will have no effect.
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

    _borderRadius = BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? 0.0),
      topRight: Radius.circular(topRight ?? 0.0),
      bottomLeft: Radius.circular(bottomLeft ?? 0.0),
      bottomRight: Radius.circular(bottomRight ?? 0.0),
    );
  }

  /// If defined while the elevation property is defined, the last one defined will be the style applied.
  /// ### Supported color formats
  /// #### Color
  /// Built in Color method. For example
  /// ```dart
  /// Color(0xFFEEEEEE) or Colors.blue
  /// ```
  /// #### HEX String
  /// 6 digit hex color. Optional to use # or not
  /// ```dart
  /// '#eeeeee' or 'eeeeee'
  /// ```
  /// #### RGBA List<dynamic>
  /// Formatted as [int, int, int, double]
  /// ```dart
  /// [43, 120, 32, 0.6]
  /// ```
  /// #### RGB List<int>
  /// ```dart
  /// [43, 120, 32]
  /// ```
  void boxShadow(
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
          offset: finalOffset ?? Offset(0.0, 0.0))
    ];
  }

  /// Elevates the widget with a boxShadow.
  ///
  /// If the elevation property is used at the same time as the boxShadow property, the last one
  /// defined will be the applied style.
  /// If the `angled` property is true, the shadow will be att 45 degrees.
  /// ```dart
  /// StyleClass..elevation(30.0, '#f5f5f5')
  /// ```
  void elevation(double elevation,
      {bool angled = false, dynamic color = const Color(0x33000000)}) {
    // prevent negative values
    if (elevation < 0) {
      throw ('Elevation cant be negative. Recieved a value of $elevation');
    }

    //No shadow if elevation == 0
    if (elevation == 0) {
      _boxShadow = null;
      return;
    }

    final double offsetX = angled ? elevation : 0.0;
    final double offsetY = elevation;
    final double spread = 0.0;
    final double blur = elevation;
    Color shadowColor;

    //custom curve defining the opacity
    // double opacity = 0.2 - (sqrt(elevation) / 90);
    double opacity = 0.5 - (sqrt(elevation) / 19);

    //prevent negative values for the opacity
    if (opacity < 0.0) {
      opacity = 0.0;
    }

    //find which color format used: hex, rgba or color
    shadowColor = formatColor(color).withOpacity(opacity);

    _boxShadow = [
      BoxShadow(
          color: shadowColor,
          blurRadius: blur,
          spreadRadius: spread,
          offset: Offset(offsetX, offsetY))
    ];
  }

  /// ```dart
  /// StyleClass()..width(100.0);
  /// ```
  void width(double width) {
    _width = width ?? _width;
  }

  /// ```dart
  /// StyleClass()..minWidth(10.0);
  /// ```
  void minWidth(double minWidth) {
    _minWidth = minWidth ?? _minWidth;
  }

  /// ```dart
  /// StyleClass()..maxWidth(500.0);
  /// ```
  void maxWidth(double maxWidth) {
    _maxWidth = maxWidth ?? _maxWidth;
  }

  /// ```dart
  /// StyleClass()..height(100.0);
  /// ```
  void height(double height) {
    _height = height ?? _height;
  }

  /// ```dart
  /// StyleClass()..minHeight(10.0);
  /// ```
  void minHeight(double minHeight) {
    _minHeight = minHeight ?? _minHeight;
  }

  /// ```dart
  /// StyleClass()..maxHeight(500.0);
  /// ```
  void maxHeight(double maxHeight) {
    _maxHeight = maxHeight ?? _maxHeight;
  }

  /// ```dart
  /// StyleClass()..scale(0.7);
  /// ```
  void scale(double scale) {
    // Scales the object. 1 is normal scale. 2 is double. 0 is null
    _scale = scale ?? _scale;
  }

  /// Offsetts the widget.
  /// ```dart
  /// StyleClass()..offset(10.0, 5.0);
  /// ```
  void offset(double dx, double dy) {
    // Offsets the object. The offset direction changes with the rotation
    _offset = Offset(dx, dy);
  }

  /// Widget rotation
  /// ```dart
  /// StyleClass(userRadians = false)..rotate(0.75);
  ///
  /// StyleClass(useRadians = true)..rotate(0.75 * pi * 2)
  /// ```
  ///
  /// Choose between using radians or not.
  void rotate(double rotate) {
    if (useRadians == true) {
      _rotate = rotate;
    } else {
      _rotate = rotate * pi * 2;
    }
  }

  /// `Duration` is given in milliseconds.
  ///
  /// Currenty does not support align, scale, rotate and offset
  ///
  /// ```dart
  /// StyleClass()..animate(400, Curves.easeInOut);
  /// ```
  void animate([int duration = 500, Curve curve = Curves.linear]) {
    // TODO: animate delay

    if (duration < 0) {
      throw ('Duration cannot be negative');
    }
    _duration = duration;
    _curve = curve;
    // _only = only;
  }

  /// Adds a `StyleClass` to a `StyleClass`.
  /// ```dart
  /// StyleClass()..add(StyleClass..width(100));
  /// ```
  ///
  /// The add property does not override already defined properties, just adds new ones.
  void add(StyleClass styleClass, {bool override = false}) {
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
    }
  }
}
