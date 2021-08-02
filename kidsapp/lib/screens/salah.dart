import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/screens/Asr.dart';
import 'package:kidsapp/screens/elfajar.dart';
import 'package:kidsapp/screens/isha.dart';
import 'package:kidsapp/screens/maghrib.dart';
import 'package:kidsapp/screens/thuhr.dart';
import 'package:kidsapp/screens/Home.dart';
import 'package:kidsapp/widgets/navigation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Salah extends StatefulWidget {
  static const String route = '/Salah';

  @override
  _SalahState createState() => _SalahState();
}

class _SalahState extends State<Salah> {
  String salah;
  int hour;
  var hour1;
  bool firstrun;
  var duhr;
  var asr;
  var maghrib;
  var isha;
  var fajr;
  String time;
  AudioPlayer player;
  DateTime datetime = DateTime.now();
  void fireAlarm() {
    player.play(
        'https://muslim-kids.royaltechni.com/public/assets/audio/dailyhadiths/-1624717661.mp3');
  }

  @override
  void initState() {
    super.initState();
    getnextprayer();
    var format = DateFormat("HH:mm");
    hour1 = format.parse("${datetime.hour}:${datetime.minute}");
    if (hour1 == time) {
      _pullRefresh();
    }
  }

  void getnextprayer() {
    var format = DateFormat("HH:mm");
    hour1 = format.parse("${datetime.hour}:${datetime.minute}");

    maghrib = format.parse(Provider.of<Athanprovider>(context, listen: false)
        .time
        .data
        .timings
        .maghrib);
    isha = format.parse(Provider.of<Athanprovider>(context, listen: false)
        .time
        .data
        .timings
        .isha);
    fajr = format.parse(Provider.of<Athanprovider>(context, listen: false)
        .time
        .data
        .timings
        .fajr);
    duhr = format.parse(Provider.of<Athanprovider>(context, listen: false)
        .time
        .data
        .timings
        .dhuhr);
    asr = format.parse(Provider.of<Athanprovider>(context, listen: false)
        .time
        .data
        .timings
        .asr);

    if (hour1.isAfter(isha) || hour1.isBefore(fajr)) {
      salah = 'Fajr';

      time = Provider.of<Athanprovider>(context, listen: false)
          .time
          .data
          .timings
          .fajr;
    }
    if (hour1.isAfter(fajr) && hour1.isBefore(duhr)) {
      salah = 'Thuhr';

      time = Provider.of<Athanprovider>(context, listen: false)
          .time
          .data
          .timings
          .dhuhr;
    }
    if (hour1.isAfter(duhr) && hour1.isBefore(asr)) {
      time = Provider.of<Athanprovider>(context, listen: false)
          .time
          .data
          .timings
          .asr;

      salah = 'Asr';
    }
    if (hour1.isAfter(asr) && hour1.isBefore(maghrib)) {
      salah = 'Maghrib';

      time = Provider.of<Athanprovider>(context, listen: false)
          .time
          .data
          .timings
          .maghrib;
    }
    if (hour1.isAfter(maghrib) && hour1.isBefore(isha)) {
      time = Provider.of<Athanprovider>(context, listen: false)
          .time
          .data
          .timings
          .isha;

      salah = 'isha`';
    }
  }

  Future<void> _pullRefresh() async {
    //await Future.delayed(Duration(seconds: 2));
    Navigator.push(
      // or pushReplacement, if you need that
      context,
      FadeInRoute(
        routeName: Home.route,
        page: Home(),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _pullRefresh,
      child: SafeArea(
        child: Scaffold(
          //  backgroundColor: Colors.white,
          body: Container(
            height: double.infinity,
            child: ListView(children: [
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3,
                    top: 15,
                    bottom: 2,
                    left: MediaQuery.of(context).size.width * 0.01),
                child: Container(
                  height: 36,
                  //  margin: EdgeInsets.only(right: 100),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          'Next Prayer',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(204, 14, 116, 1),
                                fontWeight: FontWeight.bold,
                                letterSpacing: .5,
                                fontSize: 17),
                          ),
                        ),
                      ),
                      Text(
                        ': ',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Color.fromRGBO(60, 60, 67, 1),
                              letterSpacing: .5,
                              fontSize: 17),
                        ),
                      ),
                      Text(
                        salah + ' ' + time,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(60, 60, 67, 1),
                              letterSpacing: .5,
                              fontSize: 16),
                        ),
                      ),
                    ],
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
                        onTap: () async {
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
                              border:
                                  Border.all(color: Colors.white, width: 3)),
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
                                            color: Colors.white,
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
                                  child: Text(
                                      Provider.of<Athanprovider>(context)
                                          .time
                                          .data
                                          .timings
                                          .fajr,
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: .5,
                                            fontWeight: FontWeight.bold,
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
                            color: Colors.yellow.shade400,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 10,
                                  top: 2,
                                  child: Container(
                                    child: Text(
                                      'Thuhr',
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
                                  child: Text(
                                      Provider.of<Athanprovider>(context)
                                          .time
                                          .data
                                          .timings
                                          .dhuhr,
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.grey[700],
                                            letterSpacing: .5,
                                            fontWeight: FontWeight.bold,
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
                                  child: Text(
                                      Provider.of<Athanprovider>(context)
                                          .time
                                          .data
                                          .timings
                                          .asr,
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.bold,
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
                                      'Maghrib',
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
                                  child: Text(
                                      Provider.of<Athanprovider>(context)
                                          .time
                                          .data
                                          .timings
                                          .maghrib,
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.grey[800],
                                            letterSpacing: .5,
                                            fontWeight: FontWeight.bold,
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
                                  'Isha’',
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
                              child: Text(
                                  Provider.of<Athanprovider>(context)
                                      .time
                                      .data
                                      .timings
                                      .isha,
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontWeight: FontWeight.bold,
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
            ]),
          ),
        ),
      ),
    );
  }
}
