import 'package:flutter/material.dart';

import 'design/neumorphic_button.dart';

class ResetButton extends StatelessWidget {
  Function reset;
  ResetButton({
    Key? key,
    required this.reset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 180,
          child: NeumorphicButton(
            buttonText: 'Reset',
            reset: reset,
          ),
        ),
      ],
    );
  }
}
