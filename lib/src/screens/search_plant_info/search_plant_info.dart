import 'package:flutter/material.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/screens/search_plant_info/components/search_plant_info_body.dart';

class SearchPlantInfo extends StatelessWidget {
  final List<WaterTankDevice> tanks;
  SearchPlantInfo(this.tanks) {
    for (WaterTankDevice tank in tanks) {
      assert(tank != null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SearchPlantInfoBody(tanks),
    );
  }
}
