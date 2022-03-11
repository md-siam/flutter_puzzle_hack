import 'package:flutter/material.dart';

import 'util/move.dart';
import 'util/reset_button.dart';
import 'util/timer.dart';

class MenuItems extends StatelessWidget {
  Function reset;
  int move;
  int secondsPassed;

  MenuItems({
    Key? key,
    required this.reset,
    required this.move,
    required this.secondsPassed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Move(move: move),
          ResetButton(reset: reset),
          Time(secondsPassed: secondsPassed),
        ],
      ),
    );
  }
}
