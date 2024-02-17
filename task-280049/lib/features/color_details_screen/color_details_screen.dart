import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280049/core/domain/models/colors_state_model.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';
import 'package:task_280049/features/color_details_screen/color_details_screen_view.dart';
import 'package:task_280049/features/color_details_screen/color_details_screen_widget_model.dart';

/// Виджет окна информации о цвете
class ColorDetailsScreen extends StatelessWidget {
  /// Цвет для отображения в окне
  final ColorEntity color;

  /// Окно информации о цвете
  const ColorDetailsScreen({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorsStateModel>(builder: (context, colorState, child) {
      return Provider<ColorDetailsScreenWidgetModel>(
        create: (_) => ColorDetailsScreenWidgetModel(color: color, state: colorState)..init(),
        dispose: (ctx, wm) => wm.dispose(),
        child: const ColorDetailsScreenView(),
      );
    });
  }
}
