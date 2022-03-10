import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Score Board',
          style: GoogleFonts.alata(
            textStyle: const TextStyle(letterSpacing: 2.0),
          ),
        ),
      ),
    );
  }
}
