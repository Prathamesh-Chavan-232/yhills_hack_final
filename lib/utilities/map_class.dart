import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

late MapShapeSource _dataSource;
class MapClass extends StatefulWidget {
  const MapClass({Key? key}) : super(key: key);

  @override

  _MapClassState createState() => _MapClassState();
}

class _MapClassState extends State<MapClass> {
  @override

  void initState() {
    _dataSource = const MapShapeSource.asset(
      'assets/india-states.json',
      shapeDataField: 'name',
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SfMaps(
          layers: [
            MapShapeLayer(source: _dataSource),
          ],
        ),
      ),
    );
  }
}

