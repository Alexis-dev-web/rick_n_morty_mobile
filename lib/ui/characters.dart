import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:new_project/ui/viewModels/characters_view_model.dart';
import 'package:provider/provider.dart';
import 'package:new_project/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:new_project/ui/viewModels/character.dart';
import 'package:new_project/main.dart';

class CharactersView extends StatelessWidget {
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
        home: ListCharacters(title: 'Personajes'),
      ),
    );
  }
}

class ListCharacters extends StatefulWidget {
  ListCharacters({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ListCharactersState createState() => _ListCharactersState();
}

class _ListCharactersState extends State<ListCharacters> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<CharactersViewModel>(context, listen: false)
          .getCharacters(context);
    });
  }

  @override
  Widget listCharacters(character) {
    return Card(
      color: Colors.grey[800],
      child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CharacterView(id: 1)));
          },
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
                                  image: CachedNetworkImageProvider(
                                      character.image))))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        character.name,
                        style: TextStyle(color: Colors.green, fontSize: 14),
                      ),
                      Positioned(
                          left: 8.0,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CharactersView()));
                            },
                            child:
                                Icon(Icons.star_outline, color: Colors.white),
                          ))
                    ],
                  ),
                ],
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    var response = Provider.of<CharactersViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the ListCharacters object that was created by
          // the App.build method, and use it to set our appbar title.
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(title: 'Home')));
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
                  Future.sync(() => response.getCharacters(context)),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: SizedBox(
                          height: 1000.0,
                          child: new ListView(
                              padding: const EdgeInsets.all(8.0),
                              children: [
                                for (var character in response.characters!)
                                  listCharacters(character)
                              ])))
                ],
              ),
            )));
  }
}
