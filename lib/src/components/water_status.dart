import 'package:flutter/material.dart';
import 'package:water_plant/constants.dart' as Constants;

class WaterStatus extends StatelessWidget {
  final int hydration;
  final double width;
  final double height;
  final double paddingWidth;

  WaterStatus(this.hydration,
      {this.width = 17.0, this.height = 45.0, this.paddingWidth = 6});

  List<Widget> createWaterStatusBars(BuildContext context) {
    List<Widget> bars = [];
    Color color;
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color emptyColor = isDark
        ? Constants.WATER_LEVEL_EMPTY_DARK_THEME
        : Constants.WATER_LEVEL_EMPTY_LIGHT_THEME;
    Color fillColor = isDark
        ? Constants.WATER_LEVEL_FILL_DARK_THEME
        : Constants.WATER_LEVEL_FILL_LIGHT_THEME;
    for (var i = 0; i < 10; i++) {
      double hyd = hydration / 10;
      hyd > i ? color = fillColor : color = emptyColor;
      bars.add(
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1,
            ),
          ),
        ),
      );
    }
    return bars;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      /*decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Constants.BORDER_COLOR,
          width: 3,
        ),
      ),*/
      // padding: EdgeInsets.all(5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // padding: EdgeInsets.all(5),
          Row(
            children: <Widget>[
              for (var bar in createWaterStatusBars(context))
                Container(
                    padding:
                        EdgeInsets.fromLTRB(paddingWidth, 0, paddingWidth, 0),
                    child: bar),
            ],
          ),
        ],
      ),
    );
  }
}
