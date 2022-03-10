import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clay_containers/widgets/clay_container.dart';

class PreviousScores extends StatelessWidget {
  const PreviousScores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Previous Scores',
          style: GoogleFonts.alata(
            textStyle: const TextStyle(letterSpacing: 2.0),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ClayContainer(
            emboss: true,
            color: Theme.of(context).primaryColor,
            width: height / 2,
            height: height / 2,
            borderRadius: 10,
          ),
        ),
      ),
    );
  }
}
