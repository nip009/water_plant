import 'package:flutter/material.dart';
import 'package:flutter_watering/src/screens/plant_hero/plant_hero.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/constants.dart' as Constants;

import 'dart:math';

class PlantInfoBody extends StatefulWidget {
  final Plant plant;
  final Function callback;

  PlantInfoBody({Key key, @required this.plant, @required this.callback})
      : super(key: key);

  @override
  _PlantInfoBodyState createState() => _PlantInfoBodyState();
}

class _PlantInfoBodyState extends State<PlantInfoBody> {
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
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
                child: CircularPlantPicture(widget: widget),
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
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(),
                            child: const Text(
                              'Fuktighet',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Container(
                              child: WaterStatus(widget.plant.hydration),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: waterButton(isDark),
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

  Container waterButton(bool isDark) {
    return Container(
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
                  border: Border.all(color: Constants.BORDER_COLOR, width: 3),
                ),
                child: Container(
                  child: RaisedButton(
                    color: isDark
                        ? Constants.WATER_LEVEL_FILL_DARK_THEME
                        : Constants.WATER_LEVEL_FILL_LIGHT_THEME,
                    onPressed: () {
                      print('Vanner plante');
                      setState(() {
                        widget.plant.waterPlant();
                        widget.callback();
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
    );
  }
}

class CircularPlantPicture extends StatelessWidget {
  const CircularPlantPicture({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final PlantInfoBody widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Hero(
        tag: widget.plant.imageName,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            border: Border.all(
              color: Constants.BORDER_COLOR,
              width: 3,
            ),
          ),
          height: 250,
          child: ClipOval(
            child: Container(child: Image.asset(widget.plant.imageName)),
          ),
        ),
      ),
    );
  }
}

class WaterStatus extends StatelessWidget {
  final int hydration;

  WaterStatus(this.hydration);

  List<Widget> createWaterStatusBars(BuildContext context) {
    List<Widget> bars = [];
    Color color;
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color emptyColor = isDark
        ? Constants.WATER_LEVEL_EMPTY_DARK_THEME
        : Constants.WATER_LEVEL_EMPTY_LIGHT_THEME;
    Color fillColor = isDark
        ? Constants.WATER_LEVEL_FILL_DARK_THEME
        : Constants.WATER_LEVEL_FILL_LIGHT_THEME;
    for (var i = 0; i < 10; i++) {
      double hyd = hydration / 10;
      hyd > i ? color = fillColor : color = emptyColor;
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
                for (var bar in createWaterStatusBars(context))
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
