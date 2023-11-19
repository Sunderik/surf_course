import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

/// Обертка для работы с асетами
class AssetsWrapper {
  /// Изображение "автара"
  static const AssetImage avatar = AssetImage('assets/images/avatar.jpg');

  ///SVG изображение "куска угля"
  static SvgPicture coal = SvgPicture.asset('assets/images/coal.svg', semanticsLabel: 'coal');

  ///SVG изображение "я"
  static SvgPicture me = SvgPicture.asset('assets/images/me.svg', semanticsLabel: 'me');

  ///SVG изображение "дротика и цели"
  static SvgPicture dart = SvgPicture.asset('assets/images/dart.svg', semanticsLabel: 'dart');

  ///SVG изображение "хобби"
  static SvgPicture hobby = SvgPicture.asset('assets/images/hobby.svg', semanticsLabel: 'hobby');

  ///Анимированное изображение для Rive "огонь"
  static const RiveAnimation fire = RiveAnimation.asset('assets/rives/fire.riv');
}
