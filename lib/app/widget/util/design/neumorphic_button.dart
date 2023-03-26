import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../provider/sound_provider.dart';

class NeumorphicButton extends StatefulWidget {
  final FaIcon icon;
  final String buttonText;
  final Function function;
  const NeumorphicButton({
    Key? key,
    required this.icon,
    required this.buttonText,
    required this.function,
  }) : super(key: key);

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _isElevated = true;

  void _pressedDown(PointerEvent details) {
    // provides playButtonSound() from SoundProvider
    context.read<SoundProvider>().playResetSound();
    setState(() {
      _isElevated = !_isElevated;
    });
  }

  void _pressedUp(PointerEvent details) {
    setState(() {
      _isElevated = !_isElevated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.function();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Listener(
          onPointerDown: _pressedDown,
          onPointerUp: _pressedUp,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: _isElevated
                  ? [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        offset: const Offset(4, 4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Theme.of(context).splashColor,
                        offset: const Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      )
                    ]
                  : null,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.icon,
                    const SizedBox(width: 10.0),
                    Text(
                      widget.buttonText,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
