import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/providers/azkarprovider.dart';
import 'package:kidsapp/providers/lanprovider.dart';
import 'package:kidsapp/providers/userprovider.dart';
import 'package:kidsapp/screens/duaas.dart';
import 'package:kidsapp/screens/login.dart';
import 'package:kidsapp/screens/ramdanscreen.dart';
import 'package:kidsapp/screens/salah.dart';
import 'package:kidsapp/widgets/background.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Types extends StatefulWidget {
  static const String route = 'types';
  @override
  _TypesState createState() => _TypesState();
}

class _TypesState extends State<Types> {
  bool firstrun;
  int i;
  String currentPostion;
  bool cheak;
  GlobalKey<ScaffoldState> scaffold;
  // LatLng currentPostion;

  @override
  void initState() {
    super.initState();
    scaffold = GlobalKey<ScaffoldState>();
    firstrun = true;
    Userprovider.sd = Provider.of<Userprovider>(context, listen: false)
        .currentUser
        .token
        .toString();
  }

  Future<void> cheaknetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        cheak = false;
      }
    } on SocketException catch (_) {
      cheak = true;
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await cheaknetwork();
    if (cheak == false) {
      await Provider.of<Userprovider>(context, listen: false).getUserLocation();
      if (Userprovider.done == 'true') {
        await Provider.of<Userprovider>(context, listen: false).fetchscore();
        await Provider.of<Lanprovider>(context, listen: false).getdate();
        if (DateTime.now().day.toString() !=
            Provider.of<Lanprovider>(context, listen: false).time) {
          Provider.of<Lanprovider>(context, listen: false).cleardata();
        }
        Provider.of<Lanprovider>(context, listen: false).savedate();
        while (Dbhandler.instance.athancheak != 200) {
          await Provider.of<Athanprovider>(context, listen: false).fetchtimes();
        }
      }
      
    }
    setState(() {
      firstrun = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: scaffold,
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Background(),
                firstrun
                    ? Center(child: CircularProgressIndicator())
                    : cheak
                        ? Center(
                            child: Text(
                              'cheak internet',
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        : Center(
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                                child: (Userprovider.done == 'true')
                                    ? ListView(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.07),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  Provider.of<Userprovider>(
                                                                  context)
                                                              .score
                                                              .totalScore
                                                              .toString() ==
                                                          null
                                                      ? '-'
                                                      : 'Score:' +
                                                          Provider.of<Userprovider>(
                                                                  context)
                                                              .score
                                                              .totalScore
                                                              .toString(),
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Color.fromRGBO(
                                                              60, 60, 67, 1),
                                                          letterSpacing: .5,
                                                          fontSize: 24)),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    await Provider.of<
                                                                Userprovider>(
                                                            context,
                                                            listen: false)
                                                        .clearuserdata();
                                                    await Provider.of<
                                                                Lanprovider>(
                                                            context,
                                                            listen: false)
                                                        .cleardata();
                                                    Navigator.of(context)
                                                        .pushReplacementNamed(
                                                            Login.route);
                                                  },
                                                  child: Icon(
                                                    Icons.logout,
                                                    size: 35,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  duration: Duration(
                                                      milliseconds: 600),
                                                  type: PageTransitionType.fade,
                                                  child: Ramdan(),
                                                ),
                                              );
                                            },
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          254, 222, 133, 1),
                                                  radius: 60,
                                                  child: Container(
                                                    margin: EdgeInsets.all(10),
                                                    child: Image.asset(
                                                      'assets/images/ramdan.png',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  'Ramdan',
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        color: Color.fromRGBO(
                                                            60, 60, 67, 1),
                                                        letterSpacing: .5,
                                                        fontSize: 24),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  duration: Duration(
                                                      milliseconds: 800),
                                                  type: PageTransitionType.fade,
                                                  child: Salah(),
                                                ),
                                              );
                                            },
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          254, 222, 133, 1),
                                                  radius: 60,
                                                  child: Container(
                                                    margin: EdgeInsets.all(10),
                                                    child: Image.asset(
                                                        'assets/images/salah.png'),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  'Salah',
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        color: Color.fromRGBO(
                                                            60, 60, 67, 1),
                                                        letterSpacing: .5,
                                                        fontSize: 24),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  duration: Duration(
                                                      milliseconds: 600),
                                                  type: PageTransitionType.fade,
                                                  child: Duaas(),
                                                ),
                                              );
                                            },
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          254, 222, 133, 1),
                                                  radius: 60,
                                                  child: Container(
                                                    margin: EdgeInsets.all(10),
                                                    child: Image.asset(
                                                      'assets/images/dua-hands.png',
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  'Duas',
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        color: Color.fromRGBO(
                                                            60, 60, 67, 1),
                                                        letterSpacing: .5,
                                                        fontSize: 24),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Center(
                                            child: GestureDetector(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    duration: Duration(
                                                        milliseconds: 600),
                                                    type:
                                                        PageTransitionType.fade,
                                                    child: Duaas(),
                                                  ),
                                                );
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.3),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Color.fromRGBO(
                                                              254, 222, 133, 1),
                                                      radius: 60,
                                                      child: Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: Image.asset(
                                                          'assets/images/dua-hands.png',
                                                          fit: BoxFit.fitWidth,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    Text(
                                                      'Duas',
                                                      style: GoogleFonts.roboto(
                                                        textStyle: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    60,
                                                                    60,
                                                                    67,
                                                                    1),
                                                            letterSpacing: .5,
                                                            fontSize: 24),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                          ),
              ],
            ),
          )),
    );
  }
}
