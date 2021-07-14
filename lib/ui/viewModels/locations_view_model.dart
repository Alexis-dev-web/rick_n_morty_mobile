import 'package:flutter/material.dart';
import 'package:new_project/core/repositories/locations_repository.dart';
import 'package:new_project/core/converters/locations_response.dart';
import 'package:new_project/core/models/location.dart';

class LocationsViewModel extends ChangeNotifier {
  BuildContext? _context;
  BuildContext? get context => _context;

  LocationsRepository? _locationsRepository;

  List<Location>? _locations = List.empty();
  List<Location>? get locations => _locations;

  Location? _location;
  Location? get location => _location;

  LocationsViewModel(
      {required LocationsRepository locationsRepository,
      required BuildContext context}) {
    this._locationsRepository = locationsRepository;
    this._context = context;
  }

  Future<void> getLocations(BuildContext context) async {
    LocationsResponse response = await _locationsRepository!.getLocations();
    _locations = response.results;
    notifyListeners();
  }

  Future<void> getLocation(BuildContext context, id) async {
    Location response = await _locationsRepository!.getLocation(id);
    _location = response;
    notifyListeners();
  }
}
