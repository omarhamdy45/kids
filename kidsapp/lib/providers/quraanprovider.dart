import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kidsapp/models/ayacheak.dart';
import 'package:kidsapp/models/ayah.dart';
import 'package:kidsapp/models/ayasaves.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/models/guz2save.dart';
import 'package:kidsapp/models/quraanlevles.dart';
import 'package:kidsapp/models/sour.dart';

class Quraanprovider with ChangeNotifier {
  Sour sour;
  Ayah ayah;
  Ayasaves ayasaves;
  Juz2save juz2save;
  Ayacheak ayacheak;

  Levles levles;
  Future<void> fetchsour() async {
    try {
      sour = await Dbhandler.instance.getsour();
      print(sour.data[106].name);
    } catch (eroor) {
      print(eroor);
    }
  }

  

  Future<void> fetchayat(int id) async {
    try {
      ayah = await Dbhandler.instance.getayatbyid(id);
      print(ayah.data.number);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> fetchayasave(int id) async {
    try {
      ayasaves = await Dbhandler.instance.getayasaves(id);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> fetchlevels() async {
    try {
      levles = await Dbhandler.instance.getlevles();
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> fetchjuz2saaves() async {
    try {
      juz2save = await Dbhandler.instance.getguzsaved();
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> fetchayacheak(int id) async {
    try {
      ayacheak = await Dbhandler.instance.getayacheak(id);
    } catch (eroor) {
      print(eroor);
    }
  }
}
