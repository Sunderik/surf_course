import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:task_280049/core/logic/mixins/clipboard_mixin.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';
import 'package:task_280049/core/logic/objects/enums/screen_statuses_enum.dart';

/// Базовый объект бизнес-логики для окна
abstract class BaseWidgetModel with ClipboardMixin {
  ///
  late ScreenStatusesEnum screenStatus;

  ///
  late StreamController<ScreenStatusesEnum> screenStatusController;

  ///
  Stream<ScreenStatusesEnum> get screenStatusStream => screenStatusController.stream;

  ///
  late StreamController<ColorEntity> hexInClipboardController;

  ///
  Stream<ColorEntity> get hexInClipboardStream => hexInClipboardController.stream;

  ///
  ColorEntity? hexInClipboard;

  ///Метод инициализации модели бизнес логики окна,вызывается  через провайдер в дереве виджитов при построении ветви дерева.
  @mustCallSuper
  void init() {
    screenStatusController = StreamController<ScreenStatusesEnum>.broadcast();
    hexInClipboardController = StreamController<ColorEntity>.broadcast();

    screenStatus = ScreenStatusesEnum.init;
    hexInClipboard = null;
  }

  ///Метод закрытия модели бизнес логики окна,вызывается при через провайдер в дереве виджитов  при стирании ветви дерева
  @mustCallSuper
  void dispose() {
    screenStatusController.close();
    hexInClipboardController.close();
  }

  void setScreenStatus(ScreenStatusesEnum status) {
    screenStatus = status;
    screenStatusController.sink.add(status);
  }

  void setHexInClipboard(ColorEntity hex) {
    hexInClipboard = hex;
    hexInClipboardController.sink.add(hex);
  }

  @mustCallSuper
  void copyColorToClipboard(BuildContext context, ColorEntity color) {
    copyToClipboard(context, text: color.value ?? '', message: 'Hex скопирован');
  }
}
