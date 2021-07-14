import 'package:flutter/material.dart';
import 'package:new_project/ui/options.dart';
import 'package:new_project/ui/characters.dart';
import 'package:provider/provider.dart';
import 'package:new_project/ui/locations.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(providers: providers);
    return MaterialApp(
      title: 'Rick and Morty',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeView(title: 'Rick and Morty'),
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Title: Rick and Morty',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        /*3*/
        Icon(
          Icons.star,
          color: Colors.yellow[500],
        ),
        Text('41'),
      ],
    ),
  );

  List<Option> options = [
    Option(
        name: 'Personajes',
        profileImg: 'img/characters.jpg',
        view: CharactersView()),
    Option(
        name: 'Localizaciones',
        profileImg: 'img/places.jpg',
        view: LocationsView())
  ];

  @override
  Widget listOptions(Option) {
    return (Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Option.view));
          },
          child: Card(
              color: Colors.grey[800],
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
                                      image: AssetImage(Option.profileImg))))),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            Option.name,
                            style: TextStyle(color: Colors.green, fontSize: 14),
                          )
                        ],
                      )
                    ],
                  ))),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the HomeView object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: Column(
          children: <Widget>[
            Column(
                children: options.map((p) {
              return listOptions(p);
            }).toList())
          ],
        ),
      ),
    );
  }
}
