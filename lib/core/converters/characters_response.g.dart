// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersResponse _$CharactersResponseFromJson(Map<String, dynamic> json) {
  return CharactersResponse()
    ..results = (json['results'] as List<dynamic>?)
        ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$CharactersResponseToJson(CharactersResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
