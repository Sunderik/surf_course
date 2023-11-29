import 'package:flutter/material.dart';
import 'package:task_283813/core/core.dart';

/// Виджет уровня развития навыка
class SkillRating extends StatefulWidget {
  /// Наименование  навыка
  final String name;

  /// Уровень развития навыка от 0 до 5
  final int value;

  const SkillRating({super.key, required this.name, required this.value}) : assert(value >= 0 && value <= 5);

  @override
  State<SkillRating> createState() => _SkillRatingState();
}

class _SkillRatingState extends State<SkillRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.name,
          style: Theme.of(context).textTheme.cimeroContent,
        ),
        RatingString(
          value: widget.value,
        ),
      ],
    );
  }
}
