import 'package:flutter/material.dart';
import 'package:kidsapp/models/Athan.dart';
import 'package:kidsapp/models/db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Athanprovider with ChangeNotifier {
  Athan time;
  String fajr, duhr, asr, maghrib, isha;
  Future<void> fetchtimes() async {
    try {
      time = await Dbhandler.instance.gettimes();
    } catch (error) {
      print('errorrrr');
    }
  }
/*
  savedsalah() async {
    fajr = time.data.timings.fajr;
    duhr = time.data.timings.dhuhr;
    asr = time.data.timings.asr;
    maghrib = time.data.timings.maghrib;
    isha = time.data.timings.isha;

    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fajr", fajr);
    prefs.setString("duhr", duhr);
    prefs.setString("asr", asr);
    prefs.setString("maghrib", maghrib);
    prefs.setString("isha", isha);
  }

  getsalah() async {
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString(fajr);
    prefs.getString(duhr);
    prefs.getString(asr);
    prefs.getString(maghrib);
    prefs.getString(isha);
  }
  */
}
