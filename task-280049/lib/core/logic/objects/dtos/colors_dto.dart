import 'package:json_annotation/json_annotation.dart';
import 'package:task_280049/core/logic/objects/dtos/color_dto.dart';

part 'colors_dto.g.dart';

@JsonSerializable()
class ColorsDto {
  final List<ColorDto> colors;

  ColorsDto(this.colors);

  factory ColorsDto.fromJson(Map<String, dynamic> json) => _$ColorsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsDtoToJson(this);
}
