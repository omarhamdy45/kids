import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/providers/lanprovider.dart';
import 'package:kidsapp/providers/networkprovider.dart';
import 'package:kidsapp/providers/userprovider.dart';
import 'package:kidsapp/screens/Homescreen.dart';
import 'package:kidsapp/screens/duaas.dart';
import 'package:kidsapp/screens/hadithsection.dart';
import 'package:kidsapp/screens/login.dart';
import 'package:kidsapp/screens/quraan.dart';
import 'package:kidsapp/screens/ramdanscreen.dart';
import 'package:kidsapp/screens/salah.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:provider/provider.dart';

import 'namesofallah.dart';

class Home extends StatefulWidget {
  static const String route = 'types';
  static int homeindex = 0;
  @override
  _TypesState createState() => _TypesState();
}

class _TypesState extends State<Home> with TickerProviderStateMixin {
  bool firstrun;
  int i;
  String currentPostion;

  TabController tabController;
  AudioPlayer player2;
  GlobalKey<ScaffoldState> scaffoldd;

  @override
  void initState() {
    super.initState();
    // int arg = ModalRoute.of(context).settings.arguments as int;
    player2 = AudioPlayer();

    scaffoldd = GlobalKey<ScaffoldState>();
    // final assetsAudioPlayer = AssetsAudioPlayer();

    tabController = TabController(length: 7, vsync: this);
    tabController.index = Home.homeindex;
    firstrun = true;
    
    Userprovider.sd = Provider.of<Userprovider>(context, listen: false)
        .currentUser
        .token
        .toString();
  }

  Future<bool> _onWillPop() async {
    print("on will pop");
    if (tabController.index == 0) {
      await SystemNavigator.pop();
    } else {
      tabController.index = 0;
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    await Provider.of<Lanprovider>(context, listen: false).getLanguage();
    await Provider.of<Lanprovider>(context, listen: false).getdate();
    if (DateTime.now().day.toString() !=
        Provider.of<Lanprovider>(context, listen: false).time) {
      Provider.of<Lanprovider>(context, listen: false).cleardata();

      Provider.of<Lanprovider>(context, listen: false).savedate();
    }
    Map<Permission, PermissionStatus> statuses =
        await [Permission.location].request();
    setState(() {
      firstrun = false;
    });
    // await Provider.of<Athanprovider>(context, listen: false).getLan();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Provider.of<Lanprovider>(context, listen: false).isenglish
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: DefaultTabController(
          length: 7,
          child: Scaffold(
              key: scaffoldd,
              appBar: AppBar(
                toolbarHeight: 140,
                title: firstrun
                    ? Container()
                    : Provider.of<Lanprovider>(context, listen: false).isenglish
                        ? Container()
                        : GestureDetector(
                            onTap: () async {
                              await Provider.of<Userprovider>(context,
                                      listen: false)
                                  .clearuserdata();
                              await Provider.of<Lanprovider>(context,
                                      listen: false)
                                  .cleardata();
                              Navigator.of(context)
                                  .pushReplacementNamed(Login.route);
                            },
                            child: Container(
                                margin: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.logout,
                                  size: 35,
                                )),
                          ),
                actions: [
                  Provider.of<Lanprovider>(context, listen: false).isenglish
                      ? GestureDetector(
                          onTap: () async {
                            await Provider.of<Userprovider>(context,
                                    listen: false)
                                .clearuserdata();
                            await Provider.of<Lanprovider>(context,
                                    listen: false)
                                .cleardata();
                            Navigator.of(context)
                                .pushReplacementNamed(Login.route);
                          },
                          child: Container(
                              margin: EdgeInsets.all(5),
                              child: Icon(
                                Icons.logout,
                                size: 35,
                              )),
                        )
                      : Container()
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
                          icon: Column(
                        children: [
                          Image.asset(
                            'assets/images/home.png',
                            height: 34,
                          ),
                          Text(
                            Provider.of<Lanprovider>(context, listen: false)
                                    .isenglish
                                ? 'Home'
                                : 'الرئسية',
                            style: GoogleFonts.roboto(
                                letterSpacing: 0.5,
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Tab(
                          icon: Column(
                        children: [
                          Image.asset(
                            'assets/images/Group 2451.png',
                            height: 34,
                          ),
                          Text(
                            Provider.of<Lanprovider>(context, listen: false)
                                    .isenglish
                                ? 'Salah'
                                : 'الصلاة',
                            style: GoogleFonts.roboto(
                                letterSpacing: 0.5,
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Tab(
                          icon: Column(
                        children: [
                          Image.asset(
                            'assets/images/Group 2453.png',
                            height: 34,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            Provider.of<Lanprovider>(context, listen: false)
                                    .isenglish
                                ? 'Athkar'
                                : 'الأذكار',
                            style: GoogleFonts.roboto(
                                letterSpacing: 0.5,
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 60,
                      child: Tab(
                          icon: Column(
                        children: [
                          Image.asset(
                            'assets/images/Group 6.png',
                            height: 34,
                          ),
                          Text(
                            Provider.of<Lanprovider>(context, listen: false)
                                    .isenglish
                                ? 'Qur`an'
                                : 'القرآن الكريم',
                            style: GoogleFonts.roboto(
                                letterSpacing: 0.5,
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 60,
                      child: Tab(
                          icon: Column(
                        children: [
                          Image.asset(
                            'assets/images/Group 5.png',
                            height: 34,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            Provider.of<Lanprovider>(context, listen: false)
                                    .isenglish
                                ? 'Hadith'
                                : 'الحديث النبوي',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                letterSpacing: 0.5,
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 60,
                      child: Tab(
                          icon: Column(
                        children: [
                          Image.asset(
                            'assets/images/Group 2457.png',
                            height: 34,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            Provider.of<Lanprovider>(context, listen: false)
                                    .isenglish
                                ? 'NamesofAllah'
                                : "أسماء الله الحسنى",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                letterSpacing: 0.5,
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 60,
                      child: Tab(
                          icon: Column(
                        children: [
                          Image.asset(
                            'assets/images/ramdan1.png',
                            height: 34,
                          ),
                          Text(
                            Provider.of<Lanprovider>(context, listen: false)
                                    .isenglish
                                ? 'Ramdan'
                                : 'رمضان',
                            style: GoogleFonts.roboto(
                                letterSpacing: 0.5,
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                    ),
                  ],
                  indicatorWeight: 4,
                  //enableFeedback: false,
                ),
              ),
              body: firstrun
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : TabBarView(
                      controller: tabController,
                      children: [
                        Homescreen(),
                        Salah(),
                        Duaas(),
                        Quraan(),
                        Hadithsection(),
                        Namesofallah(),
                        Ramdan(),
                      ],
                    )),
        ),
      ),
    );
  }
}
