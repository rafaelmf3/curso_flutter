import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATION = Color.fromRGBO(250, 158, 13, 1);

  final String text;
  final bool big;
  final Color color;
  final void Function(String) cb;

  Button({
    @required this.text,
    @required this.cb,
    this.color = DEFAULT,
    this.big = false,
  });

  Button.big({
    @required this.text,
    @required this.cb,
    this.color = DEFAULT,
    this.big = true,
  });

  Button.operation({
    @required this.text,
    @required this.cb,
    this.color = OPERATION,
    this.big = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: RaisedButton(
        color: this.color,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        onPressed: () => cb(text),
      ),
    );
  }
}
