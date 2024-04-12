import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_281284/core/constants/strings_constants.dart';
import 'package:task_281284/core/domain/enums/screen_status_enum.dart';
import 'package:task_281284/features/home_screen/home_screen_widget_model.dart';
import 'package:task_281284/features/home_screen/widgets/fortune_ball_content.dart';

///Виджет шара предсказаний
class FortuneBall extends StatefulWidget {
  /// Шар предсказаний
  const FortuneBall({super.key});

  @override
  State<FortuneBall> createState() => _FortuneBallState();
}

class _FortuneBallState extends State<FortuneBall> {
  @override
  Widget build(BuildContext context) {
    final wm = Provider.of<HomeScreenWidgetModel>(context, listen: false);
    return SizedBox.square(
      dimension: 300,
      child: CircleAvatar(
        backgroundImage: const AssetImage(StringsConstants.ballAssetPath),
        child: StreamBuilder<ScreenStatusEnum>(
            stream: wm.screenStatusStream,
            builder: (context, snapshot) {
              return FortuneBallContentWrapper(status: wm.screenStatus);
            }),
      ),
    );
  }
}
