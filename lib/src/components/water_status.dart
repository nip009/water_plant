import 'package:flutter/material.dart';
import 'package:water_plant/constants.dart' as Constants;

class WaterStatus extends StatelessWidget {
  final int hydration;
  final double width;
  final double height;
  final double paddingWidth;

// normal:
// {this.width = 21.0, this.height = 55.0, this.paddingWidth = 4});

// ny: {this.width = 25.0, this.height = 15.0, this.paddingWidth = 1});
  WaterStatus(this.hydration,
      {this.width = 21.0, this.height = 55.0, this.paddingWidth = 4});

  List<Widget> createWaterStatusBars(BuildContext context) {
    List<Widget> bars = [];
    Color color;

    Color emptyColor = Constants.WATER_LEVEL_EMPTY_LIGHT_THEME;
    Color fillColor = Constants.WATER_LEVEL_FILL_LIGHT_THEME;
    for (var i = 0; i < 10; i++) {
      double hyd = hydration / 10;
      hyd > i ? color = fillColor : color = emptyColor;
      bars.add(
        Card(
          elevation: 5,
          margin: const EdgeInsets.all(0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: color,
            ),
            width: width,
            height: height,
          ),
        ),
        /*
          width: width,
          height: height,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
              ),
            ],
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),*/
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
