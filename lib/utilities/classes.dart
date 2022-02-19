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

class GraphData {
  double X;
  double Y;
  GraphData(this.X, this.Y);
}

class CityData {
  String? cityName;
  String? crimeName;
  GraphData? graphData;
  CityData({this.cityName, this.crimeName, this.graphData});
}

class Data {
  final String name;
  final int value;
  Data({required this.name, required this.value});
}

List<ExpenseData> getChartData1() {
  final List<ExpenseData> chartData = [
    ExpenseData('label1', 55, 40, 45, 48),
    ExpenseData('label2', 33, 45, 54, 28),
    ExpenseData('label3', 43, 23, 20, 34),
    ExpenseData('label4', 32, 54, 23, 54),
    ExpenseData('label5', 56, 18, 43, 55),
    ExpenseData('label6', 23, 54, 33, 56),
  ];
  return chartData;
}

class ExpenseData {
  ExpenseData(
      this.expenseCategory, this.father, this.mother, this.son, this.daughter);
  final String expenseCategory;
  final num father;
  final num mother;
  final num son;
  final num daughter;
}

var crimeStats = [
  {
    2010: 208168,
    2011: 204902,
    2012: 202700,
    2013: 234385,
    2014: 249834,
    2015: 275414,
    2016: 261714,
    2017: 288879,
    2018: 346291,
    2019: 341084,
    2020: 394017
  },
  {
    2010: 174179,
    2011: 195135,
    2012: 198093,
    2013: 226445,
    2014: 240475,
    2015: 241920,
    2016: 282171,
    2017: 310084,
    2018: 342355,
    2019: 353131,
    2020: 355110
  },
  {
    2010: 129616,
    2011: 143197,
    2012: 161427,
    2013: 169535,
    2014: 185672,
    2015: 179501,
    2016: 176569,
    2017: 163999,
    2018: 157610,
    2019: 157610,
    2020: 158060
  }
];
