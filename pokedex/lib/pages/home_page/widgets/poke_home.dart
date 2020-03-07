import 'package:flutter/material.dart';

import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokedex/pages/home_page/widgets/poke_card.dart';
import 'package:pokedex/pages/home_page/widgets/poke_details.dart';

Future getPokemonList() async {
  List<Pokemon> pokemonList = await PokeAPI.getObjectList<Pokemon>(1, 10);
  return pokemonList;
}

Future goToPokeDetails(id, context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PokeDetails(
        pokemonId: id,
      ),
    ),
  );
}

Widget pokemonWidget() {
  return FutureBuilder(
    builder: (context, pokeSnap) {
      if (pokeSnap.connectionState == ConnectionState.none &&
          pokeSnap.hasData == null) {
        print('project snapshot data is: ${pokeSnap.data}');
        return Container();
      }
      print('project snapshot data is: ${pokeSnap.data}');
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: pokeSnap.hasData
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 2,
                    // childAspectRatio: 1.4,
                  ),
                  itemCount: pokeSnap.data.length,
                  itemBuilder: (context, index) {
                    Pokemon pokemon = pokeSnap.data[index];
                    return Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            goToPokeDetails(pokemon.id, context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: PokeCard(
                              imageURL:
                                  'https://pokeres.bastionbot.org/images/pokemon/${pokemon.id.toString()}.png',
                              pokeName: pokemon.name,
                              pokeTypes: pokemon.types.fold(
                                <String>[],
                                (list, p) {
                                  list.add(p.type.name.toString());
                                  return list;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ));
    },
    future: getPokemonList(),
  );
}

class PokeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 755,
      child: pokemonWidget(),
    );
  }
}
