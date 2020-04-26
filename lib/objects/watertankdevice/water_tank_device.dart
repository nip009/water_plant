import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/constants.dart' as Constants;
import '../IPlantAndWaterTank.dart';

/// This device can have up to four [Plant]s. It keeps track of the water level
/// of the tank, as well as which plants belong to the device.
class WaterTankDevice implements IPlantAndWaterTank {
  String nickname;

  int waterLevel;

  /// Keeps track of which plant each pipe goes to.
  /// There are 4 pipes one the device, and the pipes are numbered from
  /// 1 to 4.
  ///
  /// pipeConnections[plant] = 1
  /// means that the first pipe is connected to that plant object.
  /// 2 is second pipe, and so on.
  Map<Plant, int> _pipeConnections;

  WaterTankDevice(this.nickname, {this.waterLevel = 60}) {
    _pipeConnections = Map<Plant, int>();
  }

  void addPlant(int pipe, Plant plant) {
    assert(plant != null);
    assert(pipe >= 1 && pipe <= 4);
    if (this._pipeConnections.length <
        Constants.ALLOWED_NUMBER_OF_PLANTS_IN_TANK) {
      _pipeConnections[plant] = pipe;
    }
  }

  bool removePlant(Plant plant) {
    if (_pipeConnections.containsKey(plant)) {
      _pipeConnections.remove(plant);
      return true;
    }
    return false;
  }

  bool isEveryPlantAboveLowWaterLevel() {
    for (Plant p in _pipeConnections.keys) {
      if (p.isHydrationLow() || p.isHydrationCritical()) {
        return false;
      }
    }
    return true;
  }

  int getPipe(Plant plant) {
    assert(plant != null);
    return pipeConnections[plant];
  }

  List<int> getAvailablePipes() {
    List<int> pipes = [1, 2, 3, 4];
    for (int pipe in _pipeConnections.values) {
      pipes.remove(pipe);
    }
    return pipes;
  }

  Map<Plant, int> get pipeConnections {
    return this._pipeConnections;
  }

  /// Returns a sorted list of the plants in the tank
  List<Plant> get plants {
    List<Plant> plants = [];
    for (Plant plant in _pipeConnections.keys) {
      plants.add(plant);
    }
    plants.sort((a, b) => a.hydration.compareTo(b.hydration));
    return plants;
  }
}
