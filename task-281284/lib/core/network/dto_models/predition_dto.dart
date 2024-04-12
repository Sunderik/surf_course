import 'package:json_annotation/json_annotation.dart';

part 'predition_dto.g.dart';

/// Объект переноса данных для модели предсказания
@JsonSerializable()
class PredictionDTO {
  /// Сообщение предсказания
  final String reading;

  /// Признак что это сообщение об ошибке
  final bool isErrorMessage;

  const PredictionDTO({required this.reading, this.isErrorMessage = false});

  factory PredictionDTO.fromJson(Map<String, dynamic> json) => _$PredictionDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PredictionDTOToJson(this);
}
