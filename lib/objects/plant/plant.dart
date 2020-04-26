import 'dart:io';

import 'package:flutter/material.dart';
import '../IPlantAndWaterTank.dart';

///
class Plant implements IPlantAndWaterTank {
  /// Current hydration level/soil moisture for this plant.
  int _hydration;

  /// Nickname for this plant (chosen by the user).
  String nickname;

  /// Whether or not this plant should be watered automatically by its [WaterTankDevice].
  bool _automaticWatering;

  /// The hydration level that is ideal for this plant.
  int _idealHydration;

  File chosenImageFile;

  /// Information about the type of plant it is.
  ///
  /// As an example, a plant of type Orchid would have information stored here
  /// about an Orchid. It would contain information about its ideal hydration
  /// level, its latin name and it would have a picture of an Orchid
  /// *(This information would be fetched from a server in the future).*
  Map<String, dynamic> plantTypeInfo;

  Plant(
    this._hydration, {
    @required this.plantTypeInfo,
    this.chosenImageFile,
    this.nickname = '',
  }) {
    assert(plantTypeInfo != null);
    assert(_hydration >= 0 && _hydration <= 100);
    _automaticWatering = false;
    _idealHydration = 40;
  }

  get plantTypeName => plantTypeInfo.values.elementAt(0);

  get plantTypeLatinName => plantTypeInfo.values.elementAt(1);

  get plantTypeImage => plantTypeInfo.values.elementAt(2);

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

  int get idealHydrationLevel => this._idealHydration;

  int get hydration => this._hydration;

  set hydration(int hydration) {
    assert(hydration >= 0 && hydration <= 100);
    _hydration = hydration;
  }

  /// Waters this plant until it reaches optimal [_idealHydration].
  void waterPlant() {
    if (_hydration > _idealHydration) {
      return;
    }
    _hydration = _idealHydration;
  }

  /// Returns high, optimal, low or critical.
  String hydrationStatus() {
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
