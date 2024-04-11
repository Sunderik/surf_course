import 'package:flutter/material.dart';

class ScaledWidget extends StatefulWidget {
  final Widget child;

  const ScaledWidget({super.key, required this.child});

  @override
  State<ScaledWidget> createState() => _ScaledWidgetState();
}

class _ScaledWidgetState extends State<ScaledWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);
  late final Animation<double> _animation = Tween(begin: 0.3, end: 0.5).animate(_controller);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _animation, child: widget.child);
  }
}
