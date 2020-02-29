import 'package:campo_minado/models/camp.dart';
import 'package:flutter/material.dart';

class CampWidget extends StatelessWidget {
  final Camp camp;
  final Function(Camp) onOpen;
  final Function(Camp) onToggleMarqued;

  CampWidget({
    @required this.camp,
    @required this.onOpen,
    @required this.onToggleMarqued,
  });

  Widget _getImage() {
    int numOfMines = camp.numberOfNeighborhoodMines;
    if (camp.opened && camp.mined && camp.exploded) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (camp.opened && camp.mined) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (camp.opened) {
      return Image.asset('assets/images/bomba_$numOfMines.jpeg');
    } else if (camp.marqued) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(camp),
      onLongPress: () => onToggleMarqued(camp),
      child: _getImage(),
    );
  }
}
