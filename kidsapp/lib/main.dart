import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/providers/azkarprovider.dart';
import 'package:kidsapp/providers/deedprovider.dart';
import 'package:kidsapp/providers/duaaprovider.dart';
import 'package:kidsapp/providers/hadithprovider.dart';
import 'package:kidsapp/providers/lanprovider.dart';
import 'package:kidsapp/providers/quraanprovider.dart';
import 'package:kidsapp/providers/userprovider.dart';
import 'package:kidsapp/screens/ala.dart';
import 'package:kidsapp/screens/alram.dart';
import 'package:kidsapp/screens/asd.dart';
import 'package:kidsapp/screens/azkar.dart';
import 'package:kidsapp/screens/dialyhadith.dart';
import 'package:kidsapp/screens/duaas.dart';
import 'package:kidsapp/screens/login.dart';
import 'package:kidsapp/screens/soura.dart';
import 'package:kidsapp/screens/sours.dart';
import 'package:kidsapp/screens/splash.dart';
import 'package:kidsapp/screens/ramdanscreen.dart';
import 'package:kidsapp/screens/salah.dart';
import 'package:kidsapp/screens/types.dart';
import 'package:kidsapp/widgets/duadetails.dart';
import 'package:provider/provider.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String countKey = 'count';

/// The name associated with the UI isolate's [SendPort].
const String isolateName = 'isolate';

/// A port used to communicate from a background isolate to the UI isolate.
final ReceivePort port = ReceivePort();

/// Global [SharedPreferences] object.
SharedPreferences prefs;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  int alarmId = 1;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Athanprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Userprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Azkarprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Hadithprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Duaaprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Deedprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Lanprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Quraanprovider(),
        ),
      ],
      child: MyApp(),
    ),
  );
  await AndroidAlarmManager.initialize();
  AndroidAlarmManager.periodic(Duration(seconds: 10), alarmId, fireAlarm);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Islamiccity',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(184, 95, 143, 1),
          accentColor: Color.fromRGBO(167, 85, 163, 1),
        ),
        home: FutureBuilder(
          future:
              Provider.of<Userprovider>(context, listen: false).isLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Splash();
            } else if (snapshot.data == true) {
              return Splash();
            } else {
              return Login();
            }
          },
        ),
        routes: {
          Login.route: (context) => Login(),
          Salah.route: (context) => Salah(),
          Ramdan.route: (context) => Ramdan(),
          Duadetails.route: (context) => Duadetails(),
          Duaas.route: (context) => Duaas(),
          Azkar.route: (context) => Azkar(),
          Types.route: (context) => Types(),
          Dialyhadith.route: (context) => Dialyhadith(),
          Surz.route: (context) => Surz(),
          Soura.route: (context) => Soura(),
        });
  }
}
