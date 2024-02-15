import 'package:json_annotation/json_annotation.dart';

part 'color_dto.g.dart';

@JsonSerializable()
class ColorDto {
  final String name;
  final String? value;

  ColorDto(this.name, this.value);

  factory ColorDto.fromJson(Map<String, dynamic> json) => _$ColorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ColorDtoToJson(this);
}
