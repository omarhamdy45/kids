import 'package:flutter/material.dart';
import 'package:kidsapp/models/Athan.dart';
import 'package:kidsapp/models/db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Athanprovider with ChangeNotifier {
  Athan time;

  static String fajrtime, asrtime, duhrtime, ishatime, maghribtime;

  Future<void> fetchtimes() async {
    try {
      time = await Dbhandler.instance.gettimes();

      //   fajrtime = int.parse(time.data.timings.fajr.split(':').last);
      
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("fajrtime", time.data.timings.fajr);
      prefs.setString("asrtime", time.data.timings.asr);
      prefs.setString("durtime", time.data.timings.dhuhr);
      prefs.setString("maghribtime", time.data.timings.maghrib);
      prefs.setString("ishatime", time.data.timings.isha);
    
      /*
      prefs.setString("fajrtime", time.data.timings.fajr);
      prefs.setString("fajrtime", time.data.timings.fajr);
      prefs.setString("fajrtime", time.data.timings.fajr);
      */
    } catch (error) {
      print('errorrrrrr');
    }
  }

  getLan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Athanprovider.fajrtime = prefs.getString("fajrtime");
    Athanprovider.asrtime = prefs.getString("asrtime");
    Athanprovider.duhrtime = prefs.getString("durtime");
    Athanprovider.maghribtime = prefs.getString("maghribtime");
    Athanprovider.ishatime = prefs.getString("ishatime");
    notifyListeners();
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
