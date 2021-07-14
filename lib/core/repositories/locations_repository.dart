import 'package:new_project/core/models/location.dart';
import 'package:new_project/core/services/characters.dart';
import 'package:new_project/core/converters/locations_response.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class LocationsRepository {
  static Dio _dio = Dio();

  static LocationsRepository _instance = LocationsRepository._internal();
  static LocationsRepository get instance => _instance;

  LocationsRepository._internal();

  factory LocationsRepository() {
    return instance;
  }

  Future<LocationsResponse> getLocations() async {
    return Characters(_dio).getLocations();
  }

  Future<Location> getLocation(id) async {
    return Characters(_dio).getLocation(id);
  }
}
