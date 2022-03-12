import 'dart:async';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/app/widget/grid.dart';
import '../widget/menu_items.dart';
import '../widget/winning_card.dart';
import '/app/widget/top_appbar.dart';
import '/app/provider/sound_provider.dart';
import '../widget/picture_and_animation_row.dart';

///
/// This is the [primary] dart file of the Puzzle Hack game
/// it's using all the custom widgets like: `TopAppBar`, `WinningCard`,
/// `SamplePictureAndAnimationRow` etc., and also has a `Rive` animation
/// of flutter mascot [Dash].
/// In addition to that, it is using [SoundProvider] class, which is managed
/// by a third-party package called, `provider`
///
///
class PuzzleGame extends StatefulWidget {
  const PuzzleGame({Key? key}) : super(key: key);

  @override
  State<PuzzleGame> createState() => _PuzzleGameState();
}

class _PuzzleGameState extends State<PuzzleGame> {
  late RiveAnimationController _controller1;
  late RiveAnimationController _controller2;
  bool _isPlaying = false;
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int move = 0;

  static const duration = Duration(seconds: 1);
  int secondsPassed = 0;
  bool isActive = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    numbers.shuffle();

    /// Controller for controlling [dash] eye ball
    ///
    _controller1 = OneShotAnimation(
      'lookUp',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );

    /// Controller for controlling [dash] dance
    ///
    _controller2 = OneShotAnimation(
      'slowDance',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    timer ??= Timer.periodic(
      duration,
      (Timer t) {
        startTime();
      },
    );
    return Scaffold(
      /// [TopAppBar] is a Custom Widget, which receives a
      /// animation controller i.e. `_controller1`
      /// for controlling dash [eye] ball.
      ///
      appBar: TopAppBar(controller: _controller1),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: null,
          child: Center(
            child: SizedBox(
              width: 800.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /// It is a [Custom Widget], which receives a
                  /// `boolean`value and two animation controllers
                  /// i e.`_controller1, _controller2`, for controlling
                  /// dash [eye] and [dance]
                  ///
                  SamplePictureAndAnimationRow(
                    isPlaying: _isPlaying,
                    controller1: _controller1,
                    controller2: _controller2,
                  ),
                  Center(
                    child: Column(
                      children: [
                        MenuItems(
                          reset: reset,
                          move: move,
                          secondsPassed: secondsPassed,
                        ),
                        SizedBox(height: deviceWidth <= 380 ? 0.0 : 10.0),

                        /// Provides sound of [sliding] and if the
                        /// slide fail, then an [error] sound
                        ///
                        Consumer<SoundProvider>(
                          builder: (context, soundProvider, child) {
                            return clickGrid(soundProvider);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// This method will check the user's [click] on the puzzle grid
  /// and change the state accordingly
  ///
  Grid clickGrid(SoundProvider soundProvider) {
    return Grid(
      numbers: numbers,
      clickGrid: (index) {
        if (secondsPassed == 0) {
          isActive = true;
        }
        if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
            index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
            (index - 4 >= 0 && numbers[index - 4] == 0) ||
            (index + 4 < 16 && numbers[index + 4] == 0)) {
          setState(() {
            move++;
            soundProvider.playSlidingSound();
            numbers[numbers.indexOf(0)] = numbers[index];
            numbers[index] = 0;
          });
        } else {
          soundProvider.playFailSlidingSound();
        }
        checkWin();
      },
    );
  }

  /// This method will start the [timer]
  ///
  void startTime() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  /// This method will reset the [puzzle board]
  ///
  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
      secondsPassed = 0;
      isActive = false;
    });
  }

  /// This method will run a loop to check whether the
  /// number are [sorted] or not, and returns a `boolean` value
  ///
  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  /// This method will display a custom dialog [WinningCard]
  /// which initiate if the numbers are sorted correctly
  ///
  void checkWin() {
    if (isSorted(numbers)) {
      isActive = false;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const WinningCard(),
          );
        },
      );
    }
  }
}
