import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/constants.dart' as Constants;
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/components/plant_soil_moisture_text.dart';
import 'package:water_plant/src/screens/plant_info/plant_info.dart';

Widget createPlantInfoCard(BuildContext context, Plant plant,
    WaterTankDevice tank, Function callback) {
  return Container(
    padding: EdgeInsets.only(top: 2, bottom: 2),
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
        /*shape: RoundedRectangleBorder(
          side: BorderSide(
            color: plant.isHydrationCritical() ? Colors.red : Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(0),
        ),*/
        elevation: 5,
        //margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(0),
          height: 80,
          child: Row(
            children: <Widget>[
              Image.asset(plant.imageName),
              Expanded(
                child: Container(
                  //color: Colors.red,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          //color: Colors.blue,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              plant.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          //color: Colors.yellow,
                          alignment: Alignment.center,
                          child: PlantSoilMoistureText(
                            plant: plant,
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
