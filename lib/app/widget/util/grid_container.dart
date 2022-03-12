import 'package:flutter/material.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:responsive_framework/responsive_framework.dart';

// ignore: must_be_immutable
class GridContainer extends StatelessWidget {
  Function click;
  String text;

  GridContainer(this.text, this.click, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => click(),
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
              style: TextStyle(
                fontSize: ResponsiveValue(
                  context,
                  defaultValue: 30.0,
                  valueWhen: const [
                    Condition.smallerThan(name: MOBILE, value: 20.0),
                    Condition.largerThan(name: TABLET, value: 30.0)
                  ],
                ).value,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
