import 'package:flutter/material.dart';
import 'dart:math';

import 'style_item.dart';
import 'get_color.dart';

// A class containing all styling for the Division widget
class S {
  // Alignment of the Division widget
  //
  //  # Example
  //
  //
  //  S.align('topLeft')  - Possible values: 'center', 'top', 'bottom', 'left', 'right', 'topLeft', 'topRight', 'bottomLeft' and 'bottomRight'
  //
  //
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
      case 'topLeft':
        alignment = Alignment.topLeft;
        break;
      case 'topRight':
        alignment = Alignment.topRight;
        break;
      case 'bottomLeft':
        alignment = Alignment.bottomLeft;
        break;
      case 'bottomRight':
        alignment = Alignment.bottomRight;
        break;
      default:
        print('invalid S.align property');
        break;
    }

    return StyleItem(property: 'align', style: alignment);
  }

  // may implement this:
  // static StyleItem alignTop() => StyleItem(property: 'align', style: Alignment.topCenter);

  // Alignment of the Division child widget
  //
  //  # Example
  //
  //  S.alignChild('topLeft') - Possible values: 'center', 'top', 'bottom', 'left', 'right', 'topLeft', 'topRight', 'bottomLeft' and 'bottomRight'
  //
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
      case 'topLeft':
        alignment = Alignment.topLeft;
        break;
      case 'topRight':
        alignment = Alignment.topRight;
        break;
      case 'bottomLeft':
        alignment = Alignment.bottomLeft;
        break;
      case 'bottomRight':
        alignment = Alignment.bottomRight;
        break;
      default:
        print('invalid S.alignChild property');
        break;
    }

    return StyleItem(property: 'alignChild', style: alignment);
  }

  // Padding for the Division widget
  //
  //  # Example
  //
  //  S.padding(top: 20.0, left: 5.0) or
  //  S.padding(horizontal: 10.0, vertical: 20.0) or
  //  S.padding(all: 10.0)
  //
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

  // # Example
  //
  //  S.margin(top: 20.0, left: 5.0) or
  //  S.margin(horizontal: 10.0, vertical: 20.0) or
  //  S.margin(all: 10.0)
  //
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

  // # Example
  //
  //  S.backgroundColor(hex: 'f5f5f5') or
  //  S.backgroundColor(hex: '#f5f5f5') or
  //  S.backgroundColor(rgba: [34, 52, 16, 0.5]) or
  //  S.backgroundColor(color: Colors.teal)
  //
  static StyleItem backgroundColor({String hex, List rgba, Color color}) {
    Color backgroundColor = getColor(hex: hex, rgba: rgba, color: color);
    if (backgroundColor == null) {
      backgroundColor = Color(0xFFEEEEEE);
    }

    return StyleItem(property: 'backgroundColor', style: backgroundColor);
  }

  //  # Example
  //
  //  S.borderRadius(all: 30.0) or
  //  S.borderRadius(topLeft: 5.0, topRight: 10.0, bottomLeft: 5.0, bottomRight: 10.0)
  //
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

  //  # Example
  //
  //  S.boxShadow(
  //    hex: 'eeeeee',
  //    blur: 20.0,
  //    spread: 10.0,
  //    offset: [0.0, 10.0] - the first index is the x value and the second is the y value
  //  ),
  //
  static StyleItem boxShadow(
      {String hex,
      List rgba,
      Color color,
      double blur,
      List<double> offset,
      double spread}) {
    Offset finalOffset;
    Color shadowColor = getColor(hex: hex, rgba: rgba, color: color);

    if (offset.length == 1) {
      finalOffset = Offset(offset[0], offset[0]);
    } else if (offset.length == 2) {
      finalOffset = Offset(offset[0], offset[1]);
    }

    List<BoxShadow> boxShadow = [
      BoxShadow(
          color: shadowColor ?? const Color(0xFF000000).withOpacity(0.2),
          blurRadius: blur ?? 0.0,
          spreadRadius: spread ?? 0.0,
          offset: finalOffset ?? Offset(0.0, 0.0))
    ];

    return StyleItem(property: 'boxShadow', style: boxShadow);
  }

  //  A prebuilt boxShadow method for fast standarised presets
  //  It is recomended to not use values higher than 50.0. The lowest allowed value is 0.0 (Which will give no shadow)
  //
  //  # Example
  //
  //  S.elevation(10.0)
  //
  static StyleItem elevation(double elevation,
      {bool angled = false,
      String hex,
      List rgba,
      Color color = Colors.black}) {
    if (elevation < 0) {
      return null;
    }
    final double offsetX = angled ? elevation : 0.0;
    final double offsetY = elevation;
    final double spread = 0.0;
    final double blur = elevation;

    //custom curve defining the opacity
    double opacity = 0.2 - (sqrt(elevation) / 90);

    //prevent negative values for the opacity
    if (opacity < 0.0) {
      opacity = 0.0;
    }

    //find which color format used: hex, rgba or color
    final Color shadowColor =
        getColor(hex: hex, rgba: rgba, color: color).withOpacity(opacity);

    final List<BoxShadow> boxShadow = [
      BoxShadow(
          color: shadowColor ?? Colors.black.withOpacity(0.2),
          blurRadius: blur,
          spreadRadius: spread,
          offset: Offset(offsetX, offsetY))
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
    return StyleItem(
        property: 'maxHeight', style: maxHeight ?? double.infinity);
  }

  static StyleItem scale(double scale) {
    return StyleItem(property: 'scale', style: scale);
  }

  static StyleItem offset(double dx, double dy) {
    return StyleItem(property: 'offset', style: Offset(dx, dy));
  }

  static StyleItem rotate(double rotate) {
    return StyleItem(property: 'rotate', style: rotate);
  }
}