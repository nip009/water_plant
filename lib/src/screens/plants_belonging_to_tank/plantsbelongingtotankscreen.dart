import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/watertankdevice/watertankdevice.dart';
import 'package:flutter_watering/src/components/plantinfocard.dart';

class PlantsBelongingToTankScreen extends StatelessWidget {
  final WaterTankDevice tank;
  PlantsBelongingToTankScreen(this.tank);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        for (var plant in tank.plants)
          GestureDetector(child: createPlantInfoCard(plant)),
      ],
    ));
  }
}
