import 'package:flutter/material.dart';
import 'package:task_279830/core/theme/color_constants.dart';

/// Расширение для темы приложения с добавлением кастомных стилей текста
extension CustomTextTheme on TextTheme {
  TextStyle get customCaption {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 10.0,
      color: customVioletLight,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get customCaptionDark {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 10.0,
      color: customVioletDark,
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

  TextStyle get customIconTitleDark {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 10.0,
      color: customVioletDark,
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

  TextStyle get customTextDark {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 12.0,
      color: customVioletDark,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get customCrossedText {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 12.0,
      color: customTextGrey,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.lineThrough,
      decorationColor: customTextGrey,
      decorationThickness: 2,
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

  TextStyle get customTextBoldDark {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 12.0,
      color: customVioletDark,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get customTextBoldRed {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 12.0,
      color: customTextRed,
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

  TextStyle get customSubtitleDark {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 16.0,
      color: customVioletDark,
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

  TextStyle get customSubtitleBoldDark {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 16.0,
      color: customVioletDark,
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

  TextStyle get customTitleDark {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 18.0,
      color: customVioletDark,
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

  TextStyle get customTitleBoldDark {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 18.0,
      color: customVioletDark,
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

  TextStyle get customLargeDark {
    return const TextStyle(
      fontFamily: 'Sora',
      fontSize: 20.0,
      color: customVioletDark,
      fontWeight: FontWeight.w700,
    );
  }
}
