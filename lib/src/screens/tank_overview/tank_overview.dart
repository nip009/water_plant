import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/components/plant_info_card.dart';
import 'package:water_plant/src/components/water_status.dart';
import 'package:water_plant/constants.dart' as Constants;
import 'package:water_plant/src/screens/tank_overview/components/add_new_plant.dart';
import 'package:water_plant/src/screens/tank_overview/components/edit_tank.dart';

class TankOverview extends StatefulWidget {
  final WaterTankDevice tank;
  final Function callback;
  final Function removeTank;
  TankOverview(this.tank, {this.callback, this.removeTank});

  @override
  _TankOverviewState createState() => _TankOverviewState();
}

class _TankOverviewState extends State<TankOverview> {
  refreshState() {
    setState(() {});
    widget.callback();
  }

  removeTank(WaterTankDevice tank) {
    setState(() {
      widget.removeTank(tank);
    });
    refreshState();
  }

  addNewPlant(Plant plant) {
    assert(plant != null);
    assert(plant.plantTypeInfo != null);
    if (widget.tank.plants.length <
        Constants.ALLOWED_NUMBER_OF_PLANTS_IN_TANK) {
      widget.tank.plants.add(plant);
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
      onPressed: () => _navigateAndDisplaySnackbar(
          context, () => AddNewPlant(widget.tank, addNewPlant)),
    );
  }

  _navigateAndDisplaySnackbar(BuildContext context, Function goToPage) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => goToPage(),
        ));

    if (result != null) {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(
            "$result",
          ),
          backgroundColor: Constants.WATER_LEVEL_FILL_LIGHT_THEME,
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: kToolbarHeight,
          width: kToolbarHeight,
          child: Image.asset('assets/logo_white_background.png'),
        ),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              _navigateAndDisplaySnackbar(
                context,
                () => EditTank(
                  tank: widget.tank,
                  removeTank: widget.removeTank,
                  showDeleteButton: true,
                  tankName: widget.tank.nickname,
                  refreshState: refreshState,
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.edit,
              ),
            ),
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
                      '${widget.tank.nickname}',
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
                    CreatePlantInfoCard(
                        context: context,
                        plant: plant,
                        tank: widget.tank,
                        callback: refreshState),
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
