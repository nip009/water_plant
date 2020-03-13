import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/watertankdevice/water_tank_device.dart';
import 'package:flutter_watering/src/components/plant_info_card.dart';
import 'package:flutter_watering/src/screens/plant_info/plant_info.dart';

class PlantsBelongingToTankScreen extends StatefulWidget {
  final WaterTankDevice tank;
  PlantsBelongingToTankScreen(this.tank);

  @override
  _PlantsBelongingToTankScreenState createState() =>
      _PlantsBelongingToTankScreenState();
}

class _PlantsBelongingToTankScreenState
    extends State<PlantsBelongingToTankScreen> {
  refreshState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.tank.name}'),
        centerTitle: true,
      ),
      body: Container(
        //color: Constants.SCAFFOLD_BACKGROUND_COLOR,
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
                        builder: (context) => PlantInfoScreen(
                            plant: plant, callback: refreshState),
                      ),
                    );
                  },
                  child: createPlantInfoCard(context, plant),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
