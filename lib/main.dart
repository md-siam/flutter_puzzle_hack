import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/view/puzzle_game.dart';
import 'app/provider/theme_provider.dart';
import 'app/provider/sound_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SoundProvider(),
        ),
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
          title: 'Flutter Puzzle Hack',
          debugShowCheckedModeBanner: false,
          theme:
              themeProvider.darkTheme ? MyTheme.darkTheme : MyTheme.lightTheme,
          home: const PuzzleGame(),
        );
      },
    );
  }
}
