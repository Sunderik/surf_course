import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_283812/widgets/animated_object_wrapper.dart';

/// Виджет области анимации
class AnimationArea extends StatefulWidget {
  const AnimationArea({super.key});

  @override
  State<AnimationArea> createState() => _AnimationAreaState();
}

/// Состояние виджета области анимации
class _AnimationAreaState extends State<AnimationArea> {
  /// Признак того, что нужно запустить/остановить анимацию вращения контейнера объекта анимации, при пересборке виджета [AnimatedObjectWrapper].
  ///
  /// true - запустить анимацию
  ///
  /// false - остановить анимацию
  late bool _needRotateWidget;

  /// Признак того, что нужно вызвать анимацию трансформации контейнера объекта анимации, при пересборке виджета [AnimatedObjectWrapper].
  late bool _needTransformWidget;

  /// Отступ от верхней границы области анимации при позиционировании виджета
  double? _top;

  /// Отступ от левой границы области анимации при позиционировании виджета
  double? _left;

  @override
  void initState() {
    super.initState();
    _needRotateWidget = false;
    _needTransformWidget = false;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // При инициализации области центруем контейнер объекта анимации
      if (_left == null && _top == null) {
        _left = constraints.maxWidth / 2 - baseContainerSideSize / 2;
        _top = constraints.maxHeight / 2 - baseContainerSideSize / 2;
      }

      return Stack(
        children: [
          const Center(
            child: Column(
              children: [
                SizedBox(height: 25),
                Text('Нажми, чтобы изменить размер и цвет!'),
                SizedBox(height: 5),
                Text('Удерживай, чтобы повернуть!'),
                SizedBox(height: 5),
                Text('Тяни, чтобы переместить!'),
              ],
            ),
          ),
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              onPanUpdate: (details) {
                // Событие переноса виджета, используем для перемещения контейнера объекта анимации внутри области анимации
                _top = max(0, _top! + details.delta.dy);
                _left = max(0, _left! + details.delta.dx);
                setState(() {
                  _needTransformWidget = false;
                  _needRotateWidget = false;
                });
              },
              onTap: () {
                // Событие трансформации контейнера объекта анимации. Заставляем контейнер объекта анимации
                // пересобраться с соответствующим флагом
                setState(() {
                  _needTransformWidget = true;
                  _needRotateWidget = false;
                });
              },
              onLongPressStart: (details) {
                // Событие начала вращения контейнера объекта анимации. Заставляем контейнер объекта анимации
                // пересобраться с соответствующим флагом
                setState(() {
                  _needTransformWidget = false;
                  _needRotateWidget = true;
                });
              },
              onLongPressEnd: (details) {
                // Событие завершения вращения контейнера объекта анимации. Заставляем контейнер объекта анимации
                // пересобраться с соответствующим флагом
                setState(() {
                  _needTransformWidget = false;
                  _needRotateWidget = false;
                });
              },
              child: AnimatedObjectWrapper(
                needTransformWidget: _needTransformWidget,
                needRotateWidget: _needRotateWidget,
              ),
            ),
          ),
        ],
      );
    });
  }
}
