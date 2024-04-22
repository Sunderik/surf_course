import 'package:flutter/material.dart';

/// Цветовые константы приложения
class ColorsConstants {
  static const Color appBackground = Color(0xff100C2C);
  static const Color messageBackground = Color(0xff000002);
  static const Color messageErrorBackground = Color(0xffd70b0b);

  static const Color appText = Color(0xffFFFFFF);
  static const Color appHint = Color(0xff727272);
}

/// Константы градиентов приложения
class GradientsConstants {
  static const Gradient appBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      ColorsConstants.appBackground,
      ColorsConstants.messageBackground,
    ],
    tileMode: TileMode.clamp,
  );

  static List<Color> _getGradientForColor(Color color) {
    return [color, color.withOpacity(0.75), color.withOpacity(0.55), color.withOpacity(0.25), Colors.transparent];
  }
}
