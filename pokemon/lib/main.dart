import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            FutureBuilder<List<Pokemon>>(
              future: PokeAPI.getObjectList<Pokemon>(1, 10),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                print(snapshot.data);
                if (snapshot.hasData) {
                  List<Pokemon> pokeList = snapshot.data.toList();
                  return new Column(
                      children: pokeList.map((e) => new Text(e.name)).toList());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
