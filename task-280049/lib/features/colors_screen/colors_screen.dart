import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280049/core/core.dart';
import 'package:task_280049/features/colors_screen/colors_screen_view.dart';
import 'package:task_280049/features/colors_screen/colors_screen_widget_model.dart';

/// Виджет экрана палитры доступных цветов
class ColorsScreen extends StatelessWidget {
  /// Экран палитры доступных цветов
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorsStateModel>(builder: (_, colorState, child) {
      return Provider<ColorsScreenWidgetModel>(
        create: (_) => ColorsScreenWidgetModel(state: colorState)..init(),
        dispose: (_, wm) => wm.dispose(),
        child: const ColorsScreenView(),
      );
    });
  }
}
