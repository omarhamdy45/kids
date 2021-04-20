import 'package:flutter/material.dart';
import 'package:kidsapp/screens/types.dart';
import 'package:kidsapp/widgets/background.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      child: Stack(children: [
        Container(color: Colors.red,child: Background(),),
          AnimatedSplashScreen(
              duration: 1000,
              animationDuration: Duration(milliseconds: 1500),
              curve: Curves.easeOutCubic,
              splash: CircleAvatar(
                radius: 200,
                child: Image.asset('assets/images/bss.png',fit: BoxFit.cover,)),
              splashIconSize: 200,
              nextScreen: Types(),
              splashTransition: SplashTransition.rotationTransition,
              pageTransitionType: PageTransitionType.fade,
              backgroundColor: Colors.transparent,)
      
      ]),
    ));

    
  }
}
