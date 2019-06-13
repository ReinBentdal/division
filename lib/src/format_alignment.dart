import 'package:flutter/material.dart';

AlignmentGeometry formatAlignment(alignmentInput) {
  AlignmentGeometry alignment = Alignment.center;
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
      print('invalid S.align property. Defaults to Alignment.center');
      break;
  }
  return alignment;
}
