import 'package:flutter/material.dart';

import 'util/move.dart';
import 'util/reset_button.dart';
import 'util/timer.dart';

class Menu extends StatelessWidget {
  Function reset;
  int move;
  int secondsPassed;
  var size;
  Menu({
    Key? key,
    required this.reset,
    required this.move,
    required this.secondsPassed,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Move(move: move),
          ResetButton(reset: reset, text: "Reset"),
          Time(secondsPassed: secondsPassed),
        ],
      ),
    );
  }
}
