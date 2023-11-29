import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    final meIcon = SvgPicture.asset(AssetsWrapper.mePathIsSVG, semanticsLabel: 'me');
    final hobbyIcon = SvgPicture.asset(AssetsWrapper.hobbyPathIsSVG, semanticsLabel: 'hobby');
    final dartIcon = SvgPicture.asset(AssetsWrapper.dartPathIsSVG, semanticsLabel: 'dart');

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
                    icon: meIcon,
                    title: DataWrapper.aboutMeTitle,
                    content: DataWrapper.aboutMeContent,
                    titleTextStyle: Theme.of(context).textTheme.cimeroTitle,
                    contentTextStyle: Theme.of(context).textTheme.comfortContent,
                  ),
                  DescriptionArea(
                    icon: hobbyIcon,
                    title: DataWrapper.myHobbyTitle,
                    content: DataWrapper.myHobbyContent,
                    titleTextStyle: Theme.of(context).textTheme.cimeroTitle,
                    contentTextStyle: Theme.of(context).textTheme.comfortContent,
                  ),
                  DescriptionArea(
                    icon: dartIcon,
                    title: DataWrapper.experienceTitle,
                    content: DataWrapper.experienceContent,
                    titleTextStyle: Theme.of(context).textTheme.cimeroTitle,
                    contentTextStyle: Theme.of(context).textTheme.comfortContent,
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
