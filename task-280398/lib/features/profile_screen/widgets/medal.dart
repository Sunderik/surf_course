import 'package:flutter/material.dart';
import 'package:task_280398/core/constants/strings_constants.dart';

/// Класс медали
abstract class Medal {
  /// Получить виджет отображающий медаль
  Widget getMedal();
}

/// Золотая медаль
class GoldMedal {
  Widget getMedal() => const _MedalWidget(medalTextIcon: StringsConstants.medalGold);
}

/// Серебрянная медаль
class SilverMedal {
  Widget getMedal() => const _MedalWidget(medalTextIcon: StringsConstants.medalSilver);
}

/// Бронзовая медаль
class BronzeMedal {
  Widget getMedal() => const _MedalWidget(medalTextIcon: StringsConstants.medalBronze);
}

/// Виджет медали
class _MedalWidget extends StatelessWidget {
  /// Эмодзи иконка медали поставляемая в виде текста.
  final String medalTextIcon;

  const _MedalWidget({required this.medalTextIcon});

  @override
  Widget build(BuildContext context) {
    return Text(
      medalTextIcon,
      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
    );
  }
}
