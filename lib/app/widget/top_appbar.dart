import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

import 'dropdown_menu.dart';
import '../provider/theme_provider.dart';
import '../provider/sound_provider.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return Consumer<SoundProvider>(
              builder: (context, soundProvider, child) {
                return DayNightSwitcherIcon(
                  dayBackgroundColor: const Color(0xFF0C91D6),
                  isDarkModeEnabled: themeProvider.darkTheme,
                  onStateChanged: (value) {
                    themeProvider.darkTheme
                        ? soundProvider.playLightSound()
                        : soundProvider.playDarkSound();
                    themeProvider.toggleTheme();
                  },
                );
              },
            );
          },
        ),
        const Expanded(child: SizedBox()),
        CustomDropdownMenu(
          borderRadius: BorderRadius.circular(10),
          backgroundColor: Theme.of(context).hoverColor,
          icons: const [
            Icon(Icons.score_outlined, size: 30),
            Icon(Icons.info_outline_rounded, size: 30),
          ],
          onChange: (index) {},
        ),
        const SizedBox(width: 2.0),
      ],
    );
  }
}
