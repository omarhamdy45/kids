import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids/providers/Athan.dart';
import 'package:kids/screens/Asr.dart';
import 'package:kids/screens/elfajar.dart';
import 'package:kids/screens/isha.dart';
import 'package:kids/screens/maghrib.dart';
import 'package:kids/screens/thuhr.dart';
import 'package:kids/widgets/background.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Salah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //  backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          child: Stack(
            children: [
              Background(),
              ListView(children: [
                Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.3,
                      top: 15,
                      bottom: 15,
                      left: MediaQuery.of(context).size.width * 0.04),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.grey[200],
                    child: Container(
                      height: 36,
                      //  margin: EdgeInsets.only(right: 100),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              'Next player',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Color.fromRGBO(204, 14, 116, 1),
                                    letterSpacing: .5,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                          Text(
                            ':  ',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Color.fromRGBO(60, 60, 67, 1),
                                  letterSpacing: .5,
                                  fontSize: 17),
                            ),
                          ),
                          Text(
                            'fagr 16:05',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Color.fromRGBO(60, 60, 67, 1),
                                  letterSpacing: .5,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                duration: Duration(milliseconds: 600),
                                type: PageTransitionType.fade,
                                child: Elfajar(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 176,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white, width: 3)),
                            child: Container(
                              color: Colors.lightBlueAccent.shade700,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 10,
                                    top: 2,
                                    child: Container(
                                      child: Text(
                                        'Fajr',
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: .5,
                                              fontSize: 28),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 8,
                                    child: Container(
                                        child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 10,
                                    )),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 50,
                                    child: Text(Provider.of<Athanprovider>(context).time.data.timings.fajr,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  101, 103, 103, 1),
                                              letterSpacing: .5,
                                              fontSize: 14),
                                        )),
                                  ),
                                  Positioned(
                                    left: 0,
                                    bottom: 0,
                                    child: Container(
                                        child: Image.asset(
                                            'assets/images/Group 72.png')),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                duration: Duration(milliseconds: 600),
                                type: PageTransitionType.fade,
                                child: Thuhr(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 176,
                            //  color: Color.fromARGB(239, 239, 149, 1),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 3)),
                            child: Container(
                              color: Colors.yellow.shade200,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 10,
                                    top: 2,
                                    child: Container(
                                      child: Text(
                                        'Thohr',
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: .5,
                                              fontSize: 28),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 7,
                                    child: Container(
                                        child: CircleAvatar(
                                      backgroundColor: Colors.yellow[200],
                                      radius: 10,
                                    )),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 50,
                                    child: Text(Provider.of<Athanprovider>(context).time.data.timings.dhuhr,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  101, 103, 103, 1),
                                              letterSpacing: .5,
                                              fontSize: 14),
                                        )),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: Container(
                                        child: Image.asset(
                                            'assets/images/Group 72.png')),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                duration: Duration(milliseconds: 600),
                                type: PageTransitionType.fade,
                                child: Asr(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 176,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 3)),
                            child: Container(
                              color: Colors.yellow.shade600,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 10,
                                    top: 2,
                                    child: Container(
                                      child: Text(
                                        'Asr',
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: .5,
                                              fontSize: 28),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 5,
                                    child: Container(
                                        child: CircleAvatar(
                                      backgroundColor: Colors.yellowAccent[400],
                                      radius: 18,
                                    )),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 50,
                                    child: Text(Provider.of<Athanprovider>(context).time.data.timings.asr,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  101, 103, 103, 1),
                                              letterSpacing: .5,
                                              fontSize: 14),
                                        )),
                                  ),
                                  Positioned(
                                    left: 0,
                                    bottom: 0,
                                    child: Container(
                                        child: Image.asset(
                                            'assets/images/Group 72.png')),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                duration: Duration(milliseconds: 600),
                                type: PageTransitionType.fade,
                                child: Maghrib(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 176,
                            //  color: Color.fromARGB(239, 239, 149, 1),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 3)),
                            child: Container(
                              color: Colors.grey[400],
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 10,
                                    top: 2,
                                    child: Container(
                                      child: Text(
                                        'Maghreb',
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: .5,
                                              fontSize: 28),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: Container(
                                        child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 8,
                                    )),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 50,
                                    child: Text(Provider.of<Athanprovider>(context).time.data.timings.maghrib,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  101, 103, 103, 1),
                                              letterSpacing: .5,
                                              fontSize: 14),
                                        )),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: Container(
                                        child: Image.asset(
                                            'assets/images/Group 72.png')),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: Duration(milliseconds: 600),
                            type: PageTransitionType.fade,
                            child: Isha(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        margin: EdgeInsets.symmetric(horizontal: 7),
                        height: 176,
                        //  color: Color.fromARGB(239, 239, 149, 1),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3)),
                        child: Container(
                          color: Colors.black,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                left: 10,
                                top: 2,
                                child: Container(
                                  child: Text(
                                    'Isha',
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: 28),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 6,
                                child: Container(
                                    child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 15,
                                )),
                              ),
                              Positioned(
                                right: 10,
                                top: 50,
                                child: Text(Provider.of<Athanprovider>(context).time.data.timings.isha,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: 14),
                                    )),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: Container(
                                    child: Image.asset(
                                        'assets/images/Group 72.png')),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
