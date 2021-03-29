import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kids/models/Athan.dart';
import 'package:kids/models/location.dart';
import 'package:kids/providers/userprovider.dart';

class Dbhandler {
  static Dbhandler _instance = Dbhandler._private();
  Dbhandler._private();
  static Dbhandler get instance => _instance;
  Dio _dio = Dio();
  Future<Athan> gettimes() async {
    String city = Userprovider.city;
    String country = Userprovider.country;
    String zone = Userprovider.timezone;
    String method;
    if (zone == 'Europe') {
      method = '3';
    }
    if (zone == 'North America') {
      method = '2';
    }
    if (country == 'MAKKAH') {
      method = '4';
    }
    if (country == 'Iran') {
      method = '7';
    }

    if (zone == 'Africa' ||
        country == 'Syria' ||
        country == 'Lebanon' ||
        country == 'Malaysia') {
      method = '5';
    }
    if (country == 'Pakistan' ||
        country == 'Afganistan' ||
        country == 'Bangladesh' ||
        country == 'India') {
      method = '1';
    }

    String url =
        'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method';
    Response response = await _dio.get(url);
    print(response.data);
    return Athan.fromJson(response.data);
  }

  Future<Location> getlocation() async {
    String url = 'http://ip-api.com/json';
    Response response = await _dio.get(url);
    print(response.data);
    return Location.fromJson(response.data);
  }
}
