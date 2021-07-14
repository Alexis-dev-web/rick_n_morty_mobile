import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_project/core/repositories/characters_repository.dart';
import 'package:new_project/core/converters/characters_response.dart';
import 'package:new_project/core/models/character.dart';

class CharactersViewModel extends ChangeNotifier {
  BuildContext? _context;
  BuildContext? get context => _context;

  CharactersRepository? _charactersRepository;

  List<Character>? _characters = List.empty();
  List<Character>? get characters => _characters;

  Character? _character;
  Character? get character => _character;

  CharactersViewModel(
      {required CharactersRepository charactersRepository,
      required BuildContext context}) {
    this._charactersRepository = charactersRepository;
    this._context = context;
  }

  Future<void> getCharacters(BuildContext context) async {
    CharactersResponse response = await _charactersRepository!.getCharacters();
    _characters = response.results;
    notifyListeners();
  }

  Future<void> getCharacter(BuildContext context, id) async {
    Character response = await _charactersRepository!.getCharacter(id);
    _character = response;
    notifyListeners();
  }
}
