import 'package:flutter/material.dart';
import 'package:kids/models/Athan.dart';
import 'package:kids/models/db.dart';

class Athanprovider with ChangeNotifier {
  Athan time;
  Future<void> fetchtimes() async {
    try {
      time = await Dbhandler.instance.gettimes();
    } catch (error) {
      print('error');
    }
  }
}
