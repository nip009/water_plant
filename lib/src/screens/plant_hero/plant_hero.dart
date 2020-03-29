import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/constants.dart' as Constants;

class PlantHeroScreen extends StatelessWidget {
  final Plant plant;

  PlantHeroScreen(this.plant);

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text('Om planten'),
        centerTitle: true,
      ),
      body: Container(
        color: isDark ? Colors.grey[850] : Constants.CARD_BACKGROUND_COLOR,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Hero(
                    tag: plant.imageName,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Constants.BORDER_COLOR,
                          width: 3,
                        ),
                      ),
                      constraints: BoxConstraints.loose(Size(320, 320)),
                      child: Image.asset(plant.imageName),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Divider(
                thickness: 2,
              ),
            ),
            Container(
              child: Flexible(
                child: Card(
                  //color: Colors.white70,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Text(
                          "Her har vi massevis av informasjon om det du nettop trykka på. So bra! Kanskje du lurer på noke spesielt? Då står det forhåpentligvis her. Meir informasjon er på vei!",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
