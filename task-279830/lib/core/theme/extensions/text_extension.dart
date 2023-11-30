import 'package:flutter/material.dart';
import 'package:task_279830/core/theme/theme_constants.dart';

extension CustomTextTheme on TextTheme {
  TextStyle get customCaption {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 10.0,
      color: customVioletLight,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get customIconTitle {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 10.0,
      color: customVioletLight,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.24,
    );
  }

  TextStyle get customText {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 12.0,
      color: customVioletLight,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get customTextBold {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 12.0,
      color: customVioletLight,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get customSubtitle {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 16.0,
      color: customVioletLight,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get customSubtitleBold {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 16.0,
      color: customVioletLight,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get customTitle {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 18.0,
      color: customVioletLight,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get customTitleBold {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 18.0,
      color: customVioletLight,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get customLargeTitle {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 20.0,
      color: customVioletLight,
      fontWeight: FontWeight.w700,
    );
  }
}
