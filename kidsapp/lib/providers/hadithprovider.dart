import 'package:flutter/material.dart';
import 'package:kidsapp/models/Hadith.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/models/dialyhadith.dart';
import 'package:kidsapp/models/hadithlevel.dart';

class Hadithprovider with ChangeNotifier {
  Hadith azkar;
  Dailyhadith dailyhadith;
  Hadithlevel hadithlevles;
  Future<void> fetchallhadith() async {
    try {
      azkar = await Dbhandler.instance.getallhadith();
    } catch (error) {
      print('errorrrrrrrrrrrrrr');
    }
  }

  Future<void> fetchdailyhadith() async {
    try {
      dailyhadith = await Dbhandler.instance.getdialyhadith();
    } catch (error) {
      print('errorrrrrrrrrrrrrr');
    }
  }

  Future<void> fetchhadithlevels() async {
    try {
      hadithlevles = await Dbhandler.instance.gethadithleevel();
     // print(hadithlevles.levels[0].allhadiths[0].title);
    } catch (error) {
      print('errorrrrrrrrrrrrrr');
    }
  }
}
