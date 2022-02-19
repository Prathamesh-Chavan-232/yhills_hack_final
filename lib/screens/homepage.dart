import 'package:crime_stats_app/screens/city_page.dart';
import 'package:crime_stats_app/utilities/ripple_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:crime_stats_app/utilities/constants.dart';

// import '../widgets/animation_state.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late Animation<double> containerSize;
  late AnimationController animationController;
  Duration animationDuration = Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize =
        Tween<double>(begin: size.height * 0.1, end: defaultRegisterSize)
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    ));

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F7),
      body: Stack(children: [
        Column(
          children: [
            Stack(children: [
              Container(
                child: Image.asset('assets/Slice1.png'),
              ),
              Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, bottom: 15),
                    child: Row(
                      children: [
                        const Text(
                          'CrimeX',
                          style: TextStyle(
                              fontSize: 36,
                              fontFamily: "IBM Plex Sans",
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.call_outlined,
                            size: 27,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Image.asset('assets/Rectangle87.png'),
                        height: 273,
                        width: 311,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .hintColor
                                    .withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5)
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'News Update of India',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
            const Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'News Update of India',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: slideMenuclr,
              ),
              height: 110,
              width: 360,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 82,
                    width: 86,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  Column(
                    children: const [
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Abducted Burrabazar jeweller ',
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'Rambla'),
                          )),
                      Text(
                        'found murdered at...',
                        style: TextStyle(fontSize: 18, fontFamily: 'Rambla'),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 20, left: 40),
                          child: Text('7 March 2022'))
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: slideMenuclr,
                ),
                height: 110,
                width: 360,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 82,
                      width: 86,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    Column(
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              'Abducted Burrabazar jeweller ',
                              style:
                                  TextStyle(fontSize: 18, fontFamily: 'Rambla'),
                            )),
                        Text(
                          'found murdered at...',
                          style: TextStyle(fontSize: 18, fontFamily: 'Rambla'),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 20, left: 40),
                            child: Text('7 March 2022'))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            alignment: Alignment.center,
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/news');
                },
                child: const Text("Swipe for more articles")),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation, _) {
              return RippleCityPage();
            },
            opaque: false,
          ));
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xff333333),
      ),
    );
  }
}
