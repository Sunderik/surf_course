import 'package:flutter/material.dart';
import 'package:task_281284/core/library/hero_item.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = Tween<double>(begin: 5, end: 40).animate(_controller);

  late final AnimationController _controller2 = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  )..forward();
  late final Animation<double> _animation2 = CurvedAnimation(
    parent: _controller2,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xff120f2b),
                Color(0xff12102a),
                Color(0xff0d0b18),
                Color(0xff0b0915),
                Color(0xff080710),
                Color(0xff00000c),
                Color(0xff000000),
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: Stack(children: [
            HeroItem(
              child: Center(
                child: ScaleTransition(
                  scale: _animation,
                  child: const CircleAvatar(backgroundImage: AssetImage("assets/magic_ball.png")),
                ),
              ),
            ),
            FadeTransition(
              opacity: _animation2,
              child: Center(
                child: Container(
                  color: Colors.black54,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
