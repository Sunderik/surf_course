import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280049/core/core.dart';
import 'package:task_280049/features/color_details_screen/color_details_screen_widget_model.dart';
import 'package:task_280049/features/color_details_screen/widgets/color_data.dart';
import 'package:task_280049/features/color_details_screen/widgets/color_deatails_screen_app_bar.dart';

/// Виджет экрана информации о цвете
class ColorDetailsScreenView extends StatelessWidget {
  /// Экран информации о цвете
  const ColorDetailsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetModel = Provider.of<ColorDetailsScreenWidgetModel>(context, listen: false);

    return StreamBuilder<ScreenStatusesEnum>(
        stream: widgetModel.screenStatusStream,
        builder: (context, snapshot) {
          final status = widgetModel.screenStatus;
          if (status == ScreenStatusesEnum.wait) {
            return const _ColorDetailsView();
          } else {
            // Тут можно бахнуть экран ошибки (при проверке на статус ошибки)
            return const SizedBox.shrink();
          }
        });
  }
}

/// Виджет всей информации о цвете
class _ColorDetailsView extends StatelessWidget {
  /// Вся информация о цвете
  const _ColorDetailsView();

  @override
  Widget build(BuildContext context) {
    final widgetModel = Provider.of<ColorDetailsScreenWidgetModel>(context, listen: false);

    return WillPopScope(
      onWillPop: () async => widgetModel.backNavigation(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const ColorDetailsScreenAppBar(),
          body: Center(
            child: Column(
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 318, maxWidth: double.maxFinite),
                    child: Center(
                      child: Container(
                        color: widgetModel.color.getColor(),
                      ),
                    ),
                  ),
                ),
                const ColorData(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
