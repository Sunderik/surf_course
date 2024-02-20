import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:task_280049/core/logic/keys/keys.dart';
import 'package:task_280049/core/theme/extensions/color_extension.dart';

/// Интерфейс сервиса отображения уведомлений
abstract class INotificationService {
  /// Отобразить простое уведомление с сообщением [message]
  void showSimpleNotification(String message);
}

/// Сервис отображения уведомлений при помощи snackbar
@Injectable(as: INotificationService)
class SnackBarNotificationService implements INotificationService {
  /// Глобальный ключ контекста приложения
  late final GlobalKey<NavigatorState> navigationKey;

  SnackBarNotificationService() {
    navigationKey = AppNavigatorKey.stateKey;
  }

  @override
  void showSimpleNotification(String message) {
    final context = navigationKey.currentState?.context;
    if (context != null) {
      final theme = Theme.of(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //--------------- Через базовую тему и расширение темы снекбара не работает
        // + у него нет параметра темы в который можно было бы подсунуть тему из расширения
        //, поэтому пришлось захороводить сюда
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        backgroundColor: theme.colorScheme.customOpacity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        width: 160,
        //-----------------
        content: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
          ],
        ),
      ));
    } else {
      print('The notification was not shown, the context  is null');
    }
  }
}
