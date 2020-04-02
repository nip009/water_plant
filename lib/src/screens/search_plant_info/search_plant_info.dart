import 'package:flutter/material.dart';
import 'package:water_plant/src/screens/search_plant_info/components/search_plant_info_body.dart';

class SearchPlantInfo extends StatelessWidget {
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
      body: SearchPlantInfoBody(),
    );
  }
}
