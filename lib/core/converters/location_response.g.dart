// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location()
    ..id = json['id'] as int?
    ..name = json['name'] as String?
    ..status = json['type'] as String?
    ..species = json['dimension'] as String?;
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.status,
      'dimension': instance.species,
    };
