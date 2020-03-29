import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/constants.dart' as Constants;
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/screens/plant_info/plant_info.dart';

Widget createPlantInfoCard(BuildContext context, Plant plant,
    WaterTankDevice tank, Function callback) {
  return Container(
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PlantInfoScreen(plant: plant, tank: tank, callback: callback),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 8,
        margin: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            /*border: Border.all(
              color: Constants.BORDER_COLOR,
              width: 2,
            ),*/
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          width: 120,
          height: 120,
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  border: Border.all(
                    color: Constants.BORDER_COLOR,
                    width: 1,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(plant.imageName),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            plant.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 40,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: <Widget>[
                              for (var box in createWaterStatusBars(
                                  context, plant.hydration))
                                Container(
                                    padding: EdgeInsets.all(5), child: box),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// Returns the bars that represent how hydrated a plant is
List<Widget> createWaterStatusBars(BuildContext context, int hydration) {
  bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
  Color emptyColor = isDark
      ? Constants.WATER_LEVEL_EMPTY_DARK_THEME
      : Constants.WATER_LEVEL_EMPTY_LIGHT_THEME;
  Color fillColor = isDark
      ? Constants.WATER_LEVEL_FILL_DARK_THEME
      : Constants.WATER_LEVEL_FILL_LIGHT_THEME;
  List<Widget> bars = [];
  for (var i = 0; i < 10; i++) {
    double hyd = hydration / 10.0;
    Color color = hyd > i ? fillColor : emptyColor;
    bars.add(
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        width: 10,
        height: 25,
      ),
    );
  }
  return bars;
}
