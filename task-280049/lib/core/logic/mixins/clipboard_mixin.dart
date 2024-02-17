import 'package:flutter/services.dart';

/// Миксин по работе с системным буфером из WidgetModel
mixin ClipboardMixin {
  /// Получить текущий цвет из буфера обмена
  /// Возвращается   цвет в формате Hex, либо пустая строка, если буфер обмена пуст
  Future<String> getColorInClipboard() async {
    final data = (await Clipboard.getData(Clipboard.kTextPlain))?.text;
    if (data == null || data.isEmpty) {
      return '';
    } else {
      return data;
    }
  }

  /// Записать текущий цвет в буфер обмена в формате Hex
  Future<void> copyToClipboard({required String text}) async {
    return Clipboard.setData(ClipboardData(text: text));
  }
}
