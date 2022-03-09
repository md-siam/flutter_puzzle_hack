import 'package:flutter/material.dart';
import 'package:flutter_puzzle_hack/app/widget/top_appbar.dart';

class PuzzleGame extends StatelessWidget {
  const PuzzleGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TopButtons(),
        ],
      )),
    );
  }
}
