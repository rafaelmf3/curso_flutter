import 'package:flutter/material.dart';

class ConstsColor {
  static Color getColorType({String type}) {
    switch (type) {
      case 'normal':
        return Color.fromRGBO(189, 189, 180, 0.7);
        break;
      case 'fire':
        return Colors.red;
        break;
      case 'water':
        return Colors.blue;
        break;
      case 'grass':
        return Colors.green;
        break;
      case 'electric':
        return Colors.amber;
        break;
      case 'ice':
        return Colors.cyanAccent[400];
        break;
      case 'fighting':
        return Colors.orange;
        break;
      case 'poison':
        return Colors.purple;
        break;
      case 'ground':
        return Colors.orange[400];
        break;
      case 'flying':
        return Colors.indigo[400];
        break;
      case 'psychic':
        return Colors.pink;
        break;
      case 'bug':
        return Color.fromRGBO(190, 190, 84, 0.7);
        break;
      case 'rock':
        return Colors.grey;
        break;
      case 'ghost':
        return Colors.indigo[400];
        break;
      case 'dark':
        return Colors.brown;
        break;
      case 'dragon':
        return Colors.indigo[400];
        break;
      case 'steel':
        return Colors.blueGrey;
        break;
      case 'fairy':
        return Colors.pinkAccent[400];
        break;
      default:
        return Colors.grey;
        break;
    }
  }
}
