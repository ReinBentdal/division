import 'package:flutter/material.dart';

import '../function/hex_color.dart';

class BackgroundModel {
  Color $color;
  double $blur;
  DecorationImage $image;

  /// BackgroundColor
  void color(Color color) {
    $color = color;
  }

  /// background color in the rgba format
  void rgba(int r, int g, int b, [double opacity = 1.0]) {
    $color = Color.fromRGBO(r, g, b, opacity);
  }

  /// Background color in the hex format
  /// ```dart
  /// background.hex('f5f5f5')
  /// ```
  void hex(String xxxxxx) {
    $color = HexColor(xxxxxx);
  }

  /// Blurs the background
  ///
  /// Frosted glass example:
  /// ```dart
  /// ..background.blur(10)
  /// ..background.rgba(255,255,255,0.15)
  /// ```
  /// Does not work together with `rotate()`.
  void blur(double blur) {
    if (blur < 0) throw ('Blur cannot be negative: $blur');
    $blur = blur;
  }

  /// Eighter the [url] or the [path] has to be specified.
  /// [url] is for network images and [path] is for local images.
  /// [path] trumps [url].
  ///
  /// ```dart
  /// ..backgroundImage(
  ///   url: 'path/to/image'
  ///   fit: BoxFit.cover
  /// )
  /// ```
  void image(
      {String url,
      String path,
      ImageProvider<dynamic> imageProveder,
      ColorFilter colorFilter,
      BoxFit fit,
      AlignmentGeometry alignment = Alignment.center,
      ImageRepeat repeat = ImageRepeat.noRepeat}) {
    if ((url ?? path ?? imageProveder) == null) throw ('Eighter the [imageProvider], [url] or the [path] has to be provided');

    ImageProvider<dynamic> image;
    if (imageProveder != null)
      image = imageProveder;
    else if (path != null)
      image = AssetImage(path);
    else
      image = NetworkImage(url);

    $image = DecorationImage(
      image: image,
      colorFilter: colorFilter,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
    );
  }
}
