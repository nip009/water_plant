import 'package:flutter/material.dart';

class Plant {
  int _hydration;
  String name;
  final String imageName;
  bool _isGrey;

  /// Takes in a name, an image and an int between 0 and 10 representing
  /// hydration, where 0 is not hydrated at all, and 10 is fully hydrated.
  Plant(this._hydration, {@required this.imageName, @required this.name}) {
    assert(_hydration >= 0 && _hydration <= 10);
    isGrey = false;
  }

  int get hydration {
    return this._hydration;
  }

  set hydration(int hydration) {
    assert(hydration >= 0 && hydration <= 10);
    _hydration = hydration;
  }

  bool get isGrey {
    return this._isGrey;
  }

  set isGrey(bool b) {
    this._isGrey = b;
  }

  void dehydratePlant() {
    _hydration = 0;
  }

  void waterPlant() {
    _hydration = 10;
  }
}
