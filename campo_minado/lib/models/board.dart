import 'dart:math';

import 'package:flutter/foundation.dart';
import 'camp.dart';

class Board {
  final int lines;
  final int columns;
  final int bombs;

  final List<Camp> _camps = [];

  Board({
    @required this.lines,
    @required this.columns,
    @required this.bombs,
  }) {
    _createCamps();
    _relateNeighbors();
    _sortMines();
  }

  void restart() {
    _camps.forEach((element) => element.restart());
    _sortMines();
  }

  void revealBombs() {
    _camps.forEach((element) => element.revealBomb());
  }

  void _createCamps() {
    for (int l = 0; l < lines; l++) {
      for (int c = 0; c < columns; c++) {
        _camps.add(Camp(line: l, column: c));
      }
    }
  }

  void _relateNeighbors() {
    for (var camp in _camps) {
      for (var neighbor in _camps) {
        camp.addNeighbor(neighbor);
      }
    }
  }

  void _sortMines() {
    int sorted = 0;

    if (bombs > lines * columns) {
      return;
    }

    while (sorted < bombs) {
      int i = Random().nextInt(_camps.length);

      if (!_camps[i].mined) {
        sorted++;
        _camps[i].mining();
      }
    }
  }

  List<Camp> get camps {
    return _camps;
  }

  bool get resolved {
    return _camps.every((element) => element.resolved);
  }
}
