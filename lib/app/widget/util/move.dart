// Copyright (c) 2022, Md. Siam
// http://mdsiam.xyz/
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://choosealicense.com/licenses/mit/
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
