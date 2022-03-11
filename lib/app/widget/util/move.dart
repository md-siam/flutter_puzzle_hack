import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Move extends StatelessWidget {
  int move;
  Move({
    Key? key,
    required this.move,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Text(
        "Move: $move",
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
