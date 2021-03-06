import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/constants.dart' as Constants;

class PlantInformationScreen extends StatelessWidget {
  final Plant plant;

  PlantInformationScreen(this.plant);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: kToolbarHeight,
          width: kToolbarHeight,
          child: Image.asset('assets/logo_white_background.png'),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Constants.CARD_BACKGROUND_COLOR,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      '${plant.getPlantTypeName}',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Hero(
                          tag: plant.getPlantTypeImage,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                color: Constants.BORDER_COLOR,
                                width: 2,
                              ),
                            ),
                            constraints: BoxConstraints.loose(Size(180, 180)),
                            child: Image.asset(plant.getPlantTypeImage),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    child: Text(
                      plant.getPlantTypeLatinName,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'INFORMATION',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(90, 0, 90, 10),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text:
                                  'Ideal soil moisture: ${plant.idealHydrationLevel}%\n\n',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[800],
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'Placement: Away from direct sunlight.\n\n',
                                ),
                                TextSpan(
                                  text:
                                      'Watering habit: Not too often. Soil should be dry\n for periods of time.',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
