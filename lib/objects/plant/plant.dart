import 'package:flutter/material.dart';
import '../IPlantAndWaterTank.dart';

class Plant implements IPlantAndWaterTank {
  int _hydration;
  String name;
  String latinName;
  final String imageName;
  bool _automaticWatering;
  int _idealHydrationLevel;

  /// Takes in a name, an image and an int between 0 and 10 representing
  /// hydration, where 0 is not hydrated at all, and 10 is fully hydrated.
  Plant(this._hydration,
      {@required this.imageName,
      @required this.name,
      @required this.latinName}) {
    assert(_hydration >= 0 && _hydration <= 100);
    _automaticWatering = false;
    _idealHydrationLevel = 25;
  }

  set automaticWatering(bool value) {
    _automaticWatering = value;
  }

  bool isAutomaticWateringActive() {
    return this._automaticWatering;
  }

  bool isHydrationCritical() {
    return _hydration <= _idealHydrationLevel;
  }

  int get idealHydrationLevel {
    return this._idealHydrationLevel;
  }

  int get hydration {
    return this._hydration;
  }

  set hydration(int hydration) {
    assert(hydration >= 0 && hydration <= 100);
    _hydration = hydration;
  }

  void dehydratePlant() {
    _hydration = 0;
  }

  void waterPlant() {
    _hydration = 100;
  }
}
