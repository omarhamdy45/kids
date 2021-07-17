import 'dart:async';
import 'dart:io';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/models/ayah.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/providers/lanprovider.dart';
import 'package:kidsapp/providers/userprovider.dart';
import 'package:kidsapp/screens/duaas.dart';
import 'package:kidsapp/screens/hadithsection.dart';
import 'package:kidsapp/screens/login.dart';
import 'package:kidsapp/screens/quraan.dart';
import 'package:kidsapp/screens/ramdanscreen.dart';
import 'package:kidsapp/screens/salah.dart';

import 'package:provider/provider.dart';

class Types extends StatefulWidget {
  static const String route = 'types';
  static AudioPlayer player2;
  static bool alarm = true;
  @override
  _TypesState createState() => _TypesState();
}

class _TypesState extends State<Types> with TickerProviderStateMixin {
  bool firstrun;
  int i;
  String currentPostion;
  bool cheak;
  GlobalKey<ScaffoldState> scaffold;
  TabController tabController;
  AudioPlayer player2;

  @override
  void initState() {
    super.initState();
    player2 = AudioPlayer();
    scaffold = GlobalKey<ScaffoldState>();
    // final assetsAudioPlayer = AssetsAudioPlayer();
    cheaknetwork();
    tabController = TabController(length: 5, vsync: this);
    firstrun = true;
    Userprovider.sd = Provider.of<Userprovider>(context, listen: false)
        .currentUser
        .token
        .toString();
    setState(() {
      Types.alarm = false;
    });
  }

  Future<bool> _onWillPop() async {
    print("on will pop");
    if (tabController.index == 0) {
      await SystemNavigator.pop();
    } else {
      tabController.index = 0;
    }
  }

  Future<void> cheaknetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        cheak = true;
      }
    } on SocketException catch (_) {
      scaffold.currentState.showSnackBar(SnackBar(
        content: Text('Cheak Netwok'),
        backgroundColor: Colors.red[600],
      ));
      cheak = false;
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

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
      // await Provider.of<Athanprovider>(context, listen: false).getLan();

    }

    if (!mounted) return;
    setState(() {
      cheak ? firstrun = false : firstrun = true;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int year = DateTime.now().year;
    int day = DateTime.now().day;
    int mounth = DateTime.now().month;
    int nexthour;
    int nextminute;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
            key: scaffold,
            appBar: AppBar(
              toolbarHeight: 140,
              title: firstrun
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                          ),
                          GestureDetector(
                            onTap: () async {
                              AssetsAudioPlayer.newPlayer().open(
                                Audio("assets/audios/azan1.mp3"),
                                autoStart: true,
                                //  autoPlay: true,
                                showNotification: true,
                              );
                            },
                            child: Text(
                              Provider.of<Userprovider>(context, listen: false)
                                  .score
                                  .totalScore
                                  .toString(),
                              style: GoogleFonts.roboto(
                                letterSpacing: 0.5,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              actions: [
                GestureDetector(
                  onTap: () async {
                    await Provider.of<Userprovider>(context, listen: false)
                        .clearuserdata();
                    await Provider.of<Lanprovider>(context, listen: false)
                        .cleardata();
                    Navigator.of(context).pushReplacementNamed(Login.route);
                  },
                  child: Container(
                      margin: EdgeInsets.all(5),
                      child: Icon(
                        Icons.logout,
                        size: 35,
                      )),
                )
              ],
              backgroundColor: Theme.of(context).primaryColor,
              bottom: TabBar(
                controller: tabController,
                indicatorColor: Colors.white,
                isScrollable: true,
                tabs: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Tab(
                        icon: FittedBox(
                            child: Column(
                      children: [
                        Image.asset('assets/images/salah.png'),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Salah',
                          style: GoogleFonts.roboto(
                            letterSpacing: 0.5,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ))),
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Tab(
                        icon: FittedBox(
                            child: Column(
                      children: [
                        Image.asset('assets/images/azkar.png'),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Athkar',
                          style: GoogleFonts.roboto(
                            letterSpacing: 0.5,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 60,
                    child: Tab(
                        icon: FittedBox(
                            child: Column(
                      children: [
                        Image.asset('assets/images/ramadan.png'),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Ramdan',
                          style: GoogleFonts.roboto(
                            letterSpacing: 0.5,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 60,
                    child: Tab(
                        icon: FittedBox(
                            child: Column(
                      children: [
                        Image.asset('assets/images/quraan.png'),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Qur`an',
                          style: GoogleFonts.roboto(
                            letterSpacing: 0.5,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 60,
                    child: Tab(
                        icon: FittedBox(
                            child: Column(
                      children: [
                        Image.asset('assets/images/hadith.png'),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Hadith',
                          style: GoogleFonts.roboto(
                            letterSpacing: 0.5,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ))),
                  ),
                ],
                indicatorWeight: 4,
                enableFeedback: false,
              ),
            ),
            body: firstrun
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : TabBarView(
                    controller: tabController,
                    children: [
                      Salah(),
                      Duaas(),
                      Ramdan(),
                      Quraan(),
                      Hadithsection()
                    ],
                  )),
      ),
    );
  }
}
