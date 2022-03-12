import 'dart:async';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';

import '/app/widget/grid.dart';
import '../widget/menu_items.dart';
import '/app/widget/top_appbar.dart';
import '../widget/picture_and_animation_row.dart';

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
    _controller1 = OneShotAnimation(
      'lookUp',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
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
                        Grid(
                          numbers: numbers,
                          clickGrid: clickGrid,
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

  void clickGrid(index) {
    if (secondsPassed == 0) {
      isActive = true;
    }
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 16 && numbers[index + 4] == 0)) {
      setState(() {
        move++;

        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
      });
    }
    checkWin();
  }

  void startTime() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  /// This method will reset the `puzzle board`
  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
      secondsPassed = 0;
      isActive = false;
    });
  }

  /// This method will whether the numbers are `sorted`
  /// or not
  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  /// This method is a popup `dialog` which will be displayed
  /// if the numbers are sorted correctly
  void checkWin() {
    if (isSorted(numbers)) {
      isActive = false;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ), //this right here
            child: SizedBox(
              height: 200.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Congratulation!!\n\nYou Won!!\n\n",
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 220.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Close",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
