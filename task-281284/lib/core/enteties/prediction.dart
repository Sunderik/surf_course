import 'package:task_281284/core/network/dto_models/predition_dto.dart';

/// Объект предсказания
class Prediction {
  /// Сообщение предсказания
  final String message;

  /// Признак что это сообщение об ошибке
  final bool isErrorMessage;

  ///Предсказание
  const Prediction({required this.message, this.isErrorMessage = false});

  /// Создать объект из дто
  factory Prediction.fromDto(PredictionDTO dto) {
    return Prediction(message: dto.reading, isErrorMessage: dto.isErrorMessage);
  }
}
