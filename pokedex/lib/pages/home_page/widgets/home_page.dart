import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'poke_card.dart';

import '../../../consts/consts_app.dart';

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
                  child: Text(
                    'Pokedex',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: PokeCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
