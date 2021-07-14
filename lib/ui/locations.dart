import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:new_project/ui/viewModels/locations_view_model.dart';
import 'package:provider/provider.dart';
import 'package:new_project/providers.dart';
import 'package:new_project/ui/viewModels/character.dart';

class LocationsView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Rick and Morty',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: ListLocations(title: 'Localizaciones'),
      ),
    );
  }
}

class ListLocations extends StatefulWidget {
  ListLocations({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ListLocationsState createState() => _ListLocationsState();
}

class _ListLocationsState extends State<ListLocations> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<LocationsViewModel>(context, listen: false)
          .getLocations(context);
    });
  }

  @override
  Widget listLocations(location) {
    return Card(
      color: Colors.grey[800],
      child: GestureDetector(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  image: AssetImage('img/places.jpg'))))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        location.name,
                        style: TextStyle(color: Colors.green, fontSize: 14),
                      )
                    ],
                  )
                ],
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    var response = Provider.of<LocationsViewModel>(context);
    print(response.locations);
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the ListLocations object that was created by
          // the App.build method, and use it to set our appbar title.
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CharacterView(id: 2)));
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Text(widget.title),
          actions: [
            Icon(Icons.more_vert),
          ],
        ),
        backgroundColor: Colors.grey[900],
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: RefreshIndicator(
              color: Colors.greenAccent,
              onRefresh: () =>
                  Future.sync(() => response.getLocations(context)),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: SizedBox(
                          height: 1000.0,
                          child: new ListView(
                              padding: const EdgeInsets.all(8.0),
                              children: [
                                for (var character in response.locations!)
                                  listLocations(character)
                              ])))
                ],
              ),
            )));
  }
}
