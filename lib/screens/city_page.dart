import 'package:crime_stats_app/screens/city_list.dart';
import 'package:crime_stats_app/utilities/graph_view.dart';
import 'package:crime_stats_app/utilities/classes.dart';
import 'package:flutter/material.dart';

CityData cityData = CityData(cityName: cities[0]);

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Appbar - Menu icon, City name, Alerts icon
              _buildCustomAppbar(context),

              // Horizontal list view for types of crime, TODO: Replace containers with images / other UI elements
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, top: 15),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (context, i) =>
                          const SizedBox(width: 10),
                      itemBuilder: (context, i) => _buildContainer(context, i)),
                ),
              ),

              // Text + little bit spacing
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Text("   Graphs",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              const SizedBox(height: 10),

              // Rendering graphs from graph view widget
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: GraphView(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Align(
          child: SizedBox(
            width: 60,
            child: FloatingActionButton(onPressed: () {
              Navigator.pushNamed(context, '/home');
            }),
          ),
          alignment: const Alignment(0.97, 0.93),
        ));
  }

  Row _buildCustomAppbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () async {
                  var res = await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CityList(cityName: cityData.cityName)));
                  setState(() {
                    cityData.cityName = res as String?;
                  });
                },
                icon: const Icon(Icons.menu)),
            const SizedBox(width: 30),
            Text(
              cityData.cityName!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
      ],
    );
  }
}

Widget _buildContainer(BuildContext context, int i) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/by_crime');
    },
    child: Padding(
      // TODO: make a islast variable in the class so we know when the list ends
      padding: i == 2 ? const EdgeInsets.only(right: 10) : EdgeInsets.zero,
      child: Container(
        margin: const EdgeInsets.all(6),
        width: 260,
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
