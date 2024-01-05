import 'package:flutter/material.dart';
import 'package:task_279830/core/domain/enums/pages_enum.dart';
import 'package:task_279830/core/library/demo_screen.dart';

/// Виджет экрана пользовательской корзины
class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScreen(title: ScreensEnum.basket.name);
  }
}
