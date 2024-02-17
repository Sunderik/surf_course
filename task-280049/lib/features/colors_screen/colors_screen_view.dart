import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280049/core/core.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';
import 'package:task_280049/features/colors_screen/colors_screen_widget_model.dart';
import 'package:task_280049/features/colors_screen/widgets/colors_grid.dart';
import 'package:task_280049/features/colors_screen/widgets/colors_screen_app_bar.dart';

/// Виджет экрана палитры цветов
class ColorsScreenView extends StatelessWidget {
  /// Экран палитры цветов
  const ColorsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetModel = Provider.of<ColorsScreenWidgetModel>(context, listen: false);

    return Scaffold(
      appBar: const ColorsScreenAppBar(),
      body: StreamBuilder<ScreenStatusesEnum>(
          stream: widgetModel.screenStatusStream,
          builder: (context, snapshot) {
            final status = widgetModel.screenStatus;

            if (status == ScreenStatusesEnum.init) {
              return const SizedBox.shrink();
            } else if (status == ScreenStatusesEnum.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (status == ScreenStatusesEnum.wait) {
              return StreamBuilder<List<ColorEntity>>(
                  stream: widgetModel.colorsStream,
                  builder: (context, snapshot) {
                    final colors = widgetModel.colors;
                    return ColorsGrid(colors: colors);
                  });
            } else {
              // Тут можно бахнуть экран ошибки
              return const Center(
                child: Text('OOPss'),
              );
            }
          }),
    );
  }
}
