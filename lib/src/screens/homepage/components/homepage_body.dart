import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/screens/homepage/components/water_tank_indicator.dart';
import 'package:water_plant/src/screens/plants_belonging_to_tank/plants_belonging_to_tank_screen.dart';
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
        actions: <Widget>[
          GestureDetector(
            onTap: () => print("Create new device"),
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
      body: Container(
        /*decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(1, 1),
            colors: [
              Colors.green[700],
              Colors.green[900],
            ],
            tileMode: TileMode.repeated,
          ),
        ),*/
        /* decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue[700], Colors.blue[800]])),*/
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    height:
                        10, // to add some space above the list of tank cards
                  ),
                  for (var tank in widget.tanks) tankOverviewCard(tank),
                  Container(
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        addNewTank();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addNewTank() {
    List<Plant> plants = [
      Plant(100, name: "Plante2", imageName: Constants.PLANT_NAME_2),
      Plant(70, name: "Plante1", imageName: Constants.PLANT_NAME_4),
      Plant(70, name: "Plante1", imageName: Constants.PLANT_NAME_2),
      Plant(70, name: "Plante1", imageName: Constants.PLANT_NAME_4),
      Plant(70, name: "Plante1", imageName: Constants.PLANT_NAME_2),
    ];
    if (plants.length > 5) return;
    WaterTankDevice tank = WaterTankDevice('Kjøkken', plants, 40);
    setState(() {
      widget.tanks.add(tank);
    });
  }

  /// Shows an overview of a [WaterTankDevice]. Displays the water level in the
  /// tank, the name of the tank and the plant(s) that belong to it.
  Widget tankOverviewCard(WaterTankDevice tank) {
    return Card(
      shape: RoundedRectangleBorder(
          //borderRadius: BorderRadius.circular(20),
          ),
      //margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
      elevation: 3,
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
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(top: 10),
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
              ),
              Expanded(
                flex: 4,
                child: WaterStatus(tank.waterLevel),
                //waterTankIndicator(context, tank.waterLevel),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (Plant plant in tank.plants) plantIcon(plant),
                    ],
                  ),
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
        SizedBox(
          width: 75,
          height: 75,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            opacity: plant.isVisible ? 1.0 : 1.0,
            child: plant
                    .isVisible // TODO: switch to plant.hydration < recommended lowest moisture
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        plant.waterPlant();
                        plant.isVisible = false;
                      });
                    },
                    child: plantInPicFrame(plant),
                  )
                : plantInPicFrame(plant),
          ),
        ),

        // TODO: show if less than or close to recommended lowest moisture
        Container(
          //color: Colors.red,
          child: Text(
            '${plant.hydration}%',
          ),
        ),
      ],
    );
  }

  /// Helper method for [plantIcon].
  /// The picture represetning the plant in the tank.
  ClipRRect plantInPicFrame(Plant plant) {
    return ClipRRect(
      child: Container(
        width: 75,
        height: 75,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1.8,
            color: plant.isHydrationCritical() ? Colors.red : Colors.black,
          ),
        ),
        child: plant.isVisible
            ? Image.asset(plant.imageName, fit: BoxFit.contain)
            : null,
      ),
    );
  }
}
