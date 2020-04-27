import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/constants.dart' as Constants;
import '../IPlantAndWaterTank.dart';

/// This device can have up to four [Plant]s. It keeps track of the water level
/// of the tank, as well as which plants belong to the device.
class WaterTankDevice implements IPlantAndWaterTank {
  /// The name of this tank.
  String nickname;

  /// How much water is in this tank.
  int waterLevel;

  /// Keeps track of which plant each pipe goes to.
  ///
  /// There are 4 pipes one the device, and the pipes are numbered from
  /// 1 to 4. pipeConnections[plant] = 1
  /// means that the first pipe is connected to that plant object.
  /// 2 is second pipe, and so on.
  Map<Plant, int> _pipeConnections;

  WaterTankDevice(this.nickname, {this.waterLevel = 60}) {
    _pipeConnections = <Plant, int>{};
  }

  List<Plant> plantsBeingWatered() {
    List<Plant> plantsBeingWatered = [];
    for (Plant plant in plants) {
      if (plant.isBeingWatered) {
        plantsBeingWatered.add(plant);
      }
    }
    return plantsBeingWatered;
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
    assert(plant != null);
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

  /// Waters [plant] (connected by a pipe to this device) until it reaches [plant.idealHydration].
  Future<int> water(Plant plant) async {
    assert(plant != null);
    for (int i = 0; i < 5; i++) {
      return await Future.delayed(Duration(seconds: 1))
          .then((value) => plant.hydration += 1);
    }
    /*
    await Future.delayed(Duration(seconds: 1));
    if (pipeConnections.containsKey(plant)) {
      if (plant.hydration > plant.idealHydration) {
        return false;
      }
      plant.hydration += 1;
      return true;
    }*/
  }

  /// Get the pipe that [plant] is connected to in this tank.
  int pipeConnectedTo(Plant plant) {
    assert(plant != null);
    assert(pipeConnections.containsKey(plant));
    return pipeConnections[plant];
  }

  /// Get all pipes that are not connected to any [Plant]s.
  List<int> availablePipes() {
    List<int> pipes = [1, 2, 3, 4];
    for (int pipe in _pipeConnections.values) {
      pipes.remove(pipe);
    }
    return pipes;
  }

  Map<Plant, int> get pipeConnections {
    return this._pipeConnections;
  }

  /// Returns a sorted list of the [Plant]s in this tank.
  List<Plant> get plants {
    List<Plant> plants = [];
    for (Plant plant in _pipeConnections.keys) {
      plants.add(plant);
    }
    plants.sort((a, b) => a.hydration.compareTo(b.hydration));
    return plants;
  }
}
