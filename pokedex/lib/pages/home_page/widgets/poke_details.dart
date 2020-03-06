import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokedex/consts/consts_app.dart';

class PokeDetails extends StatelessWidget {
  final int pokemonId;

  PokeDetails({
    @required this.pokemonId,
  });

  Future getPokemon() async {
    final Pokemon pokemon = await PokeAPI.getObject<Pokemon>(pokemonId);
    return pokemon;
  }

  Widget pokemonWidget() {
    return FutureBuilder(
      builder: (context, pokeSnap) {
        if (pokeSnap.connectionState == ConnectionState.none &&
            pokeSnap.hasData == null) {
          print('project snapshot data is: ${pokeSnap.data}');
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (pokeSnap.hasData) {
          var pokemons = pokeSnap.data.types.fold(
            [],
            (list, p) {
              list.add(p.type.name.toString());
              return list;
            },
          );
          print('project snapshot data is: ${pokeSnap.data}');
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(),
                    child: Text(
                      pokeSnap.data.name[0].toUpperCase() +
                          pokeSnap.data.name.substring(1),
                      style: TextStyle(
                        fontFamily: 'Google',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: pokemons.map((label) {
                  print(label);
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.all(
                            const Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          child: Text(
                            label.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          );
        } else {
          return Container(
            child: null,
          );
        }
      },
      future: getPokemon(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: 250,
            left: screenWidth - 220,
            child: Opacity(
              child: Image.asset(
                ConstApp.whitePokeball,
                height: 220,
                width: 220,
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
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {},
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                        // child: pokemonWidget(),
                        ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
