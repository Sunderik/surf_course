import 'package:flutter/material.dart';
import 'package:task_279830/core/theme/theme_constants.dart';

extension CustomIconTheme on IconThemeData {
  IconThemeData get selectableIcon {
    return const IconThemeData(size: 24, color: customGreen);
  }

  IconThemeData get unSelectableIcon {
    return const IconThemeData(size: 24, color: customVioletLight);
  }
}
