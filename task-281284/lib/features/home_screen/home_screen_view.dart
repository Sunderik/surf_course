import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_281284/core/library/flying_widget.dart';
import 'package:task_281284/core/library/scaled_widget.dart';
import 'package:task_281284/features/home_screen/home_screen_widget_model.dart';
import 'package:task_281284/features/home_screen/widgets/main_hint.dart';

import 'widgets/fortune_ball.dart';

const baseDuration = Duration(milliseconds: 300);

/// Виджет окна галереи изображений
class HomeScreenView extends StatelessWidget {
  ///Окно галереи изображений
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final wm = Provider.of<HomeScreenWidgetModel>(context, listen: false);
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
                Color(0xff08070f),
                Color(0xff000000),
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: Center(
            child: Stack(alignment: Alignment.center, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FlyingWidget(
                    child: FortuneBall(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: ScaledWidget(
                      child: Image.asset('assets/magic_ball_shadow.png'),
                    ),
                  ),
                ],
              ),
              const Positioned(
                bottom: 40,
                child: MainHint(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
