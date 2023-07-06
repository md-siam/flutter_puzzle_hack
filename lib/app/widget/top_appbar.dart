import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rive/rive.dart';

import '../provider/appinfo_provider.dart';
import '../provider/sound_provider.dart';
import '../provider/theme_provider.dart';
import 'util/dropdown_menu.dart';

// ignore: must_be_immutable
class TopAppBar extends StatefulWidget implements PreferredSizeWidget {
  RiveAnimationController controller;
  TopAppBar({Key? key, required this.controller}) : super(key: key);

  @override
  State<TopAppBar> createState() => _TopAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TopAppBarState extends State<TopAppBar> {
  bool isMute = false;
  bool switchValue = false;
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
                    visibleWhen: const [Condition.smallerThan(name: MOBILE)],
                    // child: DayNightSwitcherIcon(
                    //   dayBackgroundColor: const Color(0xFF0C91D6),
                    //   isDarkModeEnabled: themeProvider.darkTheme,
                    //   onStateChanged: (value) {
                    //     widget.controller.isActive = true;
                    //     themeProvider.darkTheme
                    //         ? soundProvider.playLightSound()
                    //         : soundProvider.playDarkSound();
                    //     themeProvider.toggleTheme();
                    //   },
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: CupertinoSwitch(
                        value: switchValue,
                        onChanged: (newValue) {
                          widget.controller.isActive = true;
                          themeProvider.darkTheme
                              ? soundProvider.playLightSound()
                              : soundProvider.playDarkSound();
                          themeProvider.toggleTheme();
                          switchValue = !switchValue;
                        },
                      ),
                    ),
                  ),
                  ResponsiveVisibility(
                    visible: false,
                    visibleWhen: const [Condition.largerThan(name: 'ExSmall')],
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 50.0,
                            // child: DayNightSwitcher(
                            //   dayBackgroundColor: const Color(0xFF0C91D6),
                            //   isDarkModeEnabled: themeProvider.darkTheme,
                            //   onStateChanged: (value) {
                            //     widget.controller.isActive = true;
                            //     themeProvider.darkTheme
                            //         ? soundProvider.playLightSound()
                            //         : soundProvider.playDarkSound();
                            //     themeProvider.toggleTheme();
                            //   },
                            // ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Switch.adaptive(
                                value: switchValue,
                                onChanged: (newValue) {
                                  widget.controller.isActive = true;
                                  themeProvider.darkTheme
                                      ? soundProvider.playLightSound()
                                      : soundProvider.playDarkSound();
                                  themeProvider.toggleTheme();
                                  switchValue = !switchValue;
                                },
                              ),
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
            borderRadius: BorderRadius.circular(10.0),
            backgroundColor: Theme.of(context).hoverColor,
            icons: [
              isMute
                  ? const Icon(Icons.volume_off, size: 30.0)
                  : const Icon(Icons.volume_up, size: 30.0),
              const Icon(Icons.info_outline_rounded, size: 30.0),
            ],
            onChange: (index) {},
          ),
        ),
        ResponsiveVisibility(
          visible: false,
          visibleWhen: const [Condition.largerThan(name: MOBILE)],
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: [
                Consumer<SoundProvider>(
                  builder: (context, soundProvider, child) {
                    return IconButton(
                      onPressed: () {
                        soundProvider.playMenuOpen();
                        soundProvider.stopSound();
                        setState(() {
                          isMute = soundProvider.isMute;
                        });
                      },
                      icon: isMute
                          ? const Icon(Icons.volume_off, size: 40.0)
                          : const Icon(Icons.volume_up, size: 40.0),
                    );
                  },
                ),
                const SizedBox(width: 10.0),
                Consumer<SoundProvider>(
                  builder: (context, soundProvider, child) {
                    return Consumer<AppInfoProvider>(
                      builder: (context, appInfoProvider, child) {
                        return IconButton(
                          onPressed: () {
                            soundProvider.playMenuOpen();
                            showAboutDialog(
                              context: context,
                              applicationIcon: appInfoProvider.applicationIcon,
                              applicationName: appInfoProvider.applicationName,
                              applicationVersion:
                                  appInfoProvider.applicationVersion,
                              applicationLegalese:
                                  appInfoProvider.applicationLegalese,
                              children: appInfoProvider.children,
                            );
                          },
                          icon: const Icon(Icons.info_outline, size: 40.0),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(width: 15.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
