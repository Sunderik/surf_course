import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'package:task_281284/core/constants/assets_paths.dart';
import 'package:task_281284/core/constants/colors_constants.dart';
import 'package:task_281284/core/library/flying_widget.dart';
import 'package:task_281284/core/library/scaled_widget.dart';
import 'package:task_281284/features/home_screen/home_screen_widget_model.dart';
import 'package:task_281284/features/home_screen/widgets/main_hint.dart';

import 'widgets/fortune_ball.dart';

/// Виджет домашнего окна
class HomeScreenView extends StatefulWidget {
  /// Домашнее окно
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

/// Состояние виджета домашнего окна
class _HomeScreenViewState extends State<HomeScreenView> {
  /// Объект логики окна
  HomeScreenWidgetModel get wm => context.read<HomeScreenWidgetModel>();

  /// Объект отслеживания встряски
  late ShakeDetector detector;

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.waitForStart(onPhoneShake: wm.getPrediction)..startListening();
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: GradientsConstants.appBackground),
          child: Center(
            child: Stack(alignment: Alignment.center, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlyingWidget(
                    onTap: wm.getPrediction,
                    child: const FortuneBall(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: ScaledWidget(
                      child: Image.asset(AssetsPaths.ballShadowAssetPath),
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
