import 'package:flutter/material.dart';
import 'package:new_project/ui/viewModels/characters_view_model.dart';
import 'package:provider/provider.dart';
import 'package:new_project/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:new_project/ui/characters.dart';

class CharacterView extends StatelessWidget {
  // This widget is the root of your application.
  CharacterView({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Rick and Morty',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Character(title: 'Personaje', id: id),
      ),
    );
  }
}

class Character extends StatefulWidget {
  Character({Key? key, required this.title, required this.id})
      : super(key: key);

  final String title;
  final int id;

  @override
  _CharacterState createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<CharactersViewModel>(context, listen: false)
          .getCharacter(context, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    var response = Provider.of<CharactersViewModel>(context);

    var character = response.character;

    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: 10,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          "${character?.name}",
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "${character?.status}",
                      style: TextStyle(color: Colors.white),
                    ))),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new CachedNetworkImageProvider("${character?.image}"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CharactersView()));
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      "Género: ${character?.gendeer == 'Male' ? 'Hombre' : ' Mujer'}\n\n"
      "Especie: ${character?.species}\n\n"
      "Tipo: ${character?.type}",
      style: TextStyle(fontSize: 18.0),
    );

    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
