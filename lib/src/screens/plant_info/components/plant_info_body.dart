import 'package:flutter/material.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/components/plant_soil_moisture_text.dart';
import 'package:water_plant/src/screens/plant_hero/plant_hero.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/src/components/water_status.dart';
import 'package:water_plant/constants.dart' as Constants;

import 'dart:math';

class PlantInfoBody extends StatefulWidget {
  final Plant plant;
  final WaterTankDevice tank;
  final Function callback;

  PlantInfoBody(
      {Key key,
      @required this.plant,
      @required this.tank,
      @required this.callback})
      : super(key: key);

  @override
  _PlantInfoBodyState createState() => _PlantInfoBodyState();
}

class _PlantInfoBodyState extends State<PlantInfoBody> {
  @override
  Widget build(BuildContext context) {
    bool automaticWatering = widget.plant.isAutomaticWateringActive();
    return Container(
      child: Column(
        children: <Widget>[
          PlantNameAndInfoButton(widget: widget),
          Expanded(
            flex: 2,
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
                child: PlantPicture(widget: widget),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Auto:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Checkbox(
                  value: automaticWatering,
                  onChanged: (bool value) {
                    setState(() {
                      widget.plant.automaticWatering = value;
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  decoration: BoxDecoration(),
                  child: PlantSoilMoistureText(plant: widget.plant),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 85, bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Device: ${widget.tank.name}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      child: WaterStatus(
                        widget.plant.hydration,
                        paddingWidth: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Transform.rotate(
                angle: pi / 4.0,
                child: waterButton(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget waterButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.plant.waterPlant();
          widget.callback();
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Constants.BORDER_COLOR,
              width: 2,
            )),
        child: Transform.rotate(
          angle: -pi / 2.0,
          child: Container(
            padding: EdgeInsets.all(5),
            child: Image.asset(
              'assets/water_plant_button_image.png',
              scale: 3,
            ),
          ),
        ),
      ),
    );
  }

  Widget waterButton2() {
    return Align(
      alignment: Alignment.topCenter,
      child: Transform.rotate(
        angle: pi / 4.0,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: Constants.BORDER_COLOR,
              width: 2,
            ),
          ),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                widget.plant.waterPlant();
                widget.callback();
              });
            },
            child: Transform.rotate(
              angle: -pi / 2.0,
              child: ImageIcon(
                AssetImage(
                  'assets/water_plant_button_image.png',
                ),
                semanticLabel:
                    'Button that tells your device to water the plant',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PlantNameAndInfoButton extends StatelessWidget {
  const PlantNameAndInfoButton({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final PlantInfoBody widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.info,
            color: Constants.LIGHT_GREEN_COLOR,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return PlantHeroScreen(widget.plant);
                },
              ),
            );
          },
          iconSize: 30,
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 20,
            bottom: 20,
            right: 47,
          ),
          child: Text(
            '${widget.plant.name}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }
}

class PlantPicture extends StatelessWidget {
  const PlantPicture({
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
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
              color: Constants.BORDER_COLOR,
              width: 2.5,
            ),
          ),
          height: 250,
          child: ClipRRect(
            child: Container(child: Image.asset(widget.plant.imageName)),
          ),
        ),
      ),
    );
  }
}
