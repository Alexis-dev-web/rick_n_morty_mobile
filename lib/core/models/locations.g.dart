// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return Locations()
    ..results = (json['results'] as List<dynamic>?)
        ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
      'results': instance.results,
    };
