import 'package:flutter/material.dart';
import 'package:kidsapp/screens/Home.dart';
import 'package:kidsapp/widgets/background.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class Splash extends StatelessWidget {
  static bool alarm = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      child: Stack(children: [
        Container(
          color: Colors.red,
          child: Background(),
        ),
        AnimatedSplashScreen(
          duration: 1000,
          animationDuration: Duration(milliseconds: 1500),
          curve: Curves.easeOutCubic,
          splash: Column(
            children: [
              CircleAvatar(
                  radius: 150,
                  child: Image.asset(
                    'assets/images/bss.png',
                    fit: BoxFit.cover,
                  )),
            ],
          ),
          splashIconSize: 500,
          nextScreen: Home(),
          splashTransition: SplashTransition.rotationTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.transparent,
        ),
      ]),
    ));
  }
}
