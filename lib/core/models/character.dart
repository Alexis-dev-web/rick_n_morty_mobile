import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
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

  Character();

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
