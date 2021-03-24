import 'package:flutter/material.dart';
import 'package:kids/models/Athan.dart';
import 'package:kids/models/db.dart';

class Athanprovider with ChangeNotifier {
  Athan time;
  Future<void> fetchtimes() async {
    try {
      time = await Dbhandler.instance.getslider();
      print(time.data.timings.asr);
    } catch (error) {
      print('error');
    }
  }
}
