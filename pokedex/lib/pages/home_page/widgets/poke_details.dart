import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';

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
          return Container(
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
          );
        } else {
          return Container(
            child: Text(pokeSnap.data.name),
          );
        }
      },
      future: getPokemon(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        height: 100,
        child: pokemonWidget(),
      ),
    );
  }
}
