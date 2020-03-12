import 'package:flutter/material.dart';
import 'package:flutter_watering/src/screens/plant_hero/plant_hero.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/constants.dart' as Constants;

import 'dart:math';

class PlantInfoBody extends StatefulWidget {
  final String title;
  final Plant plant;

  PlantInfoBody({Key key, this.title, @required this.plant}) : super(key: key);

  @override
  _PlantInfoBodyState createState() => _PlantInfoBodyState();
}

class _PlantInfoBodyState extends State<PlantInfoBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Constants.CARD_BACKGROUND_COLOR,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(),
              child: Hero(
                tag: widget.plant.imageName,
                child: Container(
                  alignment: Alignment.center,
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return PlantHeroScreen(widget.plant);
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          border: Border.all(
                            color: Constants.BORDER_COLOR,
                            width: 3,
                          ),
                        ),
                        padding: EdgeInsets.all(0),
                        height: 250,
                        child: ClipOval(
                          child: Container(
                              child: Image.asset(widget.plant.imageName)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    /*Divider(
                      thickness: 2,
                    ),*/
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              decoration: BoxDecoration(),
                              child: const Text(
                                'Fuktighet',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            child: Container(
                                child: WaterStatus(widget.plant.hydration)),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //color: Colors.red,
                        child: Container(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Transform.rotate(
                                angle: pi / 4.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Constants.BORDER_COLOR,
                                        width: 3),
                                  ),
                                  child: Container(
                                    child: RaisedButton(
                                      color: Colors.blue[600],
                                      onPressed: () {
                                        print('Vanner plante');
                                        setState(() {
                                          widget.plant.waterPlant();
                                        });
                                      },
                                      child: Transform.rotate(
                                        angle: -pi / 4.0,
                                        child: Icon(
                                          Icons.local_drink,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
    );
  }
}

class WaterStatus extends StatelessWidget {
  final int hydration;

  WaterStatus(this.hydration);

  List<Widget> createWaterStatusBars() {
    List<Widget> bars = [];
    Color color;
    for (var i = 0; i < 10; i++) {
      hydration > i ? color = Colors.blue[600] : color = Colors.white70;
      bars.add(
        Container(
          width: 15,
          height: 37,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
        ),
      );
    }
    return bars;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Constants.CARD_BACKGROUND_COLOR,
        border: Border.all(
          color: Constants.BORDER_COLOR,
          width: 3,
        ),
      ),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                for (var bar in createWaterStatusBars())
                  Container(
                      padding: EdgeInsets.fromLTRB(4, 0, 4, 0), child: bar),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
