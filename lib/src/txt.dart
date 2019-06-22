import 'package:flutter/material.dart';

import 'format/format_color.dart';

class Txt {
  Txt([this.string]);

  final String string;
  Color _color;
  Color _backgroundColor;
  FontWeight _weight;
  FontStyle _style;
  double _size;
  TextBaseline _baseline;

  Txt color(dynamic c) {
    _color = formatColor(c);
    return this;
  }

  Txt backgroundColor(dynamic c) {
    _backgroundColor = formatColor(c);
    return this;
  }

  Txt weight(FontWeight w) {
    _weight = w;
    return this;
  }

  Txt style(FontStyle s) {
    _style = s;
    return this;
  }

  Txt size(double s) {
    _size = s;
    return this;
  }

  Txt baseline(TextBaseline b) {
    _baseline = b;
    return this;
  }

  Text build() {
    return _builtWidget();
  }

  Text _builtWidget() {
    return Text(
      string, 
      style: TextStyle(
        color: _color,
        backgroundColor: _backgroundColor,
        fontSize: _size,
        fontWeight: _weight,
        fontStyle: _style,
        textBaseline: _baseline,
      ),
    );
  }
}
