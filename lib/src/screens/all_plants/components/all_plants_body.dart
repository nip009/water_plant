import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/src/components/plant_info_card.dart';

/// A list overview of every single plant owned.
class AllPlantsBody extends StatefulWidget {
  final List<WaterTankDevice> tanks;

  AllPlantsBody(this.tanks);

  @override
  _PlantsOverviewScreenStateBody createState() =>
      _PlantsOverviewScreenStateBody();
}

class _PlantsOverviewScreenStateBody extends State<AllPlantsBody> {
  /// Sort plants by hydration
  List<Plant> sort(List<Plant> plants) {
    plants.sort((a, b) => a.hydration.compareTo(b.hydration));
    return plants;
  }

  refreshState() {
    if (mounted) {
      setState(() {});
    }
  }

  //Sort by plant hydration. Returns a map of Plant and its WaterTankDevice.
  sortMap(Map<Plant, WaterTankDevice> map) {
    var sortedKeys = map.keys.toList(growable: false)
      ..sort((k1, k2) => k1.hydration.compareTo(k2.hydration));
    LinkedHashMap sortedMap = new LinkedHashMap.fromIterable(sortedKeys,
        key: (k) => k, value: (k) => map[k]);

    return sortedMap;
  }

  @override
  Widget build(BuildContext context) {
    Map<Plant, WaterTankDevice> tankPlantMap = {};
    for (WaterTankDevice tank in widget.tanks) {
      for (Plant plant in tank.plants) {
        tankPlantMap[plant] = tank;
      }
    }
    var sortedMap = sortMap(tankPlantMap);

    return Container(
      child: ListView(
        children: <Widget>[
          for (var entry in sortedMap.entries)
            PlantInfoCard(
              context: context,
              plant: entry.key,
              tank: entry.value,
              callback: refreshState,
              showHydrationMessage: true,
            ),
        ],
      ),
    );
  }
}
