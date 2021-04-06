import 'package:flutter/material.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/models/location.dart';
import 'package:kidsapp/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userprovider with ChangeNotifier {
  User currentUser;
  Location location;
  static String country;
  static String city;
  static String timezone;
  static String sd;
  static int score = 0;
  
  Future<void> saverUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', currentUser.token);
    preferences.setString('name', currentUser.name);
    preferences.setString('email', currentUser.email);
    // preferences.setString('id', currentUser.id.toString());
  }

  Future<void> clearuserdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('token');
    preferences.remove('name');
    preferences.remove('email');
  }

  Future<String> signInn(String email, String password) async {
    try {
      currentUser = await Dbhandler.instance.signIn(email, password);
      //await clearuserdata();
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

  Future<void> fetchuserlocation() async {
    try {
      location = await Dbhandler.instance.getlocation();
     // country = location.country;
     // city = location.city;
     // timezone = location.timezone.split('/').first;
    } catch (error) {
      print('errorrr');
    }
  }
}
