import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clay_containers/widgets/clay_container.dart';

import '/app/provider/sound_provider.dart';

class GridButton extends StatelessWidget {
  Function click;
  String text;

  GridButton(this.text, this.click, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SoundProvider>(
      builder: (context, soundProvider, child) {
        return GestureDetector(
          onTap: () {
            click();
            soundProvider.playSlidingSound();
          },
          //onTap: click as void Function()?,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClayContainer(
              color: Theme.of(context).primaryColor,
              height: 30,
              width: 30,
              customBorderRadius: BorderRadius.circular(8.0),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
