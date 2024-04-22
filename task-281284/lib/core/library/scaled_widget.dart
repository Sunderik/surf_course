import 'package:flutter/material.dart';
import 'package:task_281284/core/constants/durations_constants.dart';

/// Виджет оболочка анимации изменения размера
class ScaledWidget extends StatefulWidget {
  /// Дочерний виджет, размер которого будет изменяться
  final Widget child;

  const ScaledWidget({super.key, required this.child});

  @override
  State<ScaledWidget> createState() => _ScaledWidgetState();
}

/// Состояние виджета оболочка анимации изменения размера
class _ScaledWidgetState extends State<ScaledWidget> with SingleTickerProviderStateMixin {
  /// Контроллер анимации изменения размера
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: DurationConstants.extend,
  )..repeat(reverse: true);

  ///Анимация изменения размера
  late final Animation<double> _animation = Tween(begin: 0.3, end: 0.5).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _animation, child: widget.child);
  }
}
