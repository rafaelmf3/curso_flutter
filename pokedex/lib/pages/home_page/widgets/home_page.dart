import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokedex.dart';
import 'poke_card.dart';
import '../../../consts/consts_app.dart';
import 'package:pokeapi/pokeapi.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Pokedex> parsePokedex(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Pokedex>((json) => Pokedex.fromMap(json)).toList();
}

Future<List<Pokedex>> fetchPokedex() async {
  final response = await http.get("https://pokeapi.co/api/v2/pokemon?limit=10");
  if (response.statusCode == 200) {
    return parsePokedex(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

class HomePage extends StatelessWidget {
  final Future<List<Pokedex>> pokedex;

  HomePage({Key key, this.pokedex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: -(240 / 4.7),
            left: screenWidth - (120 + 30),
            child: Opacity(
              child: Image.asset(
                ConstApp.blackPokeball,
                height: 240,
                width: 240,
              ),
              opacity: 0.1,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusHeight,
                  color: Colors.teal,
                ),
                Container(
                  width: screenWidth - 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: screenWidth - 40,
                  margin: EdgeInsets.only(bottom: 15),
                  child: Text(
                    'Pokedex',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      FutureBuilder<List<Pokemon>>(
                        future: PokeAPI.getObjectList<Pokemon>(1, 10),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Pokemon> pokeList = snapshot.data.toList();
                            return Container(
                              height: 750,
                              child: new GridView.count(
                                  childAspectRatio: 1.4,
                                  crossAxisCount: 2,
                                  children: pokeList
                                      .map((e) => Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: new PokeCard(
                                              pokeName: e.name,
                                              pokeTypes: ['Grass', 'Poison'],
                                              imageURL:
                                                  'https://pokeres.bastionbot.org/images/pokemon/${e.id.toString()}.png',
                                            ),
                                          ))
                                      .toList()),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
