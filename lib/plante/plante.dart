import 'package:flutter/material.dart';

class MyPlant extends StatefulWidget {
  int _hydration;
  final String name;
  final String imageName;

  /// Takes in a name, an image and an int between 0 and 10 representing
  /// hydration, where 0 is not hydrated at all, and 10 is fully hydrated.
  MyPlant(this._hydration, {@required this.imageName, @required this.name}) {
    assert(_hydration >= 0 && _hydration <= 10);
  }

  //@override
  //_MyPlantState createState() => _MyPlantState();

  int get hydration {
    return this._hydration;
  }

  set hydration(int hydration) {
    assert(hydration >= 0 && hydration <= 10);
    _hydration = hydration;
  }

  void dehydratePlant() {
    _hydration = 0;
  }

  void waterPlant() {
    _hydration = 10;
  }

  @override
  State<StatefulWidget> createState() {
    return _MyPlantState();
  }
}

class _MyPlantState extends State<MyPlant> {
  @override
  Widget build(BuildContext context) {
    print('PLANTE BUILD');
    return Container(
      child: Text('Hellooooooo'),
    );
  }
}
