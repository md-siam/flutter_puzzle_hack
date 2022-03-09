import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Score Board')),
    );
  }
}
