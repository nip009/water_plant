import 'package:flutter/material.dart';

/// Creates a water tank status indicator.
/// Shows percentagewise how much water is left in a water tank.
Widget waterTankIndicator(int waterLevel) {
  return Row(
    children: <Widget>[
      for (Color c in makeColorList(waterLevel))
        new Expanded(
          child: Container(
            width: 20,
            color: c,
          ),
        ),
    ],
  );
}

/// Helper function for [waterTankIndicator].
List<Color> makeColorList(int waterLevel) {
  List<Color> list = [];
  for (int i = 0; i < 10; i++) {
    if (waterLevel > i * 10) {
      list.add(Colors.blue[500]);
    } else {
      list.add(Colors.grey);
    }
  }
  return list;
}
