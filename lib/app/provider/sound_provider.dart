import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

/// Provides [Sound] to all the custom widgets of the app.
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
  
  //*****  F A I L   S L I D I N G   S O U N D  ****//
  playFailSlidingSound() async {
    player = _isMute
        ? await audioCache.play(
            'mute.wav',
            mode: PlayerMode.LOW_LATENCY,
          )
        : await audioCache.play(
            'fail_sliding_sound.wav',
            mode: PlayerMode.LOW_LATENCY,
          );
    notifyListeners();
  }

  //*****  R E S E T   B U T T O N   S O U N D  ****//
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

  //*****  D A S H   S O U N D  -  D A N C I N G  ****//
  dashDanceSound() async {
    player = _isMute
        ? await audioCache.play(
            'mute.wav',
            mode: PlayerMode.LOW_LATENCY,
          )
        : await audioCache.play(
            'dash_dance_sound.wav',
            mode: PlayerMode.LOW_LATENCY,
          );
    notifyListeners();
  }
  
  //*****  D A S H   S O U N D  -  I D L E  ****//
  dashIdleSound() async {
    player = _isMute
        ? await audioCache.play(
            'mute.wav',
            mode: PlayerMode.LOW_LATENCY,
          )
        : await audioCache.play(
            'dash_idle_sound.wav',
            mode: PlayerMode.LOW_LATENCY,
          );
    notifyListeners();
  }

  //*****  M U T E   S O U N D  ****//
  stopSound() {
    _isMute = !_isMute;
    notifyListeners();
  }

  //*****  D A R K M O D E   O N   S O U N D  ****//
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
  
  //*****  L I G H T M O D E   O N   S O U N D  ****//
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

  //*****  D R O P D O W N   M E N U   O P E N  ****//
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
  
  //*****  D R O P D O W N   M E N U   C L O S E  ****//
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
