import 'package:json_annotation/json_annotation.dart';
import 'package:new_project/core/models/location.dart';

part 'locations_response.g.dart';

@JsonSerializable()
class LocationsResponse {
  @JsonKey(name: "results")
  List<Location>? results;

  LocationsResponse();

  factory LocationsResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsResponseToJson(this);
}
