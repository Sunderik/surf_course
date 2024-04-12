import 'package:flutter/material.dart';
import 'package:task_281284/core/constants/strings_constants.dart';

/// Виджет отображения звезд на шаре предсказания
class StarsLoading extends StatelessWidget {
  /// Звезды на шаре предсказания
  const StarsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage(StringsConstants.ballStarsAssetPath),
    );
  }
}
