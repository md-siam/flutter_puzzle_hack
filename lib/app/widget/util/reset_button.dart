import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  Function reset;
  String text;
  ResetButton({
    Key? key,
    required this.reset,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: reset as void Function()?,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        shape: const StadiumBorder(),
      ),
      child: const Text(
        "Reset",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
