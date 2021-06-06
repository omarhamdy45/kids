import 'dart:async';


import 'package:flutter/material.dart';
import 'package:kidsapp/models/ayah.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/models/sour.dart';
import 'package:kidsapp/screens/quraan.dart';

class Quraanprovider with ChangeNotifier {
  Sour sour;
  Ayah ayah;

  Future<void> fetchsour() async {
    try {
      sour = await Dbhandler.instance.getsour();
      print(sour.data[0].name);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> fetchayat(int id) async {
    try {
      ayah = await Dbhandler.instance.getayatbyid(id);
    } catch (eroor) {
      print(eroor);
    }
  }
}
