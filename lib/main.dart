import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crime_stats_app/screens/home.dart';
import 'package:crime_stats_app/screens/load.dart';
import 'package:crime_stats_app/utilities/map_class.dart';
import 'package:crime_stats_app/screens/by_crime_page.dart';
import 'package:crime_stats_app/screens/city_list.dart';
import 'package:crime_stats_app/screens/city_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      initialRoute: '/map_class',
      routes: {
        '/home': (context) => const HomePage(),
        '/by_crime': (context) => const ByCrime(),
        '/city_list': (context) => CityList(),
        '/city_page': (context) => const CityPage(),
        '/map_class': (context) => const MapClass(),
        '/load': (context) => const Loading(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
