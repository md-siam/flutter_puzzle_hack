import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rive/rive.dart';

import '../provider/sound_provider.dart';
import '../provider/theme_provider.dart';

class SamplePictureAndAnimationRow extends StatelessWidget {
  final bool _isPlaying;
  final RiveAnimationController _controller1;
  final RiveAnimationController _controller2;

  const SamplePictureAndAnimationRow({
    Key? key,
    required bool isPlaying,
    required RiveAnimationController controller1,
    required RiveAnimationController controller2,
  })  : _isPlaying = isPlaying,
        _controller1 = controller1,
        _controller2 = controller2,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: ResponsiveValue(
            context,
            defaultValue: 200.0,
            valueWhen: const [
              Condition.smallerThan(name: MOBILE, value: 160.0),
            ],
          ).value,
          width: ResponsiveValue(
            context,
            defaultValue: 200.0,
            valueWhen: const [
              Condition.smallerThan(name: MOBILE, value: 160.0),
            ],
          ).value,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClayContainer(
              color: Theme.of(context).primaryColor,
              borderRadius: 10.0,
              child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: themeProvider.darkTheme
                        ? Image.asset(
                            'assets/images/darkSample.png',
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            'assets/images/lightSample.png',
                            fit: BoxFit.fill,
                          ),
                  );
                },
              ),
            ),
          ),
        ),
        Consumer<SoundProvider>(
          builder: (context, soundProvider, child) {
            return GestureDetector(
              onTap: () {
                _isPlaying
                    ? soundProvider.dashIdleSound()
                    : soundProvider.dashDanceSound();
                _isPlaying
                    ? _controller2.isActive = false
                    : _controller2.isActive = true;
              },
              child: SizedBox(
                height: ResponsiveValue(
                  context,
                  defaultValue: 200.0,
                  valueWhen: const [
                    Condition.smallerThan(name: MOBILE, value: 160.0),
                  ],
                ).value,
                width: ResponsiveValue(
                  context,
                  defaultValue: 200.0,
                  valueWhen: const [
                    Condition.smallerThan(name: MOBILE, value: 160.0),
                  ],
                ).value,
                child: RiveAnimation.asset(
                  'assets/animation/dash.riv',
                  animations: const ['idle'],
                  controllers: [_controller1, _controller2],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
