import 'package:flutter/material.dart';
import 'package:flutter_watering/plante/plante.dart';
import 'package:flutter_watering/src/screens/homepage/components/watertankindicator.dart';

class HomePageBody extends StatefulWidget {
  List<MyPlant> myPlants;
  int waterTankStatus;
  Map<MyPlant, bool> isGrey;

  HomePageBody(List<MyPlant> myPlants, int waterTankStatus) {
    this.myPlants = myPlants;
    this.waterTankStatus = waterTankStatus;
    isGrey = {
      for (MyPlant p in myPlants) p: false,
    };
  }

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.green[700],
            child: Column(
              children: <Widget>[
                Align(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(left: 5, right: 5, top: 10),
                      width: double.infinity,
                      height: 300,
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
                              'Stue',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Text(
                                "${widget.waterTankStatus}" + " %",
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
                                  child: waterTankIndicator(
                                      widget.waterTankStatus),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    for (MyPlant plant in widget.myPlants)
                                      plantIcon(plant),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
    );
  }

  Widget plantIcon(MyPlant plant) {
    return SizedBox(
      width: 75,
      height: 75,
      child: ClipRRect(
        child: GestureDetector(
          onTap: () {
            setState(() {
              widget.isGrey[plant] = !widget.isGrey[plant];
              /*if (waterTankStatus >= 10) {
                waterTankStatus -= 10;
              } else {
                waterTankStatus = 100;
              }*/
            });
          },
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 400),
            opacity: widget.isGrey[plant] ? 0.0 : 1.0,
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
