import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_281284/core/constants/durations_constants.dart';
import 'package:task_281284/core/domain/enums/screen_status_enum.dart';
import 'package:task_281284/features/home_screen/home_screen_widget_model.dart';
import 'package:task_281284/features/home_screen/widgets/prediction_container.dart';
import 'package:task_281284/features/home_screen/widgets/stars_loading.dart';

/// Виджет оболочка для содержимого шара предсказаний
class FortuneBallContentWrapper extends StatefulWidget {
  /// Статус окна
  final ScreenStatusEnum status;

  ///Оболочка для содержимого шара предсказаний
  const FortuneBallContentWrapper({super.key, required this.status});

  @override
  State<FortuneBallContentWrapper> createState() => _FortuneBallContentWrapperState();
}

class _FortuneBallContentWrapperState extends State<FortuneBallContentWrapper> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        duration: DurationConstants.base,
        child: LayoutBuilder(
            key: ValueKey('layoutBldr-${widget.status.name}'),
            builder: (context, constraints) {
              return SizedBox.square(
                  dimension: constraints.maxHeight - 15, child: _FortuneBallContent(status: widget.status));
            }),
      ),
    );
  }
}

/// Виджет  я содержимого шара предсказаний
class _FortuneBallContent extends StatelessWidget {
  /// Статус окна
  final ScreenStatusEnum status;

  ///Содержимое шара предсказаний
  const _FortuneBallContent({required this.status});

  @override
  Widget build(BuildContext context) {
    final wm = Provider.of<HomeScreenWidgetModel>(context, listen: false);

    switch (status) {
      case ScreenStatusEnum.wait:
      case ScreenStatusEnum.error:
        {
          return PredictionContainer(
            message: wm.currentPrediction?.message ?? '',
            isError: status == ScreenStatusEnum.error,
          );
        }
      case ScreenStatusEnum.loading:
        {
          return const StarsLoading();
        }
      case ScreenStatusEnum.init:
      default:
        {
          return const SizedBox.shrink();
        }
    }
  }
}
