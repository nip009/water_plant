import 'package:flutter/material.dart';
import 'package:water_plant/constants.dart' as Constants;

/// Creates a water tank status indicator.
/// Shows percentagewise how much water is left in a water tank.
Widget waterTankIndicator(BuildContext context, int waterLevel) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      width: 350,
      child: Row(
        children: <Widget>[
          for (Color c in makeColorList(context, waterLevel))
            new Expanded(
              child: Container(
                color: c,
                child: Container(
                  color: c,
                  child: Container(
                    color: c,
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}

/// Helper function for [waterTankIndicator].
List<Color> makeColorList(BuildContext context, int waterLevel) {
  bool isDark = false;

  isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

  Color emptyColor = isDark
      ? Constants.WATER_LEVEL_EMPTY_DARK_THEME
      : Constants.WATER_LEVEL_EMPTY_LIGHT_THEME;
  Color fillColor = isDark
      ? Constants.WATER_LEVEL_FILL_DARK_THEME
      : Constants.WATER_LEVEL_FILL_LIGHT_THEME;
  List<Color> list = [];
  for (int i = 0; i < 100; i++) {
    if (waterLevel > i) {
      list.add(fillColor);
    } else {
      list.add(emptyColor);
    }
  }
  return list;
}
