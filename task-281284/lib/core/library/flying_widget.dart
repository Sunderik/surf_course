import 'package:flutter/material.dart';
import 'package:task_281284/core/constants/durations_constants.dart';

/// Виджет оболочка анимации парения
class FlyingWidget extends StatefulWidget {
  /// Дочерний виджет который будет парить
  final Widget child;

  /// Обработчик нажатия на виджет
  final VoidCallback onTap;

  const FlyingWidget({super.key, required this.child, required this.onTap});

  @override
  State<FlyingWidget> createState() => _FlyingWidgetState();
}

/// Состояние виджета оболочка анимации парения
class _FlyingWidgetState extends State<FlyingWidget> with SingleTickerProviderStateMixin {
  /// Контроллер анимации парения
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: DurationConstants.extend,
  )..repeat(reverse: true);

  /// Анимация парения
  late final Animation<Offset> _animation = Tween(begin: Offset.zero, end: const Offset(0, 0.15)).animate(_controller);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: GestureDetector(onTap: widget.onTap, child: widget.child),
    );
  }
}
