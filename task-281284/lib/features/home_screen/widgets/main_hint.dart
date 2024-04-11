import 'package:flutter/material.dart';

const _mainTextFirstPart = 'Нажмите на шар';

const _mainTextSecondPartForPhone = 'или потрясите телефон';

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
    String? firstPart = _mainTextFirstPart;
    String? secondPart = _mainTextSecondPartForPhone;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstPart, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white54)),
        Text(secondPart, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white54)),
      ],
    );
  }
}
