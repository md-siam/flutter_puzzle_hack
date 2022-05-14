import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'util/grid_container.dart';

// ignore: must_be_immutable
class Grid extends StatelessWidget {
  var numbers = [];
  Function clickGrid;
  Grid({
    Key? key,
    required this.numbers,
    required this.clickGrid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var boardSize = screenWidth <= 480 ? 100.w : 500.0;
    return SizedBox(
      width: boardSize,
      height: boardSize,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              ClayContainer(
                emboss: true,
                color: Theme.of(context).primaryColor,
                borderRadius: 10,
              ),
              Padding(
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
                        ? GridContainer("${numbers[index]}", () {
                            clickGrid(index);
                          })
                        : const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
