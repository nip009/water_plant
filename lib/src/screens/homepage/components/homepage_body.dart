import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/screens/plants_belonging_to_tank/plants_belonging_to_tank.dart';
import 'package:water_plant/constants.dart' as Constants;
import 'package:water_plant/src/components/change_name_alert_dialog.dart';
import 'package:water_plant/src/components/water_status.dart';

class HomePageBody extends StatefulWidget {
  final List<WaterTankDevice> tanks;
  HomePageBody(this.tanks) {
    for (WaterTankDevice tank in tanks) {
      assert(tank != null);
    }
  }

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.tanks != null);
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
          GestureDetector(
            onTap: () => addNewTank(),
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
          Expanded(
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

  void addNewTank() {
    List<Plant> plants = [
      Plant(10,
          name: "Emerald plant",
          latinName: 'Zamioculcas zamiifolia',
          imageName: Constants.PLANT_NAME_2),
      Plant(10,
          name: "Orchid",
          latinName: 'Orchidaceae',
          imageName: Constants.PLANT_NAME_4),
      Plant(20,
          name: "Emerald plant",
          latinName: 'Zamioculcas zamiifolia',
          imageName: Constants.PLANT_NAME_2),
      Plant(20,
          name: "Emerald plant",
          latinName: 'Zamioculcas zamiifolia',
          imageName: Constants.PLANT_NAME_2),
    ];
    if (plants.length > Constants.ALLOWED_NUMBER_OF_PLANTS_IN_TANK) {
      print('Too many plants added to the tank');
      return;
    }
    WaterTankDevice tank = WaterTankDevice('Kjøkken', plants, 40);
    setState(() {
      widget.tanks.add(tank);
    });
  }

  List<Plant> plantsThatNeedWatering(WaterTankDevice tank) {
    List<Plant> plantsWithCriticalWaterLevel = [];
    for (Plant plant in tank.plants) {
      assert(plant != null);
      if (plant.isHydrationCritical()) {
        plantsWithCriticalWaterLevel.add(plant);
      }
    }
    return plantsWithCriticalWaterLevel;
  }

  /// Shows an overview of a [WaterTankDevice]. Displays the water level in the
  /// tank, the name of the tank and the plant(s) that belong to it.
  Widget tankOverviewCard(WaterTankDevice tank) {
    return Card(
      elevation: 10,
      child: InkWell(
        onLongPress: () {
          editObjectName(context: context, object: tank, callback: refresh);
        },
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlantsBelongingToTankScreen(
              tank,
              callback: refresh,
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
                      children: tank.isEveryPlantAboveCriticalWaterLevel()
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
                          : plantsThatNeedWatering(tank)
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
        Container(
          padding: EdgeInsets.only(bottom: 5),
          child: plant.isHydrationCritical()
              ? Text(
                  '${plant.hydration}%',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                )
              : null,
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
          Positioned(
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
          ),
        ],
      ),
    );
  }
}
