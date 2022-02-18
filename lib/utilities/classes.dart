import 'package:flutter/material.dart';

List<String> cities = [
  "Mumbai",
  "Delhi",
  "Chennai",
  "Hyderabad",
];


List<String> crimeImg = [
  "assets/gun.jpg",
  "assets/murder.jpg",
  "assets/Handcuffs.jpg"
];

class GraphData
{
  double X;
  double Y;
  GraphData(this.X,this.Y);
}


class CityData {
  String? cityName;
  String? crimeName;
  GraphData? graphData;
  CityData({this.cityName, this.crimeName,this.graphData});
}

class Data {
  final String name;
  final int value;
  Data({required this.name, required this.value});
}
