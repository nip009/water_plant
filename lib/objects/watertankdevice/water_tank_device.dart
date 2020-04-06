import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/constants.dart' as Constants;
import '../IPlantAndWaterTank.dart';

/// This device can have up to five [Plant]s. It keeps track of the water level
/// of the tank, as well as which plants belong to the device.
class WaterTankDevice implements IPlantAndWaterTank {
  String name;
  List<Plant> _plants;
  // How many percent water that is left in the tank.
  int _waterLevel;

  WaterTankDevice(this.name, List<Plant> plants, int waterLevel) {
    assert(plants.length >= 0 &&
        plants.length <= Constants.ALLOWED_NUMBER_OF_PLANTS_IN_TANK);
    assert(waterLevel >= 0 && waterLevel <= 100);
    this._plants = plants;
    this._waterLevel = waterLevel;
  }

  bool isEveryPlantAboveCriticalWaterLevel() {
    for (Plant p in _plants) {
      if (p.isHydrationCritical()) {
        return false;
      }
    }
    return true;
  }

  void emptyTank() {
    _waterLevel = 0;
  }

  int get waterLevel {
    return _waterLevel;
  }

  set waterLevel(int waterLevel) {
    this._waterLevel = waterLevel;
  }

  List<Plant> get plants {
    _plants.sort((a, b) => a.hydration.compareTo(b.hydration));
    return this._plants;
  }
}
