import 'dart:math';
import 'dart:ui';

class ColorUil {
  static randomColor() =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
}
