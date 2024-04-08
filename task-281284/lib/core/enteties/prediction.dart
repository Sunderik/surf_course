import 'package:task_281284/core/network/dto_models/predition_dto.dart';

class Prediction {
  const Prediction({required this.reading});

  final String reading;

  factory Prediction.fromDto(PredictionDTO dto) {
    return Prediction(reading: dto.reading);
  }
}
