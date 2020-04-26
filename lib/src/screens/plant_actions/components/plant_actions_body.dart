import 'package:flutter/material.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/components/plant_soil_moisture_text.dart';
import 'package:water_plant/src/screens/plant_information/plant_information.dart';
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
                        return PlantInformationScreen(widget.plant);
                      },
                    ),
                  );
                },
                child: PlantPicture(widget: widget),
              ),
            ),
          ),
          Expanded(
            child: Container(
              constraints: BoxConstraints.loose(
                Size.fromWidth(300),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
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
                            decoration: BoxDecoration(),
                            child: PlantSoilMoisturePercentage(
                              plant: widget.plant,
                              spaceBeforeText: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10, bottom: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Device: ${widget.tank.nickname} (Pipe ${widget.tank.pipeConnections[widget.plant]})',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Container(
                                  child: WaterStatus(
                                    widget.tank.waterLevel,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Transform.rotate(
                  angle: pi / 4.0,
                  child: waterButton(),
                ),
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
              semanticLabel:
                  'Button that tells your device to water this plant',
              scale: 3,
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
                  return PlantInformationScreen(widget.plant);
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
            '${widget.plant.nickname}',
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
        tag: widget.plant.chosenImageFile == null
            ? widget.plant.getPlantTypeImage
            : widget.plant.chosenImageFile,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
              color: Constants.BORDER_COLOR,
              width: 2.5,
            ),
          ),
          child: ClipRRect(
            child: Container(
              child: widget.plant.chosenImageFile == null
                  ? Image.asset(widget.plant.getPlantTypeImage)
                  : Image.file(
                      widget.plant.chosenImageFile,
                      cacheHeight: 200,
                      cacheWidth: 200,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
