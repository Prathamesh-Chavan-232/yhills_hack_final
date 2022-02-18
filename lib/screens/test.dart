import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  late List<Data> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          _buildPieChart(),
          _buildPieChart(),
        ],
      )
    );
  }

  Widget _buildPieChart()
  {
    return SfCircularChart(
      title: ChartTitle(
          text: 'Continent wise GDP - 2021 \n (in billions of USD)'),
      series: <CircularSeries>[
        PieSeries<Data, String>(
            dataSource: _chartData,
            xValueMapper: (data, context) => data.name,
            yValueMapper: (data, context) => data.value,
            dataLabelSettings: DataLabelSettings(isVisible: true))
      ],
    );
  }

  List<Data> getChartData() {
    List<Data> chartData = [
      Data(name: 'Oceania', value: 1600),
      Data(name: 'Africa', value: 2490),
      Data(name: 'S America', value: 2900),
      Data(name: 'Europe', value: 23050),
      Data(name: 'N America', value: 24880),
      Data(name: 'Asia', value: 34390),
    ];
    return chartData;
  }
}

class Data {
  final String name;
  final int value;
  Data({required this.name, required this.value});
}
