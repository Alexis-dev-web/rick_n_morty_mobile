import 'package:json_annotation/json_annotation.dart';

part 'character_response.g.dart';

@JsonSerializable()
class CharacterResponse {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'species')
  String? species;

  @JsonKey(name: 'type')
  String? type;

  @JsonKey(name: 'gender')
  String? gendeer;

  @JsonKey(name: 'image')
  String? image;

  CharacterResponse();

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterResponseToJson(this);
}
