import 'package:new_project/core/repositories/characters_repository.dart';
import 'package:new_project/core/repositories/locations_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'ui/viewModels/characters_view_model.dart';
import 'ui/viewModels/locations_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => CharactersViewModel(
        charactersRepository: CharactersRepository(), context: context),
  ),
  ChangeNotifierProvider(
    create: (context) => LocationsViewModel(
        locationsRepository: LocationsRepository(), context: context),
  ),
];
