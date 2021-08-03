import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:kidsapp/models/Homedata.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/models/location.dart';
import 'package:kidsapp/models/score.dart';
import 'package:kidsapp/models/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Userprovider with ChangeNotifier {
  User currentUser;
  Locationn location;
  static String country;
  static String city;
  static String timezone;
  static String sd;
  static String done;
  static String username;
  Score score;
  Homedata homedata;

  Future<Score> fetchscore() async {
    try {
      score = await Dbhandler.instance.getscore();
      print(score.totalScore);
    } catch (error) {
      print('erroe');
    }
  }

  Future<void> saverUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', currentUser.token);
    preferences.setString('name', Userprovider.username);
  //  preferences.setString('email', currentUser.email);
    // preferences.setString('id', currentUser.id.toString());
  }


  Future<void> clearuserdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('token');
    preferences.remove('name');
  }

  Future<String> signInn(String email, String password) async {
    try {
      currentUser = await Dbhandler.instance.signIn(email, password);
      await saverUserData();
      return null;
    } catch (error) {
      return 'errorrrrrrr';
    }
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey('token')) {
      currentUser = User.fromPrefs(preferences);
      return true;
    } else {
      return false;
    }
  }
    Future<void> getusername() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
      currentUser = User.fromPrefs(preferences);
  }


  Future<void> fetchuserlocation() async {
    try {
      location = await Dbhandler.instance.getlocation();
      country = location.country;
      // city = location.city;
      timezone = location.timezone.split('/').first;
    } catch (error) {
      print('errorrr');
    }
  }

  Future<void> getUserLocation() async {
    try {
      var position = await GeolocatorPlatform.instance
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      var placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      var first = placemarks.first;
      Userprovider.city = first.administrativeArea;
      Userprovider.country = first.country;
      Userprovider.done = 'true';
    } catch (error) {
      return false;
    }
  }
  Future<Score> fetchhomedata() async {
    try {
      homedata = await Dbhandler.instance.gethomedata();
    } catch (error) {
      print('erroe');
    }
  }
}
