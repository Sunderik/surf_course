import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_283812/widgets/animated_object_interactive_container.dart';

/// Константа максимального количества оборотов
///
/// Используется также для указания времени анимации, чтобы получался один оборот в секунду.
const double _maxRotatingCount = 1000.0;

/// Константа стороны контейнера объекта анимации при инициализации
const double baseContainerSideSize = 100.0;

/// Виджет обертки объекта анимации
class AnimatedObjectWrapper extends StatefulWidget {
  /// Признак, что при обновлении состояния нужно трансформировать контейнер
  final bool needTransformWidget;

  /// Признак, что при обновлении состояния нужно запустить или остановить вращение контейнера
  final bool needRotateWidget;

  const AnimatedObjectWrapper({super.key, this.needTransformWidget = false, this.needRotateWidget = false});

  @override
  State<AnimatedObjectWrapper> createState() => _AnimatedObjectWrapperState();
}

/// Состояние виджета объекта анимации
class _AnimatedObjectWrapperState extends State<AnimatedObjectWrapper> with SingleTickerProviderStateMixin {
  /// Сторона объекта анимации
  late double _sideSize;

  /// Цвет объекта анимации
  late Color _color;

  /// Анимация вращения контейнера объекта анимации
  late Animation<double> animation;

  /// Контроллер анимации вращения контейнера объекта анимации
  late AnimationController _rotateController;

  /// Вызывается при инициализации виджета
  @override
  void initState() {
    super.initState();
    // При инициализации задаем базовый размер контейнера объекта анимации
    _sideSize = baseContainerSideSize;
    // При инициализации задаем базовый цвет объекта анимации
    _color = Colors.blue;
    // Инициализируем контроллер
    _rotateController = AnimationController(
      duration: Duration(seconds: _maxRotatingCount.toInt()),
      vsync: this,
    );
    // Инициализируем анимацию ( от константы до нуля, чтобы крутилось против часовой стрелки)
    animation = Tween<double>(begin: _maxRotatingCount, end: 0.0).animate(_rotateController);
  }

  /// Вызывается когда виджет уже создан, но родитель требуется его пересобрать.
  ///
  /// Вызывается на действия GestureDetector-a из родительского виджета.
  @override
  void didUpdateWidget(AnimatedObjectWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Если изменение требует трансформации контейнера объекта анимации
    if (widget.needTransformWidget) _generateRandomTransformParams();

    // Если изменение требует запуска/остановки вращения контейнера объекта анимации
    if (widget.needRotateWidget) {
      // Если анимация уже завершалась сбрасываем ее состояние
      if (_rotateController.isCompleted) {
        _rotateController.reset();
      }
      // Запускаем анимацию вращения
      _rotateController.forward();
    } else {
      // Если анимация в текущий момент запущена, то останавливаем ее.
      if (_rotateController.isAnimating) {
        _rotateController.stop();
      }
    }
  }

  /// Вызывается когда виджет пропадает из дерева виджетов.
  @override
  void dispose() {
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation,
      child: AnimatedObjectInteractiveContainer(
        height: _sideSize,
        width: _sideSize,
        color: _color,
      ),
    );
  }

  /// Генерирует случайные значение размера контейнера объекта анимации и записывает в [_sideSize],
  /// а так же случайно выбирает новый цвет объекта анимации и записывает в [_color]
  void _generateRandomTransformParams() {
    // Создаем генератор случайных чисел
    final random = Random();
    //Ограничиваем случайное значение рамками 50 <= random <= 200
    _sideSize = random.nextDouble() * 201.0;

    if (_sideSize < 50.0) {
      _sideSize = 50.0;
    }
    // Определяем случайный цвет
    _color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }
}
