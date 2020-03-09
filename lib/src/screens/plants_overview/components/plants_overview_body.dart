import 'package:flutter/material.dart';
import 'package:flutter_watering/src/screens/plant_info/plant_info.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/src/components/plant_info_card.dart';
import 'package:flutter_watering/constants.dart' as Constants;

/// A list overview of every single plant owned.
class PlantsOverviewScreenBody extends StatefulWidget {
  final List<Plant> plants;

  PlantsOverviewScreenBody(this.plants);

  @override
  _PlantsOverviewScreenStateBody createState() =>
      _PlantsOverviewScreenStateBody();
}

class _PlantsOverviewScreenStateBody extends State<PlantsOverviewScreenBody> {
  String appBarImageName = Constants.PLANT_NAME_2;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          forceElevated: true,
          elevation: 8,
          expandedHeight: 280,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Image.asset(
              appBarImageName,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            for (var plant in widget.plants)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlantInfoScreen(plant: plant)));
                },
                child: createPlantInfoCard(plant),
              ),
          ]),
        ),
      ],
    );
  }
}
