import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:task_280049/core/core.dart';
import 'package:task_280049/core/logic/mixins/clipboard_mixin.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';
import 'package:task_280049/core/logic/services/notification_service.dart';

/// Базовый объект бизнес-логики для окна
abstract class BaseWidgetModel with ClipboardMixin {
  //#region ScreenStatus
  /// Текущего статуса окна
  late ScreenStatusesEnum _screenStatus;

  /// Контроллер потока изменения статуса окна
  late StreamController<ScreenStatusesEnum> screenStatusController;

  /// Поток изменения статуса окна
  Stream<ScreenStatusesEnum> get screenStatusStream => screenStatusController.stream;

  /// Текущего статуса окна (свойство)
  ScreenStatusesEnum get screenStatus => _screenStatus;

  /// Установить [status], как текущий статус окна [_screenStatus]
  set screenStatus(ScreenStatusesEnum status) {
    _screenStatus = status;
    screenStatusController.sink.add(status);
  }

  //#endregion

  //#region HexInClipboard
  /// Цвет в системном буфере
  late ColorEntity _hexInClipboard;

  /// Контроллер потока изменения цвета в системном буфере
  late StreamController<ColorEntity> hexInClipboardController;

  /// Поток изменения цвета в системном буфере
  Stream<ColorEntity> get hexInClipboardStream => hexInClipboardController.stream;

  /// Цвет в системном буфере (свойство)
  ColorEntity get hexInClipboard => _hexInClipboard;

  /// Установить [hex], как текущий цвет в системном буфере  [_hexInClipboard]
  set hexInClipboard(ColorEntity hex) {
    _hexInClipboard = hex;
    hexInClipboardController.sink.add(hex);
  }

  //#endregion

  ///Метод инициализации модели бизнес логики окна,вызывается  через провайдер в дереве виджитов при построении ветви дерева.
  @mustCallSuper
  void init() {
    screenStatusController = StreamController<ScreenStatusesEnum>.broadcast();
    hexInClipboardController = StreamController<ColorEntity>.broadcast();

    _screenStatus = ScreenStatusesEnum.init;
    _hexInClipboard = ColorEntity.empty();
  }

  /// Метод закрытия модели бизнес логики окна,вызывается через провайдер в дереве виджитов  при стирании ветви дерева
  @mustCallSuper
  void dispose() {
    screenStatusController.close();
    hexInClipboardController.close();
  }

  /// Копировать цвет [color] в системный буфер обмена
  @mustCallSuper
  Future<void> copyColorToClipboard(ColorEntity color) async {
    await copyToClipboard(text: color.value);
    injector.get<INotificationService>().showSimpleNotification('Hex скопирован');
  }
}
