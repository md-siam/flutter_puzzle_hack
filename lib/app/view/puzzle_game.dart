import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

import '/app/widget/top_appbar.dart';

class PuzzleGame extends StatefulWidget {
  const PuzzleGame({Key? key}) : super(key: key);

  @override
  State<PuzzleGame> createState() => _PuzzleGameState();
}

class _PuzzleGameState extends State<PuzzleGame> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const TopAppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClayContainer(
                emboss: true,
                color: Theme.of(context).primaryColor,
                width: size.height * 0.5,
                height: size.height * 0.5,
                borderRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
