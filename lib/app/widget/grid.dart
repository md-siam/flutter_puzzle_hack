import 'package:flutter/material.dart';

import 'grid_button.dart';

class Grid extends StatelessWidget {
  var numbers = [];
  var size;
  Function clickGrid;
  Grid({
    Key? key,
    required this.numbers,
    required this.size,
    required this.clickGrid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return numbers[index] != 0
                ? GridButton("${numbers[index]}", () {
                    clickGrid(index);
                  })
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
