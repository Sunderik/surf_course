import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task_281284/core/network/dto_models/dtos.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET('/')
  Future<PredictionDTO> getPrediction();
}
