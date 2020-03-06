import 'package:flutter/material.dart';

class MyAnimatedIcon extends StatefulWidget {
  @override
  _MyAnimatedIconState createState() => _MyAnimatedIconState();
}

class _MyAnimatedIconState extends State<MyAnimatedIcon>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: 0, end: 2 * 3.14).animate(controller);

    return Container(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.rotate(
            angle: animation.value,
            child: Container(
              child: Icon(Icons.star),
            ),
          );
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
