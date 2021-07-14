// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationsResponse _$LocationsResponseFromJson(Map<String, dynamic> json) {
  return LocationsResponse()
    ..results = (json['results'] as List<dynamic>?)
        ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$LocationsResponseToJson(LocationsResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
