import 'package:crimex/screens/city_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: Duration(milliseconds: 1500),
                  builder: (context, value, child) {
                    return ShaderMask(
                        shaderCallback: (rect) {
                          return RadialGradient(
                              radius:value * 5.0, colors: [Colors.white, Colors.white, Colors.transparent, Colors.transparent], stops: [0.0, 0.55, 0.6, 1.0], center: FractionalOffset(0.95, 0.95))
                              .createShader(rect);
                        },
                        child: CityPage());
                  }),
            );
          },
        ));
  }
}