import 'package:flutter/material.dart';
import '../function/hex_color.dart';

Color formatColor(dynamic color, {bool acceptNull = false}) {
  Color formattedColor;
  if (color is Color) {
    formattedColor = color;
  } else if (color is String) {
    formattedColor = HexColor(color);
  } else if (color is List<dynamic>) {
    if (color.length == 4) {
      if (color[0] is int &&
          color[1] is int &&
          color[2] is int &&
          color[3] is double) {
        print(
            'The color format [int, int, int, double] is deprectaed. Use rgba(int, int, int, double) instead');
        formattedColor = Color.fromRGBO(color[0], color[1], color[2], color[3]);
      } else {
        throw ('Unsupported rgba color format. Expected [int, int, int, double] but recieved $color');
      }
    }
    if (color.length == 3) {
      if (color is List<int>) {
        print(
            'The color format [int, int, int] is deprectaed. Use rgba(int, int, int) instead');
        formattedColor = Color.fromRGBO(color[0], color[1], color[2], 1);
      } else {
        throw ('Unsupported rgb color format. Expected [int, int, int] but recieved $color');
      }
    }
  } else if (color == null && acceptNull == true) {
    // do nothing: return null
  } else {
    throw ('Unsupported color format $color');
  }
  return formattedColor;
}
