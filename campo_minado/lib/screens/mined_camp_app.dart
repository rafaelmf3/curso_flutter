import 'package:flutter/material.dart';
import '../components/result_widget.dart';
import '../components/camp_widget.dart';
import '../models/camp.dart';

class MinedCampApp extends StatelessWidget {
  void _restart() {}

  void _open(Camp c) {}

  void _toggleMarqued(Camp c) {}

  @override
  Widget build(BuildContext context) {
    Camp camp = Camp(line: 0, column: 0);

    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          winner: true,
          onRestart: _restart,
        ),
        body: Container(
          child: CampWidget(
            camp: camp,
            onOpen: _open,
            onToggleMarqued: _toggleMarqued,
          ),
        ),
      ),
    );
  }
}
