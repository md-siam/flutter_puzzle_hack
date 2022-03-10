import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

import 'util/dropdown_menu.dart';
import '../provider/theme_provider.dart';
import '../provider/sound_provider.dart';

class TopAppBar extends StatelessWidget with PreferredSizeWidget {
  const TopAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Consumer<ThemeProvider>(
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
      title: const Text('Puzzle Hack'),
      actions: [
        CustomDropdownMenu(
          borderRadius: BorderRadius.circular(10),
          backgroundColor: Theme.of(context).hoverColor,
          icons: const [
            Icon(Icons.score_outlined, size: 30),
            Icon(Icons.info_outline_rounded, size: 30),
          ],
          onChange: (index) {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
