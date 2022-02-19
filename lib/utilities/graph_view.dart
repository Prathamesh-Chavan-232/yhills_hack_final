import 'package:flutter/material.dart';
import 'classes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class GraphView extends StatefulWidget {
  const GraphView({Key? key}) : super(key: key);

  @override
  State<GraphView> createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {

  late List<Data> _chartData;
  late List<ExpenseData> _chartData1;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _chartData = getChartData();
    _chartData1 = getChartData1();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // Vertical list view for graphs, TODO: Replace containers with graphs
    return ListView.separated(
        itemCount: 4,
        separatorBuilder: (context, i) => const SizedBox(height: 10),
        itemBuilder: (context, i) => _buildTile(i),
      );
  }

  Widget _buildTile(int i) {
    return Padding(
      // TODO: make a islast variable in the class so we know when the list ends
      padding: i == 3 ? const EdgeInsets.only(bottom: 10) : EdgeInsets.zero,
      child: Container(
        margin: const EdgeInsets.all(5),
        height: 270,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: _buildPieChart()
      ),
    );
  }


  Widget _buildPieChart()
  {
    return SfCircularChart(
      title: ChartTitle(
          text: 'Sample pie chart \n (unit - __ )'),
      series: <CircularSeries>[
        PieSeries<Data, String>(
            dataSource: _chartData,
            xValueMapper: (data, context) => data.name,
            yValueMapper: (data, context) => data.value,
            dataLabelSettings: const DataLabelSettings(isVisible: false))
      ],
    );
  }

  Widget _buildBarGraph()
  {
    return SfCartesianChart(
      title: ChartTitle(
          text: 'Sample Cartesian graph'),
      legend: Legend(isVisible: true),
      tooltipBehavior: _tooltipBehavior,
      series: <ChartSeries>[
        StackedArea100Series<ExpenseData, String>(
            dataSource: _chartData1,

            xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
            yValueMapper: (ExpenseData exp, _) => exp.father,
            name: 'label1',
            markerSettings: const MarkerSettings(
              isVisible: true,
            )),
      ],
      primaryXAxis: CategoryAxis(),
    );
  }

  Widget chkGraph(int i)
  {
    if (i == 2) {
      return _buildBarGraph();
    }
    else {
      return  _buildPieChart();
    }
  }
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


