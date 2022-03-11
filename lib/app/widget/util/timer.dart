import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  int secondsPassed;
  Time({
    Key? key,
    required this.secondsPassed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Text(
        "Time: $secondsPassed s",
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
