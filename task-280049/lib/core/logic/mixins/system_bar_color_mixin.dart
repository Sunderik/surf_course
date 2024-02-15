import 'package:flutter/services.dart';

mixin SystemBarColorMixin {
  setSystemBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: color.computeLuminance() < 0.5 ? Brightness.light : Brightness.dark,
        statusBarBrightness: color.computeLuminance() < 0.5 ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
