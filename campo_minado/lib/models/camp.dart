import 'package:flutter/foundation.dart';
import 'explosion_exception.dart';

class Camp {
  final int line;
  final int column;
  final List<Camp> neighbors = [];

  bool _open = false;
  bool _marqued = false;
  bool _mined = false;
  bool _exploded = false;

  Camp({
    @required this.line,
    @required this.column,
  });

  void addNeighbor(Camp neighbor) {
    final deltaLine = (line - neighbor.line).abs();
    final deltaColumn = (column - neighbor.column).abs();

    if (deltaLine == 0 && deltaColumn == 0) {
      return;
    }

    if (deltaLine <= 1 && deltaColumn <= 1) {
      neighbors.add(neighbor);
    }
  }

  void open() {
    if (_open) {
      return;
    }

    _open = true;

    if (_mined) {
      _exploded = true;
      throw ExplosionException();
    }

    if (safeNeighborhood) {
      neighbors.forEach((element) => element.open());
    }
  }

  void revealBomb() {
    if (_mined) {
      _open = true;
    }
  }

  void mining() {
    _mined = true;
  }

  void toggleMarqued() {
    _marqued = !_marqued;
  }

  void restart() {
    _open = false;
    _marqued = false;
    _mined = false;
    _exploded = false;
  }

  bool get mined {
    return _mined;
  }

  bool get exploded {
    return _exploded;
  }

  bool get opened {
    return _open;
  }

  bool get marqued {
    return _marqued;
  }

  bool get resolved {
    bool minedAndMarqued = mined && marqued;
    bool safeAndOpen = !mined && opened;
    return minedAndMarqued || safeAndOpen;
  }

  bool get safeNeighborhood {
    return neighbors.every((element) => !element._mined);
  }

  int get numberOfNeighborhoodMines {
    return neighbors.where((element) => element.mined).length;
  }
}
