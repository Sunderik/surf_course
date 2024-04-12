import 'package:task_281284/core/enteties/prediction.dart';
import 'package:task_281284/core/network/clients/rest_client.dart';
import 'package:task_281284/core/network/dto_models/predition_dto.dart';

/// Интерфейс источника данны с предсказаниями
interface class IFortuneRepository {
  /// Получить предсказание
  Future<Prediction> getPrediction() {
    throw UnimplementedError();
  }
}

/// Реализация интерфейса источника данны с предсказаниями
class FortuneRepositoryImp implements IFortuneRepository {
  /// Клиент сетевого взаимодействия
  final RestClient client;

  FortuneRepositoryImp(this.client);

  @override
  Future<Prediction> getPrediction() async {
    PredictionDTO dto;
    try {
      dto = await client.getPrediction();
    } catch (_) {
      dto = const PredictionDTO(reading: 'Error. Try again', isErrorMessage: true);
    }
    return Prediction.fromDto(dto);
  }
}
