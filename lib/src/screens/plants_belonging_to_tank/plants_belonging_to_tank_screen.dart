import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/objects/watertankdevice/water_tank_device.dart';
import 'package:flutter_watering/src/components/plant_info_card.dart';
import 'package:flutter_watering/constants.dart' as Constants;

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
        title: Text('${widget.tank.name}'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            for (var plant in widget.tank.plants)
              Container(
                width: double.infinity,
                child: createPlantInfoCard(
                    context, plant, widget.tank, refreshState),
              ),
            Center(
              child: widget.tank.plants.length < 5
                  ? IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
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
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
