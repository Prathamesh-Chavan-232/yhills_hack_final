import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class State {
  State(this.state, this.color, this.stateCode);
  String state;
  String stateCode;
  Color color;
}

final List<State> data = <State>[
  State(
      'New South Wales', const Color.fromRGBO(255, 215, 0, 1.0), 'New\nSouth Wales'),
  State('Queensland', const Color.fromRGBO(72, 209, 204, 1.0), 'Queensland'),
  State('Northern Territory', Colors.red.withOpacity(0.85),
      'Northern\nTerritory'),
  State('Victoria', const Color.fromRGBO(171, 56, 224, 0.75), 'Victoria'),
  State(
      'South Australia', const Color.fromRGBO(126, 247, 74, 0.75), 'South Australia'),
  State('Western Australia', const Color.fromRGBO(79, 60, 201, 0.7),
      'Western Australia'),
  State('Tasmania', const Color.fromRGBO(99, 164, 230, 1), 'Tasmania'),
  State('Australian Capital Territory', Colors.teal, 'ACT')
];
