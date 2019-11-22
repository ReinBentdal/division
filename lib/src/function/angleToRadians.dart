import 'dart:math';

import '../style.dart';

double angleToRadians(double value, AngleFormat angleFormat) {
  if (angleFormat == AngleFormat.radians)
    return value;
  else if (angleFormat == AngleFormat.cycles)
    return value * 2 * pi;
  else if (angleFormat == AngleFormat.degree) return (value / 360) * 2 * pi;

  return null;
}
