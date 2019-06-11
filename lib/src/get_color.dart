import 'package:flutter/material.dart';

import 'hex_color.dart';

//returns the color property that is valid. Hex is preffered, then rgba and last color
Color getColor(
    {@required String hex, @required List rgba, @required Color color}) {
  Color finalColor;
  if (hex != null) {
    finalColor = HexColor(hex);
  } else if (rgba != null && rgba.length == 4) {
    finalColor = Color.fromRGBO(rgba[0].toInt() ?? 0, rgba[1].toInt() ?? 0,
        rgba[2].toInt() ?? 0, rgba[3].toDouble() ?? 1);
  } else if (color != null) {
    finalColor = color;
  }
  return finalColor;
}
