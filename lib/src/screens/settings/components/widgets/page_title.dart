import 'package:flutter/material.dart';

Container pageTitle(String text) {
  return Container(
    padding: EdgeInsets.all(20),
    alignment: Alignment.center,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 30,
      ),
    ),
  );
}
