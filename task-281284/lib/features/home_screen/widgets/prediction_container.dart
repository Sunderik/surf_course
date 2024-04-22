import 'package:flutter/material.dart';
import 'package:task_281284/core/constants/colors_constants.dart';
import 'package:task_281284/core/theme/extensions/text_extensions.dart';

/// Виджет контейнера с предсказанием
class PredictionContainer extends StatelessWidget {
  /// Предсказание
  final String message;

  /// Признак что это ошибка
  final bool isError;

  /// Контейнер  с предсказанием
  const PredictionContainer({super.key, required this.message, this.isError = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(radius: 1, stops: _getStops, colors: [
        if (isError)
          ..._getGradientForColor(ColorsConstants.messageErrorBackground)
        else
          ..._getGradientForColor(ColorsConstants.messageBackground),
      ])),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Text(
                message,
                style: Theme.of(context).textTheme.messageTheme,
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ),
      ),
    );
  }

  /// Список переходов для градиента
  List<double> get _getStops => [0.05, 0.15, 0.25, 0.35, 0.5];

  /// Сгенерировать цвета для градиента на основе [color]
  List<Color> _getGradientForColor(Color color) {
    return [color, color.withOpacity(0.75), color.withOpacity(0.55), color.withOpacity(0.25), Colors.transparent];
  }
}
