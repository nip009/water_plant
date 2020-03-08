import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/objects/watertankdevice/watertankdevice.dart';
import 'package:flutter_watering/src/screens/homepage/components/watertankindicator.dart';

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
    return ListView(
      children: <Widget>[
        for (var tank in widget.tanks) tankOverviewCard(tank),
      ],
    );
  }

  /// Shows an overview of a [WaterTankDevice]. Displays the water level in the
  /// tank, the name of the tank and the plant(s) that belong to it.
  Widget tankOverviewCard(WaterTankDevice tank) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(left: 5, right: 5, top: 10),
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[300],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  tank.name,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Text(
                    "${tank.waterLevel}" + " %",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.grey,
                    child: Container(
                      color: Colors.blue[500],
                      width: 300,
                      child: waterTankIndicator(tank.waterLevel),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                flex: 4,
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
