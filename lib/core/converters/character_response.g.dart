// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResponse _$CharacterResponseFromJson(Map<String, dynamic> json) {
  return CharacterResponse()
    ..id = json['id'] as int?
    ..name = json['name'] as String?
    ..status = json['status'] as String?
    ..species = json['species'] as String?
    ..type = json['type'] as String?
    ..gendeer = json['gender'] as String?
    ..image = json['image'] as String?;
}

Map<String, dynamic> _$CharacterResponseToJson(CharacterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gendeer,
      'image': instance.image,
    };
