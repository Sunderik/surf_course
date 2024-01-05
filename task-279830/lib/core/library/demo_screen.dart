import 'package:flutter/material.dart';
import 'package:task_279830/core/theme/extensions/text_extension.dart';

/// Базовое сообщение экрана
const String _demoMessage = 'Здесь пока ничего нет';

/// Виджет экрана без логики
class DemoScreen extends StatelessWidget {
  final String title;

  const DemoScreen({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(_demoMessage, style: Theme.of(context).textTheme.customSubtitleDark),
      ),
    );
  }
}
