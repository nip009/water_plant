import 'package:flutter/material.dart';
import '../IPlantAndWaterTank.dart';

class Plant implements IPlantAndWaterTank {
  int _hydration;
  String name;
  String latinName;
  final String imageName;
  bool _automaticWatering;
  int _idealHydration;

  Plant(this._hydration,
      {@required this.imageName,
      @required this.name,
      @required this.latinName}) {
    assert(_hydration >= 0 && _hydration <= 100);
    _automaticWatering = false;
    _idealHydration = 40;
  }

  set automaticWatering(bool value) {
    _automaticWatering = value;
  }

  bool isAutomaticWateringActive() {
    return this._automaticWatering;
  }

  bool isHydrationCritical() {
    double critical = _idealHydration - ((_idealHydration * 50) / 100);
    return _hydration <= critical;
  }

  bool isHydrationLow() {
    double critical = _idealHydration - ((_idealHydration * 50) / 100);
    return (this.hydration > critical && this.hydration < _idealHydration - 10);
  }

  bool isHydrationOptimal() {
    return (this.hydration <= _idealHydration + 10 &&
        this.hydration >= _idealHydration - 10);
  }

  bool isHydrationHigh() {
    return this.hydration > _idealHydration;
  }

  int get idealHydrationLevel {
    return this._idealHydration;
  }

  int get hydration {
    return this._hydration;
  }

  set hydration(int hydration) {
    assert(hydration >= 0 && hydration <= 100);
    _hydration = hydration;
  }

  void waterPlant() {
    _hydration = 100;
  }

  /// Returns high, optimal, low or critical
  String getHydrationStatus() {
    if (isHydrationHigh()) {
      return 'High';
    } else if (isHydrationOptimal()) {
      return 'Optimal';
    } else if (isHydrationLow()) {
      return 'Low';
    } else {
      return 'Critical';
    }
  }
}
