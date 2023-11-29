import 'package:flutter/material.dart';
import 'package:task_283813/core/widgets/rating/rating_widget.dart';

/// Виджет строки рейтинга, от 0 до 5, по умолчанию 0.
class RatingString extends StatelessWidget {
  /// Значение рейтинга
  final int value;

  const RatingString({super.key, this.value = 0}) : assert(value >= 0 && value <= 5);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) => RatingWidget(isActive: index < value)),
    );
  }
}
