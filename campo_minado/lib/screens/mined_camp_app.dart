import 'package:flutter/material.dart';
import '../components/result_widget.dart';

class MinedCampApp extends StatelessWidget {
  _restart() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          winner: true,
          onRestart: _restart(),
        ),
        body: Container(
          child: Text(
            'Board',
          ),
        ),
      ),
    );
  }
}
