import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokedex/consts/consts_app.dart';

Future goBack(context) async {
  Navigator.pop(context, true);
}

class PokeDetails extends StatefulWidget {
  final int pokemonId;

  PokeDetails({
    @required this.pokemonId,
  });

  @override
  _PokeDetailsState createState() => _PokeDetailsState();
}

class _PokeDetailsState extends State<PokeDetails>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  Future getPokemon() async {
    final Pokemon pokemon = await PokeAPI.getObject<Pokemon>(widget.pokemonId);
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
                        onPressed: () {
                          goBack(context);
                        },
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
          Positioned(
            top: 450,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: screenWidth,
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(25),
                    ),
                    color: Colors.white,
                  ),
                  child: Text(' '),
                ),
              ],
            ),
          ),
          Positioned(
            // bottom: 0,
            // right: 0,
            top: 320,
            child: Container(
              // margin: const EdgeInsets.all(5),
              width: 150,
              height: 150,
              child: Image.network(
                'https://pokeres.bastionbot.org/images/pokemon/1.png',
              ),
            ),
          ),

          // Positioned(
          //   top: 450,
          //   child: Container(
          //     decoration: new BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(25),
          //     ),
          //     child: new TabBar(
          //       controller: _controller,
          //       tabs: <Widget>[
          //         new Tab(
          //           icon: Icon(Icons.error),
          //           text: 'Teste',
          //         ),
          //         new Tab(
          //           icon: Icon(Icons.euro_symbol),
          //           text: 'teste2',
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
