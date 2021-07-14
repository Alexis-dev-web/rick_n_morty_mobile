// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Characters _$CharactersFromJson(Map<String, dynamic> json) {
  return Characters()
    ..results = (json['results'] as List<dynamic>?)
        ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$CharactersToJson(Characters instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
