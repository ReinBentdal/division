import 'package:flutter/material.dart';

import '../functions/hex_color.dart';

class S {
  static Map align(String alignmentInput) {
    final String property = 'align';
    Alignment alignment = Alignment.center;

    switch (alignmentInput) {
      case 'center':
        alignment = Alignment.center;
        break;
      case 'top':
        alignment = Alignment.topCenter;
        break;
      case 'bottom':
        alignment = Alignment.bottomCenter;
        break;
      case 'left':
        alignment = Alignment.centerLeft;
        break;
      case 'right':
        alignment = Alignment.centerRight;
        break;
      case 'bottom':
        alignment = Alignment.bottomCenter;
        break;
    }

    final Map output = {'property': property, 'style': alignment};

    return output;
  }

  static Map alignChild(String alignmentInput) {
    final String property = 'alignChild';
    Alignment alignment = Alignment.center;

    switch (alignmentInput) {
      case 'center':
        alignment = Alignment.center;
        break;
      case 'top':
        alignment = Alignment.topCenter;
        break;
      case 'bottom':
        alignment = Alignment.bottomCenter;
        break;
      case 'left':
        alignment = Alignment.centerLeft;
        break;
      case 'right':
        alignment = Alignment.centerRight;
        break;
      case 'bottom':
        alignment = Alignment.bottomCenter;
        break;
    }

    final Map output = {'property': property, 'style': alignment};

    return output;
  }

  static Map padding(
      {double all,
      double horizontal,
      double vertical,
      double top,
      double bottom,
      double left,
      double right}) {
    final String property = 'padding';
    EdgeInsetsGeometry padding = EdgeInsets.all(0.0);

    if (all != null) {
      padding = EdgeInsets.all(all);
    } else if (horizontal != null || vertical != null) {
      padding = EdgeInsets.symmetric(
          horizontal: horizontal ?? 0.0, vertical: vertical ?? 0.0);
    } else if (top != null || bottom != null || left != null || right != null) {
      padding = EdgeInsets.only(
          top: top ?? 0.0,
          bottom: bottom ?? 0.0,
          left: left ?? 0.0,
          right: right ?? 0.0);
    }

    final Map output = {'property': property, 'style': padding};

    return output;
  }

  static Map margin(
      {double all,
      double horizontal,
      double vertical,
      double top,
      double bottom,
      double left,
      double right}) {
    final String property = 'margin';
    EdgeInsetsGeometry margin = EdgeInsets.all(0.0);

    if (all != null) {
      margin = EdgeInsets.all(all);
    } else if (horizontal != null || vertical != null) {
      margin = EdgeInsets.symmetric(
          horizontal: horizontal ?? 0.0, vertical: vertical ?? 0.0);
    } else if (top != null || bottom != null || left != null || right != null) {
      margin = EdgeInsets.only(
          top: top ?? 0.0,
          bottom: bottom ?? 0.0,
          left: left ?? 0.0,
          right: right ?? 0.0);
    }

    final Map output = {'property': property, 'style': margin};

    return output;
  }

  static Map backgroundColor({String hex, List rgba, Color color}) {
    final String property = 'backgroundColor';
    Color backgroundColor = Colors.transparent;

    if (hex != null) {
      backgroundColor = HexColor(hex);
    } else if (rgba != null && rgba.length == 4) {
      backgroundColor = Color.fromRGBO(rgba[0], rgba[1], rgba[2], rgba[3]);
    } else if (color != null) {
      backgroundColor = color;
    }

    final Map output = {'property': property, 'style': backgroundColor};

    return output;
  }

  static Map borderRadius(
      {double all,
      double topLeft,
      double topRight,
      double bottomLeft,
      double bottomRight}) {
    final String property = 'borderRadius';
    BorderRadiusGeometry borderRadius = BorderRadius.all(Radius.circular(0.0));

    if (all != null) {
      borderRadius = BorderRadius.all(Radius.circular(all));
    } else if (topLeft != null ||
        topRight != null ||
        bottomLeft != null ||
        bottomRight != null) {
      borderRadius = BorderRadius.only(
        topLeft: Radius.circular(topLeft ?? 0.0),
        topRight: Radius.circular(topRight ?? 0.0),
        bottomLeft: Radius.circular(bottomLeft ?? 0.0),
        bottomRight: Radius.circular(bottomRight ?? 0.0),
      );
    }

    final Map output = {
      'property': property,
      'style': borderRadius,
    };

    return output;
  }

  static Map boxShadow(
      {String hex,
      List rgba,
      Color color,
      double blur,
      List<double> offset,
      double spread}) {
    final String property = 'boxShadow';
    Offset finalOffset;
    Color finalColor;

    if (hex != null) {
      finalColor = HexColor(hex);
    } else if (rgba != null && rgba.length == 4) {
      finalColor = Color.fromRGBO(rgba[0], rgba[1], rgba[2], rgba[3]);
    } else if (color != null) {
      finalColor = color;
    }

    if (offset.length == 1) {
      finalOffset = Offset(offset[0], offset[0]);
    } else if (offset.length == 2) {
      finalOffset = Offset(offset[0], offset[1]);
    }

    List<BoxShadow> boxShadow = [
      BoxShadow(
          color: finalColor ?? const Color(0xFF000000),
          blurRadius: blur ?? 0.0,
          spreadRadius: spread ?? 0.0,
          offset: finalOffset ?? Offset(0.0, 0.0))
    ];

    final Map output = {'property': property, 'style': boxShadow};

    return output;
  }

  static Map width(double width) {
    final Map output = {
      'property': 'width',
      'style': width ?? null,
    };
    return output;
  }

  static Map minWidth(double minWidth) {
    final Map output = {
      'property': 'minWidth',
      'style': minWidth ?? 0.0,
    };
    return output;
  }

  static Map maxWidth(double maxWidth) {
    final Map output = {
      'property': 'maxWidth',
      'style': maxWidth ?? double.infinity,
    };
    return output;
  }

  static Map height(double height) {
    final Map output = {
      'property': 'height',
      'style': height ?? null,
    };
    return output;
  }

  static Map minHeight(double minHeight) {
    final Map output = {
      'property': 'minHeight',
      'style': minHeight ?? 0.0,
    };
    return output;
  }

  static Map maxHeight(double maxHeight) {
    final Map output = {
      'property': 'maxHeight',
      'style': maxHeight ?? double.infinity,
    };
    return output;
  }

  // static Map animate({@required int duration, String curve, List only}) {
  //
  //   return {};
  // }
}
