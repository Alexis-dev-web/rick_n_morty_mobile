import 'package:json_annotation/json_annotation.dart';
import 'package:new_project/core/models/character.dart';

part 'characters.g.dart';

@JsonSerializable()
class Characters {
  @JsonKey(name: 'results')
  List<Character>? results;

  Characters();

  factory Characters.fromJson(Map<String, dynamic> json) =>
      _$CharactersFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersToJson(this);
}
