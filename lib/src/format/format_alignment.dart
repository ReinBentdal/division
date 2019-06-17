import 'package:flutter/material.dart';

AlignmentGeometry formatAlignment(align) {
  AlignmentGeometry alignment;
  if (align is String) {
    switch (align) {
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
        throw ('Unsupported alignment String value $align');
        break;
    }
  } else if (align is List<double>) {
    if (align.length == 2) {
      alignment = Alignment(align[0], align[1]);
    } else {
      throw ('Unsupported alignment format $align. Expected [double dx, double dy]');
    }
  } else if (align is double) {
    alignment = Alignment(align, align);
  } else if (align is AlignmentGeometry) {
    alignment = align;
  } else {
    throw ('Unsuported alignment format $align');
  }
  return alignment;
}
