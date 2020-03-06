import 'package:flutter/material.dart';
import 'package:flutter_watering/src/screens/plant_hero/planthero.dart';
import 'package:flutter_watering/plante/plante.dart';

import 'dart:math';

class PlantInfoBody extends StatefulWidget {
  PlantInfoBody(
      {Key key, this.title, @required this.plant, @required this.notifyParent})
      : super(key: key);

  final String title;
  final MyPlant plant;
  final Function notifyParent;

  @override
  _PlantInfoBodyState createState() => _PlantInfoBodyState();
}

class _PlantInfoBodyState extends State<PlantInfoBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[400],
              ),
              child: Hero(
                tag: 'dash',
                child: Container(
                  //color: Colors.green,
                  alignment: Alignment.center,
                  constraints:
                      BoxConstraints.tightFor(width: 200.0, height: 200.0),
                  child: Opacity(
                    opacity: 1,
                    child: ClipOval(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.plant.hydration = 5;
                            widget.notifyParent();
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) {
                                return PlantHero(widget.plant);
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: 250,
                          //width: 100,
                          child: Image.asset(widget.plant.imageName),
                        ),
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
              color: Colors.green[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Divider(
                    thickness: 2,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(),
                            child: Text(
                              'Fuktighet',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
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
                                child: RaisedButton(
                                  color: Colors.lime[300],
                                  onPressed: () {
                                    print('Vanner plante');
                                    setState(() {
                                      widget.plant.waterPlant();
                                    });
                                  },
                                  child: Transform.rotate(
                                    angle: -pi / 4.0,
                                    child: Icon(Icons.local_drink),
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
      hydration > i ? color = Colors.blue : color = Colors.blueGrey[100];
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
        color: Colors.grey[400],
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
