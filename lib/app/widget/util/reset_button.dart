import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'design/neumorphic_button.dart';

// ignore: must_be_immutable
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
          width: ResponsiveValue(
            context,
            defaultValue: 180.0,
            valueWhen: const [
              Condition.smallerThan(name: MOBILE, value: 120.0),
              Condition.largerThan(name: TABLET, value: 180.0)
            ],
          ).value,
          child: NeumorphicButton(
            buttonText: 'Reset',
            reset: reset,
          ),
        ),
      ],
    );
  }
}
