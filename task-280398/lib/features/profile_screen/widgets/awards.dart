import 'package:flutter/material.dart';
import 'package:task_280398/core/constants/strings_constants.dart';
import 'package:task_280398/core/theme/text_extension.dart';
import 'package:task_280398/features/profile_screen/widgets/medal.dart';

/// Виджет наград пользователя (медальки)
class Awards extends StatelessWidget {
  const Awards({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            StringsConstants.awardsTitle,
            style: theme.textTheme.customNormal.copyWith(color: theme.colorScheme.tertiary),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 224,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GoldMedal().getMedal(),
                GoldMedal().getMedal(),
                BronzeMedal().getMedal(),
                SilverMedal().getMedal(),
                BronzeMedal().getMedal(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
