import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Lanprovider with ChangeNotifier {
  bool isEn = false;
  bool isEn2 = false;
  bool isEn3 = false;
  bool isEn4 = false;
  bool isEn5 = false;
  bool isEn6 = false;
  bool isEn7 = false;
  bool isEn8 = false;
  bool status = false;
  String time;
  String fajr,duhr,asr,maghrib,isha;
  int counter1 = 0;
  int counter2 = 0;
  int counter3 = 0;
  changeLan(bool lan) async {
    isEn = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isEn", isEn);
  }

  getLan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEn = prefs.getBool("isEn") ?? false;
    notifyListeners();
  }

  changeLan2(bool lan) async {
    isEn2 = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isEn2", isEn2);
  }

  getLan2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEn2 = prefs.getBool("isEn2") ?? false;
    notifyListeners();
  }

  changeLan3(bool lan) async {
    isEn3 = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isEn3", isEn3);
  }

  getLan3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEn3 = prefs.getBool("isEn3") ?? false;
    notifyListeners();
  }

  changeLan4(bool lan) async {
    isEn4 = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isEn4", isEn4);
  }

  getLan4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEn4 = prefs.getBool("isEn4") ?? false;
    notifyListeners();
  }

  changeLan5(bool lan) async {
    isEn5 = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isEn5", isEn5);
  }

  getLan5() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEn5 = prefs.getBool("isEn5") ?? false;
    notifyListeners();
  }

  changeLan6(bool lan) async {
    isEn6 = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isEn6", isEn6);
  }

  getLan6() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEn6 = prefs.getBool("isEn6") ?? false;
    notifyListeners();
  }

  changeLan7(bool lan) async {
    isEn7 = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isEn7", isEn6);
  }

  getLan7() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEn7 = prefs.getBool("isEn7") ?? false;
    notifyListeners();
  }

  changeLan8(bool lan) async {
    isEn8 = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isEn8", isEn8);
  }

  getLan8() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEn8 = prefs.getBool("isEn8") ?? false;
    notifyListeners();
  }

  changecounter1(int lan) async {
    counter1 = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("counter1", counter1);
  }

  getcounter1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter1 = prefs.getInt("counter1") ?? 0;
    notifyListeners();
  }

  changecounter2(int lan) async {
    counter2 = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("counter2", counter2);
  }

  getcounter2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter2 = prefs.getInt("counter2") ?? 0;
    notifyListeners();
  }

  changecounter3(int lan) async {
    counter3 = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("counter3", counter3);
  }

  getcounter3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter3 = prefs.getInt("counter3") ?? 0;
    notifyListeners();
  }

  savedate() async {
    time = DateTime.now().day.toString();
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("time", time);
  }


  getdate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    time = prefs.get("time") ?? 0;
    notifyListeners();
  }

  Future<void> cleardata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isEn');
    prefs.remove('isEn2');
    prefs.remove('isEn3');
    prefs.remove('isEn4');
    prefs.remove('isEn5');
    prefs.remove('isEn6');
    prefs.remove('isEn7');
    prefs.remove('isEn8');
    prefs.remove('counter1');
    prefs.remove('counter2');
    prefs.remove('counter3');
  }
  

}
