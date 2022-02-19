import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crime_stats_app/screens/home.dart';
import 'package:crime_stats_app/screens/homepage.dart';
import 'package:crime_stats_app/screens/load.dart';
import 'package:crime_stats_app/utilities/map_class.dart';
import 'package:crime_stats_app/screens/by_crime_page.dart';
import 'package:crime_stats_app/screens/city_list.dart';
import 'package:crime_stats_app/screens/city_page.dart';
import 'package:crime_stats_app/screens/news.dart';
import 'package:crime_stats_app/utilities/ripple_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "crimex",
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/home_page': (context) => const homepage(),
        '/by_crime': (context) => const ByCrime(),
        '/city_list': (context) => CityList(),
        '/city_page': (context) => const CityPage(),
        '/ripple_city_page': (context) => RippleCityPage(),
        '/map_class': (context) => const MapClass(),
        '/load': (context) => const Loading(),
        '/news': (context) => const News(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
