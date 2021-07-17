import 'dart:isolate';
import 'dart:math';
import 'dart:ui';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/providers/azkarprovider.dart';
import 'package:kidsapp/providers/deedprovider.dart';
import 'package:kidsapp/providers/duaaprovider.dart';
import 'package:kidsapp/providers/hadithprovider.dart';
import 'package:kidsapp/providers/lanprovider.dart';
import 'package:kidsapp/providers/quraanprovider.dart';
import 'package:kidsapp/providers/userprovider.dart';
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

import 'screens/ala.dart';

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
  SharedPreferences prefs;

  WidgetsFlutterBinding.ensureInitialized();

  // Register the UI isolate's SendPort to allow for communication from the
  // background isolate.
  IsolateNameServer.registerPortWithName(
    port.sendPort,
    isolateName,
  );
  prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey(countKey)) {
    await prefs.setInt(countKey, 0);
  }
  AndroidAlarmManager.initialize();
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
}

class MyApp extends StatefulWidget {
  static AssetsAudioPlayer assetsAudioPlayer;
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int alarmId = 1;
  int _counter = 0;
  bool firstrun;
  String isha;
  String fajr;
  String asr;
  String duhr;
  String maghrib;

  AssetsAudioPlayer assetsAudioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
/*
    assetsAudioPlayer = AssetsAudioPlayer();

    assetsAudioPlayer.open(Audio('assets/audios/azan1.mp3'),
        autoStart: true,
        playInBackground: PlayInBackground.enabled,
        showNotification: true);
*/
    AndroidAlarmManager.initialize();
    // Register for events from the background isolate. These messages will
    // always coincide with an alarm firing.
    port.listen((_) async => await _incrementCounter());
  }

  Future<void> _incrementCounter() async {
    print('Increment counter!');
    await prefs.reload();
    setState(() {
      _counter++;
    });
  }

  static SendPort uiSendPort;

  // The callback for our alarm
  static Future<void> callback() async {
    var format = DateFormat("HH:mm");
    AssetsAudioPlayer assetsAudioPlayer;
    final player = AudioPlayer();
    DateTime datetime = DateTime.now();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isha = prefs.getString("ishatime");
    final fajr = prefs.getString("fajrtime");
    final asr = prefs.getString("asrtime");
    final duhr = prefs.getString("durtime");
    final maghrib = prefs.getString("maghribtime");
    // final player = new AudioPlayer();
    var hour1 = format.parse("${datetime.hour}:${datetime.minute}");
    (hour1 == format.parse(isha) ||
            hour1 == format.parse(fajr) ||
            hour1 == format.parse(asr) ||
            hour1 == format.parse(duhr) ||
            hour1 == format.parse(maghrib))
        ? player.play(
            'https://muslim-kids.royaltechni.com/public/assets/audio/dailyhadiths/-1624720322.mp3')
        : print('fire');
    int currentCount = prefs.getInt(countKey) ?? 0;
    await prefs.setInt(countKey, currentCount + 1);
    // This will be null if we're running in the background.
    uiSendPort ??= IsolateNameServer.lookupPortByName(isolateName);
    uiSendPort?.send(null);
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isha = prefs.getString("ishatime");
    fajr = prefs.getString("fajrtime");
    asr = prefs.getString("asrtime");
    duhr = prefs.getString("durtime");
    maghrib = prefs.getString("maghribtime");
    AndroidAlarmManager.oneShotAt(
      DateTime(2021, 7, DateTime.now().day, int.parse(fajr.split(':').first),
          int.parse(fajr.split(':').last)),
      Random().nextInt(pow(2, 31).toInt()),
      callback,
      exact: true,
      //  wakeup: true,
    );

    AndroidAlarmManager.oneShotAt(
      DateTime(2021, 7, DateTime.now().day, int.parse(duhr.split(':').first),
          int.parse(duhr.split(':').last)),
      Random().nextInt(pow(2, 31).toInt()),
      callback,
      exact: true,
      //   wakeup: true,
    );
    AndroidAlarmManager.oneShotAt(
      DateTime(2021, 7, DateTime.now().day, int.parse(asr.split(':').first),
          int.parse(asr.split(':').last)),
      Random().nextInt(pow(2, 31).toInt()),
      callback,
      exact: true,
      //   wakeup: true,
    );
    AndroidAlarmManager.oneShotAt(
      DateTime(2021, 7, DateTime.now().day, int.parse(maghrib.split(':').first),
          int.parse(maghrib.split(':').last)),
      Random().nextInt(pow(2, 31).toInt()),
      callback,
      exact: true,
      //   wakeup: true,
    );
    AndroidAlarmManager.oneShotAt(
      DateTime(2021, 7, DateTime.now().day, int.parse(isha.split(':').first),
          int.parse(isha.split(':').last)),
      Random().nextInt(pow(2, 31).toInt()),
      callback,
      exact: true,
      //  wakeup: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    // AndroidAlarmManager.periodic(Duration(seconds: 60), alarmId, fireAlarm);
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
