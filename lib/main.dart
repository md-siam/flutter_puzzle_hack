// Copyright (c) 2022, Md. Siam
// http://mdsiam.xyz/
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://choosealicense.com/licenses/mit/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app/view/puzzle_game.dart';
import 'app/provider/theme_provider.dart';
import 'app/provider/sound_provider.dart';
import 'app/provider/appinfo_provider.dart';

void main() {
  /// For disabling [landscape] view in mobile & tablet devices
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => SoundProvider()),
        Provider(create: (_) => AppInfoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Puzzle Hack',
          debugShowCheckedModeBanner: false,
          theme:
              themeProvider.darkTheme ? MyTheme.darkTheme : MyTheme.lightTheme,
          builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),

            /// These [Breakpoints] represents the width of the device,
            /// is is using `responsive_framework` package
            breakpoints: [
              const ResponsiveBreakpoint.resize(350, name: 'ExSmall'),
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
          ),

          /// This [ResponsiveSizer] is for Making the Puzzle Game
          /// board `responsive`
          ///
          home: ResponsiveSizer(
            builder: (context, orientation, screenType) {
              return const PuzzleGame();
            },
          ),
        );
      },
    );
  }
}
