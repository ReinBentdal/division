import 'package:flutter/material.dart';

import '../functions/hex_color.dart';
import '../model/style_item.dart';

// A class containing all styling for the Division widget
class S {
  // Alignment of the Division widget
  // Desired: S.align.topLeft
  static StyleItem align(String alignmentInput) {
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

    return StyleItem(property: 'align', style: alignment);
  }

  // Alignment of the Division child widget
  static StyleItem alignChild(String alignmentInput) {
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

    return StyleItem(property: 'alignChild', style: alignment);
  }

  static StyleItem padding(
      {double all,
      double horizontal,
      double vertical,
      double top,
      double bottom,
      double left,
      double right}) {
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

    return StyleItem(property: 'padding', style: padding);
  }

  static StyleItem margin(
      {double all,
      double horizontal,
      double vertical,
      double top,
      double bottom,
      double left,
      double right}) {
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

    return StyleItem(property: 'margin', style: margin);
  }

  static StyleItem backgroundColor({String hex, List rgba, Color color}) {
    Color backgroundColor = Colors.transparent;

    if (hex != null) {
      backgroundColor = HexColor(hex);
    } else if (rgba != null && rgba.length == 4) {
      backgroundColor = Color.fromRGBO(rgba[0], rgba[1], rgba[2], rgba[3]);
    } else if (color != null) {
      backgroundColor = color;
    }

    return StyleItem(property: 'backgroundColor', style: backgroundColor);
  }

  static StyleItem borderRadius(
      {double all,
      double topLeft,
      double topRight,
      double bottomLeft,
      double bottomRight}) {
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

    return StyleItem(property: 'borderRadius', style: borderRadius);
  }

  static StyleItem boxShadow(
      {String hex,
      List rgba,
      Color color,
      double blur,
      List<double> offset,
      double spread}) {
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

    return StyleItem(property: 'boxShadow', style: boxShadow);
  }

  static StyleItem width(double width) {
    return StyleItem(property: 'width', style: width ?? null);
  }

  static StyleItem minWidth(double minWidth) {
    return StyleItem(property: 'minWidth', style: minWidth ?? 0.0);
  }

  static StyleItem maxWidth(double maxWidth) {
    return StyleItem(property: 'maxWidth', style: maxWidth ?? double.infinity);
  }

  static StyleItem height(double height) {
    return StyleItem(property: 'height', style: height ?? null);
  }

  static StyleItem minHeight(double minHeight) {
    return StyleItem(property: 'minHeight', style: minHeight ?? 0.0);
  }

  static StyleItem maxHeight(double maxHeight) {
    return StyleItem(property: 'maxHeight', style: maxHeight ?? double.infinity);
  }
}