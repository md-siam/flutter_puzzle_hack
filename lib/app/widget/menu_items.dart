// Copyright (c) 2022, Md. Siam
// http://mdsiam.xyz/
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://choosealicense.com/licenses/mit/
import 'package:flutter/material.dart';

import 'util/move.dart';
import 'util/timer.dart';
import 'util/reset_button.dart';

// ignore: must_be_immutable
class MenuItems extends StatelessWidget {
  int move;
  Function reset;
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
