import 'package:task_281284/core/enteties/prediction.dart';
import 'package:task_281284/core/network/clients/rest_client.dart';

mixin IFortuneRepository {
  Future<Prediction> getPrediction();
}

class FortuneRepositoryImp implements IFortuneRepository {
  final RestClient client;

  FortuneRepositoryImp(this.client);

  @override
  Future<Prediction> getPrediction() async {
    final dto = await client.getPrediction();
    return Prediction.fromDto(dto);
  }
}
