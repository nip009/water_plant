import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/watertankdevice/water_tank_device.dart';
import 'package:flutter_watering/src/components/change_name_alert_dialog.dart';
import 'package:flutter_watering/src/components/plant_info_card.dart';
import 'package:flutter_watering/src/screens/plant_info/plant_info.dart';

enum Options { edit_name, remove }

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
  }

  Options _selection = Options.remove;

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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PlantInfoScreen(plant: plant, callback: refreshState),
                    ),
                  );
                },
                onLongPress: () {
                  PopupMenuButton<Options>(
                    onSelected: (Options result) {
                      setState(() {
                        _selection = result;
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<Options>>[
                      const PopupMenuItem<Options>(
                        value: Options.edit_name,
                        child: Text('Edit name'),
                      ),
                      const PopupMenuItem<Options>(
                        value: Options.remove,
                        child: Text('Remove'),
                      ),
                    ],
                  );
                  if (_selection == Options.edit_name) {
                    print("Edit name!");
                    editObjectName(
                        context: context, object: plant, maxLength: 25);
                  } else if (_selection == Options.remove) {
                    print("Remove!");
                    setState(() {
                      widget.tank.plants.remove(plant);
                      widget.callback();
                    });
                  }
                },
                child: Container(
                  width: double.infinity,
                  child: GestureDetector(
                    child: createPlantInfoCard(context, plant),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
