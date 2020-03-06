import 'package:flutter/material.dart';
import 'package:flutter_watering/plante/plante.dart';

class PlantHero extends StatelessWidget {
  final MyPlant plant;

  PlantHero(this.plant);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Om planten'),
        centerTitle: true,
        //leading: MyAnimatedArrow(),
        //MyAnimatedIcon(),
      ),
      body: Container(
        color: Colors.grey[400],
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Hero(
                    tag: 'dash',
                    child: Container(
                      constraints: BoxConstraints.loose(Size(350, 350)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(plant.imageName),
                      ),
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
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Her har vi massevis av informasjon om det du nettop trykka på. So bra! Kanskje du lurer på noke spesielt? Då står det forhåpentligvis her. Meir informasjon er på vei!",
                      style: TextStyle(
                        fontSize: 16,
                      ),
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
