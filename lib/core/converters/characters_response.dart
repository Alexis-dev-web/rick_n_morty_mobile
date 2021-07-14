import 'package:json_annotation/json_annotation.dart';
import 'package:new_project/core/models/character.dart';

part 'characters_response.g.dart';

@JsonSerializable()
class CharactersResponse {
  @JsonKey(name: "results")
  List<Character>? results;

  CharactersResponse();

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);
}
