import 'package:crime_stats_app/utilities/classes.dart';
import 'package:crime_stats_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class CityList extends StatelessWidget {
  String? cityName;
  CityList({this.cityName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Drawer(
          child: Material(
            color: slideMenuclr,
            borderRadius: BorderRadius.circular(20),
            child: _buildDrawerContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context, cityName),
                  icon: const Icon(Icons.arrow_back)),
              const Text(
                "   Choose a City",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(child: _buildListView(context)),
      ],
    );
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: cities.length,
      itemBuilder: (context, i) => _buildTile(context, i),
    );
  }

  Widget _buildTile(BuildContext context, int i) {
    return GestureDetector(
      onTap: () {
        cityName = cities[i];
        Navigator.pop(context, cityName);
      },
      child: ListTile(
        title: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 15.0, vertical: 15), // padding inside city list tile
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50)),
          child:
              Text(cities[i])
        ),
      ),
    );
  }
}
