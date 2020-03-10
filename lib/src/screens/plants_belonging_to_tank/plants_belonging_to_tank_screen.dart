import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/watertankdevice/water_tank_device.dart';
import 'package:flutter_watering/src/components/plant_info_card.dart';
import 'package:flutter_watering/src/screens/plant_info/plant_info.dart';
import 'package:flutter_watering/constants.dart' as Constants;

class PlantsBelongingToTankScreen extends StatefulWidget {
  final WaterTankDevice tank;
  PlantsBelongingToTankScreen(this.tank);

  @override
  _PlantsBelongingToTankScreenState createState() =>
      _PlantsBelongingToTankScreenState();
}

class _PlantsBelongingToTankScreenState
    extends State<PlantsBelongingToTankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.tank.name}'),
        centerTitle: true,
      ),
      body: Container(
        color: Constants.BACKGROUND_COLOR,
        child: ListView(
          children: <Widget>[
            for (var plant in widget.tank.plants)
              Container(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlantInfoScreen(plant: plant),
                      ),
                    );
                  },
                  child: createPlantInfoCard(plant),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
