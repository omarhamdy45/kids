import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Lanprovider with ChangeNotifier {
  bool isEn = false;
  int counter=0;
   changeLan(bool lan) async{
    isEn = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isEn", isEn);
  }

  getLan() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEn = prefs.getBool("isEn")?? true;
    notifyListeners();
  }
   changecounter(int lan) async{
    counter = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("counter", counter);
  }

  getcounter() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEn = prefs.getBool("counter")?? 0;
    notifyListeners();
  }
}
