import 'package:json_annotation/json_annotation.dart';

part 'location_response.g.dart';

@JsonSerializable()
class Location {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'type')
  String? status;

  @JsonKey(name: 'dimension')
  String? species;

  Location();

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
