import 'package:flutter/material.dart';

class SearchPlantInfoBody extends StatefulWidget {
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
              color: Colors.green,
              height: _height,
            ),
          );
        },
      ),
    );
  }
}
