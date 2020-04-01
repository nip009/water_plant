import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';

class PlantSoilMoistureText extends StatelessWidget {
  const PlantSoilMoistureText({
    Key key,
    @required this.plant,
  }) : super(key: key);

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Soil moisture: ',
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 18,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '${plant.hydration}%',
            style: TextStyle(
              color:
                  plant.isHydrationCritical() ? Colors.red : Colors.grey[700],
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
