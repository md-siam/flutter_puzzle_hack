import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clay_containers/widgets/clay_container.dart';

import '/app/widget/top_appbar.dart';

class PuzzleGame extends StatefulWidget {
  const PuzzleGame({Key? key}) : super(key: key);

  @override
  State<PuzzleGame> createState() => _PuzzleGameState();
}

class _PuzzleGameState extends State<PuzzleGame> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const TopAppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$width x $height",
                style: TextStyle(fontSize: 30),
              ),
              ClayContainer(
                emboss: true,
                color: Theme.of(context).primaryColor,
                width: height / 2,
                height: height / 2,
                borderRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
