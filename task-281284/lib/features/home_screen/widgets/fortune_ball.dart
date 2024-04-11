import 'package:flutter/material.dart';

class FortuneBall extends StatefulWidget {
  const FortuneBall({super.key});

  @override
  State<FortuneBall> createState() => _FortuneBallState();
}

class _FortuneBallState extends State<FortuneBall> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(
      dimension: 300,
      child: CircleAvatar(backgroundImage: AssetImage('assets/magic_ball.png')),
    );
  }
}
