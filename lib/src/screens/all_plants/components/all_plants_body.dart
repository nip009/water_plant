import 'package:flutter/material.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/src/components/plant_info_card.dart';
import 'package:water_plant/constants.dart' as Constants;

/// A list overview of every single plant owned.
class AllPlantsBody extends StatefulWidget {
  final List<WaterTankDevice> tanks;

  AllPlantsBody(this.tanks);

  @override
  _PlantsOverviewScreenStateBody createState() =>
      _PlantsOverviewScreenStateBody();
}

class _PlantsOverviewScreenStateBody extends State<AllPlantsBody> {
  String appBarImageName = Constants.PLANT_EMERALD_PALM;

  /// Sort plants by hydration
  List<Plant> sort(List<Plant> plants) {
    plants.sort((a, b) => a.hydration.compareTo(b.hydration));
    return plants;
  }

  refreshState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          for (WaterTankDevice tank in widget.tanks)
            for (Plant plant in tank.plants)
              CreatePlantInfoCard(
                context: context,
                plant: plant,
                tank: tank,
                callback: refreshState,
                showHydrationMessage: true,
              ),
        ],
      ),
    );
  }
}
