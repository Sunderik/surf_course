import 'package:flutter/material.dart';
import 'package:task_283813/core/core.dart';
import 'package:task_283813/features/screens/landing_page/widgets/base_info_area.dart';

/// Виджет страницы визитки.
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 800,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const BaseInfoArea(),
                  DescriptionArea(
                    icon: AssetsWrapper.me,
                    title: DataWrapper.aboutMeTitle,
                    content: DataWrapper.aboutMeContent,
                    titleTextStyle: FontsWrapper.cimeroTextStyle,
                    contentTextStyle: FontsWrapper.comforteTextStyle,
                  ),
                  DescriptionArea(
                    icon: AssetsWrapper.hobby,
                    title: DataWrapper.myHobbyTitle,
                    content: DataWrapper.myHobbyContent,
                    titleTextStyle: FontsWrapper.cimeroTextStyle,
                    contentTextStyle: FontsWrapper.comforteTextStyle,
                  ),
                  DescriptionArea(
                    icon: AssetsWrapper.dart,
                    title: DataWrapper.experienceTitle,
                    content: DataWrapper.experienceContent,
                    titleTextStyle: FontsWrapper.cimeroTextStyle,
                    contentTextStyle: FontsWrapper.comforteTextStyle,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
