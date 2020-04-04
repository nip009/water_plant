import 'package:flutter/material.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';

class SearchPlantInfoBody extends StatefulWidget {
  List<WaterTankDevice> tanks;
  SearchPlantInfoBody(this.tanks);

  @override
  _SearchPlantInfoBodyState createState() => _SearchPlantInfoBodyState();
}

class _SearchPlantInfoBodyState extends State<SearchPlantInfoBody> {
  @override
  Widget build(BuildContext context) {
    double _height = 100;
    return Container(
      child: ListView.builder(
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              height: _height,
              child: Card(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                              width: 1,
                            )),
                        child: Image.asset(
                          'plant2.jpg',
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'PLANTENAVN',
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Latinsk navn',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
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
          );
        },
      ),
    );
  }
}
