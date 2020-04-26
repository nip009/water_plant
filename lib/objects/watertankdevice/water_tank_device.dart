import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/constants.dart' as Constants;
import '../IPlantAndWaterTank.dart';

/// This device can have up to four [Plant]s. It keeps track of the water level
/// of the tank, as well as which plants belong to the device.
class WaterTankDevice implements IPlantAndWaterTank {
  String nickname;
  List<Plant> _plants;

  int waterLevel;

  /// Keeps track of which plant each pipe goes to.
  /// There are 4 pipes one the device, and the pipes are numbered from
  /// 1 to 4.
  ///
  /// pipeConnections[plant] = 1
  /// means that the first pipe is connected to that plant object.
  /// 2 is second pipe, and so on.
  Map<Plant, int> pipeConnections;

  WaterTankDevice(this.nickname, {this.waterLevel = 60}) {
    this._plants = [];
    pipeConnections = Map<Plant, int>();
  }

  void addPlant(int pipe, Plant plant) {
    assert(plant != null);
    if (this._plants.length < Constants.ALLOWED_NUMBER_OF_PLANTS_IN_TANK) {
      pipeConnections[plant] = pipe;
      this._plants.add(plant); //TODO: Use pipeConnection instead
    }
  }

  bool removePlant(Plant plant) {
    if (_plants.contains(plant)) {
      pipeConnections.remove(plant);
      _plants.remove(plant);
      return true;
    }
    return false;
  }

  bool isEveryPlantAboveLowWaterLevel() {
    for (Plant p in _plants) {
      if (p.isHydrationLow() || p.isHydrationCritical()) {
        return false;
      }
    }
    return true;
  }

  List<int> getAvailablePipes() {
    List<int> pipes = [1, 2, 3, 4];
    for (int pipe in pipeConnections.values) {
      pipes.remove(pipe);
    }
    return pipes;
  }

  /// Returns a sorted list of the plants in the tank
  List<Plant> get plants {
    _plants.sort((a, b) => a.hydration.compareTo(b.hydration));
    return this._plants;
  }
}
