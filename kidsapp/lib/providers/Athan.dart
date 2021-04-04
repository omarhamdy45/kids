import 'package:flutter/material.dart';
import 'package:kidsapp/models/Athan.dart';
import 'package:kidsapp/models/db.dart';

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
