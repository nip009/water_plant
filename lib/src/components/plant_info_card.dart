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
          side: BorderSide(
            color: plant.isHydrationCritical() ? Colors.red : Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(12),
          height: 90,
          child: Row(
            children: <Widget>[
              ClipRRect(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.5),
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  child: Image.asset(plant.imageName),
                ),
              ),
              Expanded(
                child: Container(
                  //color: Colors.red,
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
                                  fontSize: 22, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: RichText(
                            text: TextSpan(
                              text: 'Soil moisture: ',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 18,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${plant.hydration}%',
                                  style: TextStyle(
                                    color: plant.isHydrationCritical()
                                        ? Colors.red
                                        : Colors.grey[700],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
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
/*List<Widget> createWaterStatusBars(BuildContext context, int hydration) {
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
*/
