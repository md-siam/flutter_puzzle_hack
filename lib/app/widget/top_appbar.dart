import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
              return Stack(
                children: [
                  ResponsiveVisibility(
                    visible: false,
                    visibleWhen: const [Condition.smallerThan(name: TABLET)],
                    child: DayNightSwitcherIcon(
                      dayBackgroundColor: const Color(0xFF0C91D6),
                      isDarkModeEnabled: themeProvider.darkTheme,
                      onStateChanged: (value) {
                        themeProvider.darkTheme
                            ? soundProvider.playLightSound()
                            : soundProvider.playDarkSound();
                        themeProvider.toggleTheme();
                      },
                    ),
                  ),
                  ResponsiveVisibility(
                    visible: false,
                    visibleWhen: const [Condition.largerThan(name: MOBILE)],
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 50,
                            child: DayNightSwitcher(
                              dayBackgroundColor: const Color(0xFF0C91D6),
                              isDarkModeEnabled: themeProvider.darkTheme,
                              onStateChanged: (value) {
                                themeProvider.darkTheme
                                    ? soundProvider.playLightSound()
                                    : soundProvider.playDarkSound();
                                themeProvider.toggleTheme();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      title: Text(
        'Puzzle Hack',
        style: GoogleFonts.alata(
          textStyle: const TextStyle(letterSpacing: 2.0),
        ),
      ),
      centerTitle: true,
      actions: [
        ResponsiveVisibility(
          visible: false,
          visibleWhen: const [Condition.smallerThan(name: TABLET)],
          child: CustomDropdownMenu(
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Theme.of(context).hoverColor,
            icons: const [
              Icon(Icons.volume_up, size: 30),
              Icon(Icons.info_outline_rounded, size: 30),
            ],
            onChange: (index) {},
          ),
        ),
        Consumer<SoundProvider>(
          builder: (context, soundProvider, child) {
            return ResponsiveVisibility(
              visible: false,
              visibleWhen: const [Condition.largerThan(name: MOBILE)],
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        soundProvider.playMenuOpen();
                      },
                      icon: const Icon(Icons.volume_up, size: 40.0),
                    ),
                    const SizedBox(width: 10.0),
                    IconButton(
                      onPressed: () {
                        soundProvider.playMenuOpen();
                        popupDialog(context);
                      },
                      icon: const Icon(Icons.info_outline, size: 40.0),
                    ),
                    const SizedBox(width: 15.0),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void popupDialog(BuildContext context) {
    return showAboutDialog(
      context: context,
      applicationIcon: const Icon(
        Icons.gamepad_rounded,
        size: 80,
      ),
      applicationName: 'Puzzle Hack',
      applicationVersion: '1.0.0',
      applicationLegalese: '©2022, mdsiam.xyz',
      children: const [
        Text(
          '     I dedicate this app to all the freedom fighters who have died for the Bengali language, and I quote in Bengali - "আমরা তোমাদের ভুলব না।"\n     For bug founder: Please send me an email mentioning the problem, and your device model.\nEmail: md.siam03@gmail.com',
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
