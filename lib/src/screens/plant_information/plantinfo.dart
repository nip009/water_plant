import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/src/screens/plant_information/components/body.dart';

//void main() => runApp(PlantInfo());

class PlantInfoScreen extends StatelessWidget {
  final Function notifyParent;
  Plant plant;

  PlantInfoScreen(this.plant, this.notifyParent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(plant.name),
        centerTitle: true,
      ),
      body: PlantInfoBody(
        plant: plant,
        notifyParent: notifyParent,
      ),
    );
  }
}
