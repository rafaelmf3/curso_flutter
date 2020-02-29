import 'package:campo_minado/components/board_widget.dart';
import 'package:campo_minado/models/board.dart';
import 'package:campo_minado/models/explosion_exception.dart';
import 'package:flutter/material.dart';
import '../components/result_widget.dart';
import '../components/camp_widget.dart';
import '../models/camp.dart';

class MinedCampApp extends StatefulWidget {
  @override
  _MinedCampAppState createState() => _MinedCampAppState();
}

class _MinedCampAppState extends State<MinedCampApp> {
  bool _win;
  Board _board;

  void _restart() {
    setState(() {
      _win = null;
      _board.restart();
    });
  }

  void _open(Camp c) {
    if (_win != null) {
      return;
    }
    setState(() {
      try {
        c.open();
        if (_board.resolved) {
          _win = true;
        }
      } on ExplosionException {
        _win = false;
        _board.revealBombs();
      }
    });
  }

  void _toggleMarqued(Camp c) {
    if (_win != null) {
      return;
    }

    setState(() {
      c.toggleMarqued();
      if (_board.resolved) {
        _win = true;
      }
    });
  }

  Board _getBoard(double width, double heigth) {
    if (_board == null) {
      int columnCount = 15;
      double campSize = width / columnCount;
      int lineCount = (heigth / campSize).floor();

      _board = Board(
        lines: lineCount,
        columns: columnCount,
        bombs: 3,
      );
    }
    return _board;
  }

  @override
  Widget build(BuildContext context) {
    Camp camp = Camp(line: 0, column: 0);

    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          winner: _win,
          onRestart: _restart,
        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return BoardWidget(
                board: _getBoard(
                  constraints.maxWidth,
                  constraints.maxHeight,
                ),
                onOpen: _open,
                onToggleMarqued: _toggleMarqued,
              );
            },
          ),
        ),
      ),
    );
  }
}
