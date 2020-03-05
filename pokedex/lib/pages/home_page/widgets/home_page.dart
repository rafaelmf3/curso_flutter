import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/pages/home_page/widgets/poke_home.dart';
import 'poke_card.dart';
import '../../../consts/consts_app.dart';
import 'package:pokeapi/pokeapi.dart';

class HomePage extends StatelessWidget {
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
                  child: PokeHome(),
                  // child: Column(
                  //   children: <Widget>[
                  //     FutureBuilder<List<Pokemon>>(
                  //       future: PokeAPI.getObjectList<Pokemon>(1, 90),
                  //       builder: (context, snapshot) {
                  //         if (snapshot.hasData) {
                  //           List<Pokemon> pokeList = snapshot.data.toList();
                  //           return Container(
                  //             height: 750,
                  //             child: new GridView.count(
                  //                 childAspectRatio: 1.4,
                  //                 crossAxisCount: 2,
                  //                 children: pokeList.map((e) {
                  //                   var typeList =
                  //                       e.types.fold(<String>[], (list, type) {
                  //                     if (type.type != null) {
                  //                       list.add(type.type.name.toString());
                  //                       return list;
                  //                     }
                  //                   });
                  //                   return Container(
                  //                     padding: const EdgeInsets.fromLTRB(
                  //                         10, 10, 10, 10),
                  //                     child: new PokeCard(
                  //                       pokeName: e.name,
                  //                       pokeTypes: typeList,
                  //                       imageURL:
                  //                           'https://pokeres.bastionbot.org/images/pokemon/${e.id.toString()}.png',
                  //                     ),
                  //                   );
                  //                 }).toList()),
                  //           );
                  //         } else {
                  //           return Center(
                  //             child: CircularProgressIndicator(),
                  //           );
                  //         }
                  //       },
                  //     ),
                  //   ],
                  // ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
