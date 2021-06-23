import 'package:flutter/material.dart';
import 'package:kidsapp/models/Hadith.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/models/dialyhadith.dart';

class Hadithprovider with ChangeNotifier {
  Hadith azkar;
  Dailyhadith dailyhadith;
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
}
