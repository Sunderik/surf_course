import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280049/core/core.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';
import 'package:task_280049/core/theme/extensions/color_extension.dart';
import 'package:task_280049/core/theme/extensions/text_extension.dart';
import 'package:task_280049/features/color_details_screen/color_details_screen_widget_model.dart';
import 'package:task_280049/features/color_details_screen/widgets/color_deatails_screen_app_bar.dart';
import 'package:task_280049/features/color_details_screen/widgets/neomorphism_data_container.dart';

class ColorDetailsScreenView extends StatelessWidget {
  const ColorDetailsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetModel = Provider.of<ColorDetailsScreenWidgetModel>(context, listen: false);

    return StreamBuilder<ScreenStatusesEnum>(
        stream: widgetModel.screenStatusStream,
        builder: (context, snapshot) {
          final status = widgetModel.screenStatus;
          if (status == ScreenStatusesEnum.wait) {
            return const _ColorDetailsView();
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}

class _ColorDetailsView extends StatelessWidget {
  const _ColorDetailsView();

  @override
  Widget build(BuildContext context) {
    final widgetModel = Provider.of<ColorDetailsScreenWidgetModel>(context, listen: false);

    return WillPopScope(
      onWillPop: () async => widgetModel.backNavigation(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const ColorDetailsScreenAppBar(),
          body: Center(
            child: Column(
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 318, maxWidth: double.maxFinite),
                    child: Center(
                      child: Container(
                        color: widgetModel.color.getColor(),
                      ),
                    ),
                  ),
                ),
                const ColorDataWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColorDataWidget extends StatelessWidget {
  const ColorDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetModel = Provider.of<ColorDetailsScreenWidgetModel>(context, listen: false);
    final theme = Theme.of(context);
    final color = widgetModel.color;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                color.name,
                style: theme.textTheme.customTitle,
              ),
            ],
          ),
          if (color.value != null && color.value!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: GestureDetector(
                onLongPress: () => widgetModel.copyColorToClipboard(context, color),
                child: NeomorphDataContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'HEX',
                        style: theme.textTheme.customText,
                      ),
                      Row(
                        children: [
                          Text(
                            color.value!.substring(1),
                            style: theme.textTheme.customText,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: StreamBuilder<ColorEntity?>(
                                stream: widgetModel.hexInClipboardStream,
                                builder: (context, snapshot) {
                                  final isCopied = widgetModel.hexInClipboard == color;
                                  if (isCopied) {
                                    return Icon(
                                      Icons.copy_sharp,
                                      color: theme.colorScheme.customIcons,
                                      size: 14,
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (color.value != null && color.value!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onLongPress: () => widgetModel.copyChannelToClipboard(context, color.getColor().red),
                    child: NeomorphDataContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Red',
                            style: theme.textTheme.customText,
                          ),
                          const SizedBox(width: 20),
                          Row(
                            children: [
                              Text(
                                color.getColor().red.toString(),
                                style: theme.textTheme.customText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPress: () => widgetModel.copyChannelToClipboard(context, color.getColor().green),
                    child: NeomorphDataContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Green',
                            style: theme.textTheme.customText,
                          ),
                          const SizedBox(width: 20),
                          Row(
                            children: [
                              Text(
                                color.getColor().green.toString(),
                                style: theme.textTheme.customText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPress: () => widgetModel.copyChannelToClipboard(context, color.getColor().blue),
                    child: NeomorphDataContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Blue',
                            style: theme.textTheme.customText,
                          ),
                          const SizedBox(width: 20),
                          Row(
                            children: [
                              Text(
                                color.getColor().blue.toString(),
                                style: theme.textTheme.customText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
