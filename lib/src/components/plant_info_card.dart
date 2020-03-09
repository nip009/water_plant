import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/plant/plant.dart';

Widget createPlantInfoCard(Plant plant) {
  return Container(
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 8,
      color: Colors.grey,
      margin: EdgeInsets.all(10),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(10),
        width: 120,
        height: 120,
        child: Row(
          children: <Widget>[
            ClipOval(
              child: Image.asset(plant.imageName),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      //alignment: Alignment.centerLeft,
                      //color: Colors.white,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          plant.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 40,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.bottomCenter,
                        //color: Colors.blueGrey,
                        child: Row(
                          children: <Widget>[
                            for (var box
                                in createWaterStatusBars(plant.hydration))
                              Container(padding: EdgeInsets.all(5), child: box),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Returns the bars that represent how hydrated a plant is
List<Widget> createWaterStatusBars(int hydration) {
  Color emptyColor = Colors.blueGrey[100];
  Color fillColor = Colors.blue;
  List<Widget> bars = [];
  for (var i = 0; i < 10; i++) {
    Color color = hydration > i ? fillColor : emptyColor;
    bars.add(
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        width: 10,
        height: 25,
      ),
    );
  }
  return bars;
}
