import 'package:flutter/material.dart';

import 'hex_color.dart';

/// Returns [Color].
///
/// [r], [g] and [b] must not exceed 255.
///
/// ```dart
/// ..backgroundColor(rgb(34, 29, 189));
/// ```
Color rgb(int r, int g, int b) {
  return Color.fromRGBO(r, g, b, 1.0);
}

/// Returns [Color].
///
/// [r], [g] and [b] must not exceed 255.
///
/// ```dart
/// ..backgroundColor(rgba(34, 29, 189, 0.7));
/// ```
Color rgba(int r, int g, int b, double opacity) {
  return Color.fromRGBO(r, g, b, opacity);
}

Color hex(String xxxxxx) {
  return HexColor(xxxxxx);
}
