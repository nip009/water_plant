import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/components/plant_info_card.dart';
import 'package:water_plant/src/components/water_status.dart';
import 'package:water_plant/constants.dart' as Constants;

class PlantsBelongingToTankScreen extends StatefulWidget {
  final WaterTankDevice tank;
  final Function callback;
  PlantsBelongingToTankScreen(this.tank, {this.callback});

  @override
  _PlantsBelongingToTankScreenState createState() =>
      _PlantsBelongingToTankScreenState();
}

class _PlantsBelongingToTankScreenState
    extends State<PlantsBelongingToTankScreen> {
  refreshState() {
    setState(() {});
    widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              if (widget.tank.plants.length < 5) {
                widget.tank.plants.add(
                  //TODO: Let the user add a custom plant
                  Plant(
                    60,
                    name: 'Plante',
                    imageName: Constants.PLANT_NAME_2,
                  ),
                );
                refreshState();
              }
            },
            child: Container(
              padding: EdgeInsets.only(right: 15),
              child: Row(
                children: <Widget>[
                  Text(
                    'Plant ',
                    style: TextStyle(fontSize: 16),
                  ),
                  ClipOval(
                    child: Container(
                      color: Colors.white,
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text(
                      '${widget.tank.name}',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: WaterStatus(widget.tank.waterLevel),
                  ),
                  for (var plant in widget.tank.plants)
                    createPlantInfoCard(
                        context, plant, widget.tank, refreshState),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
