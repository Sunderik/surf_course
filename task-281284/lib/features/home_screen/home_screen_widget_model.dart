import 'dart:async';

import 'package:task_281284/core/constants/durations_constants.dart';
import 'package:task_281284/core/di/injectable.dart';
import 'package:task_281284/core/domain/enums/screen_status_enum.dart';
import 'package:task_281284/core/domain/widget_model/base_widget_model.dart';
import 'package:task_281284/core/enteties/prediction.dart';
import 'package:task_281284/core/logic/fortune_repository.dart';

/// Объект логики поведения окна галереи изображений
class HomeScreenWidgetModel extends BaseWidgetModel {
  /// Объект логики поведения окна галереи изображений
  HomeScreenWidgetModel();

  /// Статус экрана
  late ScreenStatusEnum _screenStatus;

  /// Статус экрана
  ScreenStatusEnum get screenStatus => _screenStatus;

  /// Контроллер статуса экрана
  final _screenStatusController = StreamController<ScreenStatusEnum>.broadcast();

  /// Поток состояния статуса экрана
  Stream<ScreenStatusEnum> get screenStatusStream => _screenStatusController.stream;

  /// Текущее предсказание
  Prediction? _currentPrediction;

  /// Текущее предсказание
  Prediction? get currentPrediction => _currentPrediction;

  @override
  void init() {
    _screenStatus = ScreenStatusEnum.init;
  }

  @override
  void dispose() {
    _screenStatusController.close();
  }

  /// Прокинуть новый статус экрана в контроллер
  void _sinkScreenStatus(ScreenStatusEnum newStatus) {
    if (_screenStatus == newStatus) {
      return;
    }
    _screenStatus = newStatus;
    _screenStatusController.sink.add(newStatus);
  }

  /// Прокинуть новое предсказание
  void _setPrediction(Prediction? newPrediction) {
    if (_currentPrediction == newPrediction) {
      return;
    }
    _currentPrediction = newPrediction;
  }

  /// Получить новое предсказание
  Future<void> getPrediction() async {
    if (_screenStatus == ScreenStatusEnum.loading) {
      return;
    }
    _sinkScreenStatus(ScreenStatusEnum.init);
    _setPrediction(null);
    await Future.delayed(
      DurationConstants.base,
    );
    _sendRequestForPrediction();
  }

  ///Отправить запрос для получения предсказания
  Future<void> _sendRequestForPrediction() async {
    _sinkScreenStatus(ScreenStatusEnum.loading);
    await Future.delayed(DurationConstants.base);
    final prediction = await injector.get<IFortuneRepository>().getPrediction();
    _setPrediction(prediction);
    if (prediction.isErrorMessage) {
      _sinkScreenStatus(ScreenStatusEnum.error);
    } else {
      _sinkScreenStatus(ScreenStatusEnum.wait);
    }
  }
}
