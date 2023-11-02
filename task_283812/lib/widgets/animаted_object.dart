import 'package:flutter/material.dart';

/// Виджет объекта над которым производится анимация
class AnimatedObject extends StatelessWidget {
  /// Цвет в который выкрашивается объект
  final Color color;

  const AnimatedObject({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      'assets/yin_yang.png',
      color: color,
      fit: BoxFit.fill,
    ));
  }
}
