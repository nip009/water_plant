import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/screens/tank_overview/components/edit_tank.dart';
import 'package:water_plant/src/screens/tank_overview/tank_overview.dart';
import 'package:water_plant/src/components/water_status.dart';

class OverviewBody extends StatefulWidget {
  final List<WaterTankDevice> tanks;
  OverviewBody(this.tanks);

  @override
  _OverviewBodyState createState() => _OverviewBodyState();
}

class _OverviewBodyState extends State<OverviewBody> {
  refresh() {
    setState(() {});
  }

  addTank(WaterTankDevice tank) {
    assert(tank != null);
    setState(() {
      widget.tanks.add(tank);
    });
  }

  removeTank(WaterTankDevice tank) {
    assert(tank != null);
    setState(() {
      if (widget.tanks.contains(tank)) {
        widget.tanks.remove(tank);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.tanks != null);
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditTank(addTank: addTank),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(right: 15),
              child: Row(
                children: <Widget>[
                  Text(
                    'Device  ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
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
      body: Column(
        children: <Widget>[
          widget.tanks.length == 0
              ? Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                        'Press the button in the top right to add a new device'),
                  ),
                )
              : Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 10, // space above the list of tank cards
                      ),
                      for (var tank in widget.tanks) tankOverviewCard(tank),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  List<Plant> getPlantsThatNeedWatering(WaterTankDevice tank) {
    List<Plant> plantsThatNeedWatering = [];
    for (Plant plant in tank.plants) {
      assert(plant != null);
      if (plant.isHydrationCritical() || plant.isHydrationLow()) {
        plantsThatNeedWatering.add(plant);
      }
    }
    return plantsThatNeedWatering;
  }

  /// Shows an overview of a [WaterTankDevice]. Displays the water level in the
  /// tank, the name of the tank and the plant(s) that belong to it.
  Widget tankOverviewCard(WaterTankDevice tank) {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TankOverview(
              tank,
              callback: refresh,
              removeTank: removeTank,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(0.0),
          height: 210,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 5),
                child: RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '${tank.name} ',
                          style: TextStyle(fontSize: 30),
                        ),
                      ]),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: WaterStatus(tank.waterLevel)),
              Expanded(
                child: Container(
                  width: 300,
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: tank.isEveryPlantAboveLowWaterLevel()
                          ? [
                              Container(
                                alignment: Alignment(1, -0.3),
                                padding: EdgeInsets.only(left: 55),
                                child: Text(
                                  'No plants need watering',
                                  style: TextStyle(fontSize: 18),
                                ),
                              )
                            ]
                          : getPlantsThatNeedWatering(tank)
                              .map((plant) => plantIcon(plant))
                              .toList()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Creates a clickable plant icon which contains a picture of the
  /// incoming [Plant] object. Clicking the icon results in watering the plant
  /// and the icon disappearing and becoming unclickable.
  Widget plantIcon(Plant plant) {
    return Column(
      children: <Widget>[
        Container(
          width: 75,
          height: 75,
          child: GestureDetector(
            onTap: () {
              setState(() {
                plant.waterPlant();
              });
            },
            child: plantInPicFrame(plant),
          ),
        ),
        Expanded(
          child: Container(
              //color: Colors.red,
              alignment: Alignment.center,
              width: 75,
              height: 75,
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                '${plant.name}',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
              )),
        ),
      ],
    );
  }

  /// Helper method for [plantIcon].
  /// The picture represetning the plant in the tank.
  ClipRRect plantInPicFrame(Plant plant) {
    return ClipRRect(
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                plant.imageName,
              ),
            ),
          ),
          plant.isHydrationCritical()
              ? Positioned(
                  child: ClipOval(
                    child: Container(
                      color: Colors.red,
                      height: 15,
                      width: 15,
                      child: Center(
                        child: Text(
                          '!',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
