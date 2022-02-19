import 'package:flutter/material.dart';
import 'package:crime_stats_app/utilities/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBgClr,
        body: const Center(
          child: Text(
            "Home Page",
            style: TextStyle(color: Colors.black),
          ),
        ),
        floatingActionButton: Align(
          child: SizedBox(
            width: 60,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/city_page');
              },
              backgroundColor: Colors.black,
            ),
          ),
          alignment: const Alignment(0.97, 0.93),
        ));
  }
}
