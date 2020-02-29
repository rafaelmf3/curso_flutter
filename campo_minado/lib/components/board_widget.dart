import 'package:campo_minado/components/camp_widget.dart';
import 'package:flutter/material.dart';
import '../models/camp.dart';
import '../models/board.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final Function(Camp) onOpen;
  final Function(Camp) onToggleMarqued;

  BoardWidget({
    @required this.board,
    @required this.onOpen,
    @required this.onToggleMarqued,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: board.columns,
        children: board.camps.map((c) {
          return CampWidget(
            camp: c,
            onOpen: onOpen,
            onToggleMarqued: onToggleMarqued,
          );
        }).toList(),
      ),
    );
  }
}
