import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundProvider extends ChangeNotifier {
  final AudioCache audioCache = AudioCache(prefix: 'assets/audio/');

  //*****  B U T T O N   S O U N D  ****//
  playSlidingSound() async {
    await audioCache.play(
      'sliding_sound.wav',
      mode: PlayerMode.LOW_LATENCY,
    );
    notifyListeners();
  }

  //*****  D A R K M O D E   S W I T C H  ****//
  playDarkSound() async {
    await audioCache.play(
      'owl_dark.wav',
      mode: PlayerMode.LOW_LATENCY,
    );
    notifyListeners();
  }

  playLightSound() async {
    await audioCache.play(
      'owl_light.wav',
      mode: PlayerMode.LOW_LATENCY,
    );
    notifyListeners();
  }

  //*****  D R O P D O W N   M E N U  ****//
  playMenuOpen() async {
    await audioCache.play(
      'dropdown_open.wav',
      mode: PlayerMode.LOW_LATENCY,
    );
    notifyListeners();
  }

  playMenuClose() async {
    await audioCache.play(
      'dropdown_close.wav',
      mode: PlayerMode.LOW_LATENCY,
    );
    notifyListeners();
  }
}
