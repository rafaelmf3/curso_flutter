import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/consts/consts_color.dart';

class PokeCard extends StatelessWidget {
  final String pokeName;
  final List<String> pokeTypes;
  final String imageURL;

  PokeCard({
    @required this.pokeName,
    @required this.pokeTypes,
    @required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final colorCard = pokeTypes.last;
    print(colorCard.toString());
    return Container(
      decoration: BoxDecoration(
        color: ConstsColor.getColorType(type: colorCard.toString()),
        // color: Color.fromRGBO(10, 10, 10, 1),
        borderRadius: BorderRadius.all(
          const Radius.circular(12),
        ),
      ),
      // width: screenWidth / 2 - 10,
      height: 120,
      // color: Colors.red,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                    child: Text(
                      this.pokeName,
                      style: TextStyle(
                        fontFamily: 'Google',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: pokeTypes.map((label) {
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
          ),
          Positioned(
            bottom: -10,
            right: -5,
            child: Container(
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  ConstApp.whitePokeball,
                  height: 90,
                  width: 90,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.all(5),
              width: 70,
              height: 70,
              child: Image.network(imageURL),
            ),
          ),
        ],
      ),
    );
  }
}
