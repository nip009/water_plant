import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/components/change_name_alert_dialog.dart';
import 'package:water_plant/src/components/plant_info_card.dart';
import 'package:water_plant/src/components/water_status.dart';
import 'package:water_plant/constants.dart' as Constants;

class PlantsBelongingToTankScreen extends StatefulWidget {
  final WaterTankDevice tank;
  final Function callback;
  final Function removeTank;
  PlantsBelongingToTankScreen(this.tank, {this.callback, this.removeTank});

  @override
  _PlantsBelongingToTankScreenState createState() =>
      _PlantsBelongingToTankScreenState();
}

enum Options { edit_name, remove }

Options _selection = Options.remove;

class _PlantsBelongingToTankScreenState
    extends State<PlantsBelongingToTankScreen> {
  refreshState() {
    setState(() {});
    widget.callback();
  }

  addNewPlant() {
    if (widget.tank.plants.length <
        Constants.ALLOWED_NUMBER_OF_PLANTS_IN_TANK) {
      widget.tank.plants.add(
        //TODO: Let the user add a custom plant
        Plant(
          10,
          name: 'Emerald plant',
          latinName: 'Zamioculcas zamiifolia',
          imageName: Constants.PLANT_EMERALD_PALM,
        ),
      );
      refreshState();
    }
  }

  Widget addNewPlantButton() {
    return FloatingActionButton(
      mini: true,
      backgroundColor: Colors.white,
      child: Icon(
        Icons.add,
        color: Colors.black,
      ),
      onPressed: () => addNewPlant(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: kToolbarHeight,
            width: kToolbarHeight,
            child: Image.asset('assets/logo_white_background.png'),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<Options>(
            offset: Offset.fromDirection(0, 1),
            onSelected: (Options result) {
              _selection = result;
              if (_selection == Options.edit_name) {
                print("Edit name!");
                editObjectName(
                    context: context,
                    object: widget.tank,
                    maxLength: 22,
                    callback: refreshState);
              } else if (_selection == Options.remove) {
                print("Remove!");
                if (widget.removeTank != null) {
                  widget.removeTank(widget.tank);
                }
                refreshState();
                Navigator.pop(context);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
              const PopupMenuItem<Options>(
                value: Options.edit_name,
                child: Text('Edit name'),
              ),
              const PopupMenuItem<Options>(
                value: Options.remove,
                child: Text('Remove'),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                    alignment: Alignment.center,
                    child: Text(
                      '${widget.tank.name}',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 45),
                    child: WaterStatus(widget.tank.waterLevel),
                  ),
                  for (var plant in widget.tank.plants)
                    createPlantInfoCard(
                        context, plant, widget.tank, refreshState),
                  if (widget.tank.plants.length <
                      Constants.ALLOWED_NUMBER_OF_PLANTS_IN_TANK)
                    Container(
                      padding: EdgeInsets.all(10),
                      child: addNewPlantButton(),
                    )
                  else
                    Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
