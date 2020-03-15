import 'package:flutter/material.dart';
import '../IPlantAndWaterTank.dart';

class Plant implements IPlantAndWaterTank {
  int _hydration;
  String name;
  final String imageName;
  bool _isVisible;

  /// Takes in a name, an image and an int between 0 and 10 representing
  /// hydration, where 0 is not hydrated at all, and 10 is fully hydrated.
  Plant(this._hydration, {@required this.imageName, @required this.name}) {
    assert(_hydration >= 0 && _hydration <= 100);
    isVisible = true;
  }

  int get hydration {
    return this._hydration;
  }

  set hydration(int hydration) {
    assert(hydration >= 0 && hydration <= 100);
    _hydration = hydration;
  }

  bool get isVisible {
    return this._isVisible;
  }

  set isVisible(bool b) {
    this._isVisible = b;
  }

  void dehydratePlant() {
    _hydration = 0;
  }

  void waterPlant() {
    _hydration = 100;
  }
}
