import 'package:json_annotation/json_annotation.dart';

part 'predition_dto.g.dart';

@JsonSerializable()
class PredictionDTO {
  const PredictionDTO({required this.reading});

  final String reading;

  factory PredictionDTO.fromJson(Map<String, dynamic> json) => _$PredictionDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PredictionDTOToJson(this);
}
