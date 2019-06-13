import 'package:division/src/format_alignment.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'get_color.dart';

/// Holds all the styling for the `Division` widget
///
/// ```dart
/// Division(
///   style: StyleClass()
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
  AlignmentGeometry _alignment;
  AlignmentGeometry _alignmentChild;
  EdgeInsetsGeometry _padding;
  EdgeInsetsGeometry _margin;
  Color _backgroundColor;
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
  /// Valid alignments: `'center'`, `'top'`, `'bottom'`, `'left'`, `'right'`, `'topLeft'`, `'topRight'`, `'bottomLeft'` and `'bottomRight'`
  void align(String alignment) {
    _alignment = formatAlignment(alignment);
  }

  /// Alignment of the [child]
  ///
  /// Valid alignments: `'center'`, `'top'`, `'bottom'`, `'left'`, `'right'`, `'topLeft'`, `'topRight'`, `'bottomLeft'` and `'bottomRight'`
  void alignChild(String alignment) {
    _alignmentChild = formatAlignment(alignment);
  }

  /// If `all` is defined, non of the other properties will have an effect.
  ///
  /// If `horizontal` and `vertical` is defined, `top`, `bottom`, `left`, and `right` will have no effect.
  void padding(
      {double all,
      double horizontal,
      double vertical,
      double top,
      double bottom,
      double left,
      double right}) {
    if (all != null) {
      _padding = EdgeInsets.all(all);
    } else if ((horizontal ?? vertical) != null) {
      _padding = EdgeInsets.symmetric(
          horizontal: horizontal ?? 0.0, vertical: vertical ?? 0.0);
    } else if ((top ?? bottom ?? left ?? right) != null) {
      _padding = EdgeInsets.only(
          top: top ?? 0.0,
          bottom: bottom ?? 0.0,
          left: left ?? 0.0,
          right: right ?? 0.0);
    }
  }

  /// If `all` is defined, non of the other properties will have an effect.
  ///
  /// If `horizontal` and `vertical` is defined, `top`, `bottom`, `left`, and `right` will have no effect.
  void margin(
      {double all,
      double horizontal,
      double vertical,
      double top,
      double bottom,
      double left,
      double right}) {
    if (all != null) {
      _margin = EdgeInsets.all(all);
    } else if ((horizontal ?? vertical) != null) {
      _margin = EdgeInsets.symmetric(
          horizontal: horizontal ?? 0.0, vertical: vertical ?? 0.0);
    } else if ((top ?? bottom ?? left ?? right) != null) {
      _margin = EdgeInsets.only(
        top: top ?? 0.0,
        bottom: bottom ?? 0.0,
        left: left ?? 0.0,
        right: right ?? 0.0,
      );
    }
  }

  /// Choose between the `hex`, `rgba` and `color` format to give a background color to your widget.
  void backgroundColor({String hex, List rgba, Color color}) {
    _backgroundColor =
        getColor(hex: hex, rgba: rgba, color: color) ?? _backgroundColor;
  }

  /// Border for the widget
  ///
  /// Choose between the `hex`, `rgba` and `color` format to give a border color to your widget.
  /// If `all` is declared, `left`, `right`, `top`, and `bottom` will have no effect. These parameters define the width.
  /// `style` define the border style.
  ///
  /// ```dart
  /// ..border(all: 3.0, hex: '#55ffff', style: BorderStyle.solid)
  /// ```
  ///
  void border(
      {double all,
      double left,
      double right,
      double top,
      double bottom,
      Color color = const Color(0xFF000000),
      String hex,
      List<double> rgba,
      BorderStyle style = BorderStyle.solid}) {
    Color finalColor = getColor(hex: hex, rgba: rgba, color: color);
    if (all != null) {
      _border = Border.all(color: finalColor, width: all, style: style);
    } else if ((left ?? right ?? top ?? bottom) != null) {
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
  }

  /// Eigther use the `all` property to apply to all corners, or user `topLeft`, `topRight`, `bottomLeft` and `bottomRight`.
  /// If the `all` property is defined, the other properties will have no effect.
  void borderRadius(
      {double all,
      double topLeft,
      double topRight,
      double bottomLeft,
      double bottomRight}) {
    if (all != null) {
      _borderRadius = BorderRadius.all(Radius.circular(all));
    } else if (topLeft != null ||
        topRight != null ||
        bottomLeft != null ||
        bottomRight != null) {
      _borderRadius = BorderRadius.only(
        topLeft: Radius.circular(topLeft ?? 0.0),
        topRight: Radius.circular(topRight ?? 0.0),
        bottomLeft: Radius.circular(bottomLeft ?? 0.0),
        bottomRight: Radius.circular(bottomRight ?? 0.0),
      );
    }
  }

  /// Choose between the `hex`, `rgba` and `color` format to give a boxShadow color to your widget.
  /// If defined while the elevation property is defined, the last one defined will be the style applied.
  void boxShadow(
      {String hex,
      List rgba,
      Color color,
      double blur,
      List<double> offset,
      double spread}) {
    Offset finalOffset;
    Color shadowColor = getColor(hex: hex, rgba: rgba, color: color);

    if (offset.length == 1) {
      finalOffset = Offset(offset[0] ?? 0.0, offset[0] ?? 0.0);
    } else if (offset.length == 2) {
      finalOffset = Offset(offset[0] ?? 0.0, offset[1] ?? 0.0);
    }

    _boxShadow = [
      BoxShadow(
          color: shadowColor ?? const Color(0xFF000000).withOpacity(0.2),
          blurRadius: blur ?? 0.0,
          spreadRadius: spread ?? 0.0,
          offset: finalOffset ?? Offset(0.0, 0.0))
    ];
  }

  /// Elevates the widget with a boxShadow.
  /// If the elevation property is used at the same time as the boxShadow property, the last one
  /// defined will be the applied style.
  ///
  /// For the shadow color, you can choose between the `hex`, `rgba`, `color` and `bgColor` format.
  ///
  /// `bgColor` makes the shadow the same color as the background color of the widget with a 0.5 opacity. Elevation then has to be defined
  /// after `backgroundColor`
  ///
  /// If the `angled` property is true, the shadow will be att 45 degrees.
  ///
  /// ```dart
  /// StyleClass..elevation(30, true);
  /// ```
  void elevation(double elevation,
      {bool angled = false,
      String hex,
      List rgba,
      Color color = const Color(0x33000000),
      bool bgColor = false}) {
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
    Color shadowColor; // opacity 0.2

    //custom curve defining the opacity
    // double opacity = 0.2 - (sqrt(elevation) / 90);
    double opacity = 0.5 - (sqrt(elevation) / 19);

    //prevent negative values for the opacity
    if (opacity < 0.0) {
      opacity = 0.0;
    }

    //find which color format used: hex, rgba or color
    if (bgColor == true) {
      if (_backgroundColor == null) {
        print(
            'Warning [Division]: Elevation has to be defined after backgrounColor for the `bgColor` property to work');
      }
      shadowColor = _backgroundColor?.withOpacity(0.5);
    } else {
      shadowColor =
          getColor(hex: hex, rgba: rgba, color: color).withOpacity(opacity);
    }

    _boxShadow = [
      BoxShadow(
          color: shadowColor ?? Color(0x33000000),
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

  /// ```dart
  /// StyleClass()..offset(10.0, 5.0);
  /// ```
  void offset([double dx, double dy]) {
    // Offsets the object. The offset direction changes with the rotation
    _offset = Offset(dx ?? 0.0, dy ?? 0.0);
  }

  /// Object rotation. 1 equals 1 turn.
  /// ```dart
  /// StyleClass()..rotate(0.75);
  /// ```
  void rotate(double rotate) {
    _rotate = rotate ?? _rotate;
  }

  /// `Duration` is given in milliseconds.
  ///
  /// ```dart
  /// StyleClass()..animate(
  ///     400,
  ///     Curves.easeInOut,
  ///     StyleClass()
  ///       ..width(100));
  /// ```
  void animate([int duration = 500, Curve curve = Curves.linear]) {
    _duration = duration;
    _curve = curve;
    // _only = only;
  }

  /// Adds a `StyleClass` to a `StyleClass`.
  /// The add property does not override already defined properties, just adds new ones.
  ///
  /// ```dart
  /// StyleClass()..add(StyleClass..width(100));
  /// ```
  void add(StyleClass styleClass) {
    // does not override already defined style, just adds new style
    // Adds another StyleClass to this class
    //
    // # Example
    //
    // StyleClass blueButton = StyleClass()..backgroundColor(color: Colors.blue);
    // blueButton..add(buttonClass)
    //

    if (_alignment == null) {
      _alignment = styleClass?._alignment;
    }

    if (_alignmentChild == null) {
      _alignmentChild = styleClass?._alignmentChild;
    }

    if (_padding == null) {
      _padding = styleClass?.getPadding;
    }

    if (_margin == null) {
      _margin = styleClass?.getMargin;
    }

    if (_backgroundColor == null) {
      _backgroundColor = styleClass?.getBackgroundColor;
    }

    if (_borderRadius == null) {
      _borderRadius = styleClass?.getBorderRadius;
    }

    if (_boxShadow == null) {
      _boxShadow = styleClass?.getBoxShadow;
    }

    if (_width == null) {
      _width = styleClass?.getWidth;
    }

    if (_minWidth == null) {
      _minWidth = styleClass?.getMinWidth;
    }

    if (_maxWidth == null) {
      _maxWidth = styleClass?.getMaxWidth;
    }

    if (_height == null) {
      _height = styleClass?.getHeight;
    }

    if (_minHeight == null) {
      _minHeight = styleClass?.getMinHeight;
    }

    if (_maxHeight == null) {
      _maxHeight = styleClass?.getMaxHeight;
    }

    if (_scale == null) {
      _scale = styleClass?.getScale;
    }

    if (_rotate == null) {
      _rotate = styleClass?.getRotate;
    }

    if (_offset == null) {
      _offset = styleClass?.getOffset;
    }
  }
}
