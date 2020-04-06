import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/constants.dart' as Constants;
import '../IPlantAndWaterTank.dart';

/// This device can have up to four [Plant]s. It keeps track of the water level
/// of the tank, as well as which plants belong to the device.
class WaterTankDevice implements IPlantAndWaterTank {
  String name;
  List<Plant> _plants;
  // How many percent water that is left in the tank.
  int waterLevel;

  WaterTankDevice(this.name, {this.waterLevel = 60}) {
    this._plants = [];
  }

  void addPlant(Plant plant) {
    assert(plant != null);
    if (this._plants.length < Constants.ALLOWED_NUMBER_OF_PLANTS_IN_TANK) {
      this._plants.add(plant);
    }
  }

  bool isEveryPlantAboveCriticalWaterLevel() {
    for (Plant p in _plants) {
      if (p.isHydrationCritical()) {
        return false;
      }
    }
    return true;
  }

  List<Plant> get plants {
    _plants.sort((a, b) => a.hydration.compareTo(b.hydration));
    return this._plants;
  }
}
