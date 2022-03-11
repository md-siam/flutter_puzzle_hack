import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundProvider extends ChangeNotifier {
  final AudioCache audioCache = AudioCache(prefix: 'assets/audio/');
  AudioPlayer? player;
  bool _isMute = false;
  bool get isMute => _isMute;
   

  //*****  S L I D I N G   S O U N D  ****//
  playSlidingSound() async {
    player = _isMute
        ? await audioCache.play(
            'mute.wav',
            mode: PlayerMode.LOW_LATENCY,
          )
        : await audioCache.play(
            'sliding_sound.wav',
            mode: PlayerMode.LOW_LATENCY,
          );
    notifyListeners();
  }

  //*****  R E S E T   S O U N D  ****//
  playResetSound() async {
    player = _isMute
        ? await audioCache.play(
            'mute.wav',
            mode: PlayerMode.LOW_LATENCY,
          )
        : await audioCache.play(
            'reset_sound.wav',
            mode: PlayerMode.LOW_LATENCY,
          );
    notifyListeners();
  }

  //*****  S T O P   S O U N D  ****//
  stopSound() {
    _isMute = !_isMute;
    notifyListeners();
  }

  //*****  D A R K M O D E   S W I T C H  ****//
  playDarkSound() async {
    player = _isMute
        ? await audioCache.play(
            'mute.wav',
            mode: PlayerMode.LOW_LATENCY,
          )
        : await audioCache.play(
            'owl_dark.wav',
            mode: PlayerMode.LOW_LATENCY,
          );
    notifyListeners();
  }

  playLightSound() async {
    player = _isMute
        ? await audioCache.play(
            'mute.wav',
            mode: PlayerMode.LOW_LATENCY,
          )
        : await audioCache.play(
            'owl_light.wav',
            mode: PlayerMode.LOW_LATENCY,
          );
    notifyListeners();
  }

  //*****  D R O P D O W N   M E N U  ****//
  playMenuOpen() async {
    player = _isMute
        ? await audioCache.play(
            'mute.wav',
            mode: PlayerMode.LOW_LATENCY,
          )
        : await audioCache.play(
            'dropdown_open.wav',
            mode: PlayerMode.LOW_LATENCY,
          );
    notifyListeners();
  }

  playMenuClose() async {
    player = _isMute
        ? await audioCache.play(
            'mute.wav',
            mode: PlayerMode.LOW_LATENCY,
          )
        : await audioCache.play(
            'dropdown_close.wav',
            mode: PlayerMode.LOW_LATENCY,
          );
    notifyListeners();
  }
}
