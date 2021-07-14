import 'package:flutter/foundation.dart';
import 'package:new_project/core/models/character.dart';
import 'package:new_project/core/services/characters.dart';
import 'package:new_project/core/converters/characters_response.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class CharactersRepository {
  static Dio _dio = Dio();

  static CharactersRepository _instance = CharactersRepository._internal();
  static CharactersRepository get instance => _instance;

  CharactersRepository._internal();

  factory CharactersRepository() {
    return instance;
  }

  Future<CharactersResponse> getCharacters() async {
    return Characters(_dio).getCharacters();
  }

  Future<Character> getCharacter(id) async {
    return Characters(_dio).getCharacter(id);
  }
}
