import 'package:json_annotation/json_annotation.dart';
import 'package:new_project/core/models/location.dart';

part 'locations.g.dart';

@JsonSerializable()
class Locations {
  @JsonKey(name: 'results')
  List<Location>? results;

  Locations();

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);

  Map<String, dynamic> toJson() => _$LocationsToJson(this);
}
