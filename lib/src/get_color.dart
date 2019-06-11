import 'package:flutter/material.dart';

import 'hex_color.dart';

//takes different styles of color inputs, finds out which is uesd and returns it as a color
Color getColor({@required String hex, @required List rgba, @required Color color}) {
  Color finalColor;
  if (hex != null) {
      finalColor = HexColor(hex);
    } else if (rgba != null && rgba.length == 4) {
      finalColor = Color.fromRGBO(rgba[0].toInt() ?? 0, rgba[1].toInt() ?? 0, rgba[2].toInt() ?? 0, rgba[3].toDouble() ?? 1);
    } else if (color != null) {
      finalColor = color;
    }
  return finalColor;
}