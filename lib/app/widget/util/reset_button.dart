// Copyright (c) 2022, Md. Siam
// http://mdsiam.xyz/
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://choosealicense.com/licenses/mit/
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            icon: const FaIcon(FontAwesomeIcons.redoAlt, size: 18),
            buttonText: 'Reset',
            function: reset,
          ),
        ),
      ],
    );
  }
}
