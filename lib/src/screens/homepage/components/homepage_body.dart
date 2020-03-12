import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/objects/watertankdevice/water_tank_device.dart';
import 'package:flutter_watering/src/screens/homepage/components/water_tank_indicator.dart';
import 'package:flutter_watering/src/screens/plants_belonging_to_tank/plants_belonging_to_tank_screen.dart';
import 'package:flutter_watering/constants.dart' as Constants;

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
  @override
  Widget build(BuildContext context) {
    assert(widget.tanks != null);
    return Container(
      decoration: BoxDecoration(
          //color: Constants.SCAFFOLD_BACKGROUND_COLOR,
          //color: Colors.white70,
          /*gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(1, 1),
          colors: [
            Colors.green[400],
            Colors.green[900],
          ],
          tileMode: TileMode.repeated,
        ),*/
          ),
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
                for (var tank in widget.tanks)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PlantsBelongingToTankScreen(tank)),
                      );
                    },
                    child: tankOverviewCard(tank),
                  ),
              ],
            ),
          ),
          /*Container(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.centerRight,
              child: ClipOval(
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.blue,
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // get the option to add a new tank
                    },
                  ),
                ),
              ),
            ),
          ),
          //),*/
        ],
      ),
    );
  }

  /// Shows an overview of a [WaterTankDevice]. Displays the water level in the
  /// tank, the name of the tank and the plant(s) that belong to it.
  Widget tankOverviewCard(WaterTankDevice tank) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(0.0),
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                child: RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '${tank.name} ',
                          style: TextStyle(fontSize: 30),
                        ),
                        TextSpan(
                          text: '${tank.waterLevel} %',
                          style: TextStyle(fontSize: 20),
                        )
                      ]),
                ),
                /*Text(
                          "${tank.name} ${tank.waterLevel}" + " %",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),*/
              ),
            ),
            Expanded(
              flex: 4,
              child: waterTankIndicator(tank.waterLevel),
            ),
            Spacer(),
            Expanded(
              flex: 5,
              child: Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      for (Plant plant in tank.plants) plantIcon(plant),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Creates a clickable plant icon which contains a picture of the
  /// incoming [Plant] object. Clicking the icon results in watering the plant
  /// and the icon disappearing.
  Widget plantIcon(Plant plant) {
    return SizedBox(
      width: 75,
      height: 75,
      child: ClipRRect(
        child: GestureDetector(
          onTap: () {
            setState(() {
              plant.isGrey = !plant.isGrey;
              /*if (waterTankStatus >= 10) {
                    waterTankStatus -= 10;
                  } else {
                    waterTankStatus = 100;
                  }*/
            });
          },
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 400),
            opacity: plant.isGrey ? 0.0 : 1.0,
            child: Container(
              /*foregroundDecoration: BoxDecoration(
                      color: Colors.grey,
                      backgroundBlendMode: BlendMode.saturation,
                    ),*/
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.5,
                  color: Colors.black54,
                ),
              ),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
              padding: EdgeInsets.all(0),
              child: Image.asset(plant.imageName, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
