import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/constants.dart' as Constants;
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/components/plant_soil_moisture_text.dart';
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
                          child: PlantSoilMoistureText(plant: plant),
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
