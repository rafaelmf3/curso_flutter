import 'package:flutter/material.dart';

class PokeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(15),
      width: screenWidth / 2,
      color: Colors.red,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Text(
                  "Bulbasaur",
                  style: TextStyle(
                    fontFamily: 'Google',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Grass",
                ),
              ),
              Container(
                child: Text(
                  "Poison",
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            width: 90,
            height: 90,
            child: FittedBox(
              alignment: Alignment.bottomRight,
              child: Image.network(
                  "https://i.pinimg.com/originals/da/86/29/da8629d699da6e847a69278e5454e65b.png"),
            ),
          ),
        ],
      ),
    );
  }
}
