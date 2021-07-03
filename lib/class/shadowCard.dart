import 'package:flutter/material.dart';

class ShodowCard {
  //const ShodowCard({ Key? key }) : super(key: key);
  final List<BoxShadow> _box = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.9),
      blurRadius: 9.0,
      spreadRadius: 4.0,
      offset: Offset(0.0, -3.0),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.5),
      blurRadius: 1.0,
      spreadRadius: 2.0,
      offset: Offset(3.0, 3.0),
    ),
  ];
  get box {
    return _box;
  }
}
