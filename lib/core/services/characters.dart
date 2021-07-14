import 'package:new_project/core/converters/characters_response.dart';
import 'package:new_project/core/converters/locations_response.dart';
import 'package:new_project/core/models/location.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'package:new_project/core/models/character.dart';

part 'characters.g.dart';

@RestApi(baseUrl: "https://rickandmortyapi.com/api/")
abstract class Characters {
  factory Characters(Dio dio, {String baseUrl}) = _Characters;

  @GET("character")
  Future<CharactersResponse> getCharacters(
      {@Header("Content-Type") String contentType = 'application/json'});

  @GET("character/{id}")
  Future<Character> getCharacter(@Path("id") int id);

  @GET("location")
  Future<LocationsResponse> getLocations(
      {@Header("Content-Type") String contentType = 'application/json'});

  @GET("location/{id}")
  Future<Location> getLocation(@Path("id") int id);
}
