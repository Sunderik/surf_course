import 'package:flutter/material.dart';
import 'package:task_280398/core/constants/colors_constants.dart';
import 'package:task_280398/core/constants/strings_constants.dart';
import 'package:task_280398/core/theme/text_extension.dart';

/// Виджет аватара пользователя
class Avatar extends StatelessWidget {
  /// Радиус аватара ( по умолчанию 40)
  final double radius;

  /// Поставщик изображения аватара
  final ImageProvider avatar;

  const Avatar({super.key, this.radius = 40, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: radius,
              backgroundImage: avatar,
            ),
            CircleAvatar(
              radius: radius,
              backgroundColor: Colors.black.withOpacity(0.4),
              foregroundColor: AppColors.appWhite,
              child: Center(
                child: Text(StringsConstants.editButtonName, style: Theme.of(context).textTheme.customCaption),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
