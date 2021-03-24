import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kids/models/Athan.dart';

class Dbhandler {
  static Dbhandler _instance = Dbhandler._private();
  Dbhandler._private();
  static Dbhandler get instance => _instance;
  Dio _dio = Dio();
  Future<Athan> getslider() async {
    String url = 'http://api.aladhan.com/v1/timingsByCity?city=Ajman&country=United%20Arab%20Emirates&method=4';
    Response response = await _dio.get(url);
    print(response.data);
    return Athan.fromJson(response.data);
  }
}
