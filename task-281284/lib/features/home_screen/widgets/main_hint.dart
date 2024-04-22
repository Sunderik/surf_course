import 'package:flutter/material.dart';
import 'package:task_281284/core/constants/strings_constants.dart';
import 'package:task_281284/core/theme/extensions/text_extensions.dart';

/// Виджет центровки основного текста окна
class MainHint extends StatelessWidget {
  const MainHint({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: _Text(),
    );
  }
}

/// Виджет подбора текста для отображения
class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    String? firstPart = StringsConstants.hintFirstPart;
    String? secondPart = StringsConstants.hintSecondPart;
    final hintTheme = Theme.of(context).textTheme.hintTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstPart, style: hintTheme),
        Text(secondPart, style: hintTheme),
      ],
    );
  }
}
