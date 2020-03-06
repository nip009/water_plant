import 'package:flutter/material.dart';
import 'package:flutter_watering/plante/plante.dart';
import 'package:flutter_watering/constants.dart' as Constants;

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int waterTankStatus = 80;

  static final List<MyPlant> myPlants = [
    MyPlant(
      7,
      name: 'Chinese Evergreen',
      imageName: Constants.PLANT_NAME_2,
    ),
    MyPlant(
      4,
      name: 'Zamioculcas zamiifolia',
      imageName: Constants.PLANT_NAME_4,
    ),
    MyPlant(
      6,
      name: 'Orchid',
      imageName: Constants.PLANT_NAME_2,
    ),
    MyPlant(
      10,
      name: 'Plante',
      imageName: Constants.PLANT_NAME_4,
    ),
    MyPlant(
      7,
      name: 'Chinese Evergreen',
      imageName: Constants.PLANT_NAME_2,
    ),
  ];

  Map<MyPlant, bool> isGrey = {
    for (MyPlant p in myPlants) p: false,
  };

  /// Helper function for [waterTankIndicator].
  List<Color> makeColorList(int waterLevel) {
    List<Color> list = [];
    for (int i = 0; i < 10; i++) {
      if (waterLevel > i * 10) {
        list.add(Colors.blue[500]);
      } else {
        list.add(Colors.grey);
      }
    }
    return list;
  }

  /// Creates a water tank status indicator.
  /// Shows percentagewise how much water is left in a water tank.
  Widget waterTankIndicator(int waterLevel) {
    return Row(
      children: <Widget>[
        for (Color c in makeColorList(waterLevel))
          new Expanded(
            child: Container(
              width: 20,
              color: c,
            ),
          ),
      ],
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
              isGrey[plant] = !isGrey[plant];
              /*if (waterTankStatus >= 10) {
                waterTankStatus -= 10;
              } else {
                waterTankStatus = 100;
              }*/
            });
          },
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 400),
            opacity: isGrey[plant] ? 0.0 : 1.0,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                                  "$waterTankStatus" + " %",
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
                                    child: waterTankIndicator(waterTankStatus),
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
                                      for (MyPlant plant in myPlants)
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
      ),
    );
  }
}
