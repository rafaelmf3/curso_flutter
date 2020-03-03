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
                  child: FutureBuilder<List<Pokedex>>(
                    future: pokedex,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData
                          ? Text(snapshot.data.toString())
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
                ),
                // Container(
                //   child: PokeCard(
                //     pokeName: 'Bulbasaur',
                //     pokeTypes: Types({1,'Grass'}, {} )['Grass', 'Poison'],
                //     imageURL:
                //         'https://pokeres.bastionbot.org/images/pokemon/890.png',
                //   ),
                // ),

                // Column(
                //   children: <Widget>[
                //     FutureBuilder(
                //         future: PokeAPI.getObjectList<Pokemon>(1, 10),
                //         builder: (context, snapshot) {
                //           if (snapshot.hasData) {
                //             List<Pokemon> pokemonList = snapshot.data;
                // var lista = pokemonList.map((algo) {
                //   return PokeCard(
                //     pokeName: algo.name,
                //     pokeTypes: algo.types,
                //     imageURL:
                //         'https://pokeres.bastionbot.org/images/pokemon/${algo.id}.png',
                //   );
                // });

                // var lista = ListView.builder(
                //   itemCount: pokemonList.length,
                //   itemBuilder: (context, index) {
                //     var pokeId = pokemonList[index].id.toString();
                //     return PokeCard(
                //       pokeName: pokemonList[index].name,
                //       pokeTypes: pokemonList[index].types,
                //       imageURL:
                //           'https://pokeres.bastionbot.org/images/pokemon/$pokeId.png',
                //     );
                //   },
                // );

                // print(lista.length);
                // return lista;
                // Column(
                //   children: <Widget>[
                //     lista.reduce((value, element) => PokeCard(
                //           pokeName: value.pokeName,
                //           pokeTypes: value.pokeTypes,
                //           imageURL: value.imageURL,
                //         ))
                //   ],
                // );
                // pokemonList.fold([], (list, b) {
                //   list.add(b.name);
                //   list.add(b.id);
                //   // print(list);
                //   // print(b);
                //   return PokeCard(
                //     pokeName: b.name,
                //     pokeTypes: b.types,
                //     imageURL:
                //         'https://pokeres.bastionbot.org/images/pokemon/890.png',
                //   );
                // });
                // return Text(list.toString());
                // return PokeCard(pokeName: ,)
                //   } else {
                //     return Text("");
                //   }
                // })
                // ],
                // ),
                // ListView.builder(
                //   // itemCount: ,
                //   itemBuilder: (ctx, index) {
                //     final tr = dataPoke[index];
                //     return Text(tr.name);
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
