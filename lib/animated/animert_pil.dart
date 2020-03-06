import 'package:flutter/material.dart';
import 'dart:math';

class MyAnimatedArrow extends StatefulWidget {
  @override
  _MyAnimatedIconState createState() => _MyAnimatedIconState();
}

class _MyAnimatedIconState extends State<MyAnimatedArrow>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      upperBound: pi * 2,
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: 0, end: 1 * pi).animate(controller);

    return Container(
      child: RotationTransition(
        turns: Tween(begin: 0.5, end: 1.0).animate(controller),
        child: GestureDetector(
          onTap: () => controller.forward(from: 0.0),
          child: Icon(Icons.arrow_downward),
        ),
      ),
      //controller.forward(from: 0.0);
      /*
      child: GestureDetector(
        child: Icon(Icons.arrow_downward),
        onTap: () {
          print('Pil');
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(controller),
            child: Icon(Icons.arrow_downward),
          );
          controller.forward(from: 0.0);
        },
      ),*/
    );
  }
}
