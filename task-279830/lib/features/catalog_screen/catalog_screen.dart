import 'package:flutter/material.dart';
import 'package:task_279830/core/domain/enums/pages_enum.dart';
import 'package:task_279830/core/library/demo_screen.dart';

/// Виджет экрана каталога товаров
class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScreen(title: ScreensEnum.catalog.name);
  }
}
