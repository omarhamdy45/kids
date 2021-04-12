import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:kidsapp/models/Athan.dart';
import 'package:kidsapp/models/Categories.dart';
import 'package:kidsapp/models/Hadith.dart';
import 'package:kidsapp/models/catgoriess.dart';
import 'package:kidsapp/models/location.dart';
import 'package:kidsapp/models/score.dart';
import 'package:kidsapp/models/user.dart';
import 'package:kidsapp/providers/userprovider.dart';

class Dbhandler {
  static Dbhandler _instance = Dbhandler._private();
  Dbhandler._private();
  static Dbhandler get instance => _instance;
  Dio _dio = Dio();
  int cheaksalah;
  int hadithreadd;
  int deedreadd;
  int duaareadd;
  int counter;
  int azkarreadd;
  int ramdanstatuss;

  String mainurl = 'https://muslim-kids.royaltechni.com/api';
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
    if (country == 'United Arab Emirates') {
      method = '4';
    }
    if (country == 'Iran') {
      method = '7';
    }

    if (country == 'Egypt' ||
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
    //  print(response.data);
    return Location.fromJson(response.data);
  }

/*
  Future<Azkarr> getallazkar() async {
    String url = '$mainurl/azkar';
    Response response = await _dio.get(url);
    print(response.data);
    return Azkarr.fromJson(response.data);
  }
  */
  Future<Categories> getallcategries() async {
    String url = '$mainurl/categories';
    Response response = await _dio.get(url);
    print(response.data);
    return Categories.fromJson(response.data);
  }

  Future<Categoriess> gethadithbyid(int id) async {
    String url = '$mainurl/categories/$id';
    Response response = await _dio.get(url);
    //  print(response.data);
    return Categoriess.fromJson(response.data);
  }

  Future<Hadith> getallhadith() async {
    String url = '$mainurl/hadith';
    Response response = await _dio.get(url);
    // print(response.data);
    return Hadith.fromJson(response.data);
  }

  Future<Hadith> getallduuas() async {
    String url = '$mainurl/duaa';
    Response response = await _dio.get(url);
    print(response.data);
    return Hadith.fromJson(response.data);
  }

  Future<Hadith> getalldeed() async {
    String url = '$mainurl/deed';
    Response response = await _dio.get(url);
    //  print(response.data);
    return Hadith.fromJson(response.data);
  }

  Future<User> signIn(String email, String password) async {
    String url = '$mainurl/login';
    Response response = (await _dio.post(
      url,
      data: {
        'name': email,
        'password': password,
      },
    ));
    print(response.data);
    return User.fromjson(response.data);
  }

  Future<void> azkarread(String status, String categoryid) async {
    String url = '$mainurl/azkar_status';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenn',
        },
        body: {
          'status': status,
          'category_id': categoryid,
        },
      );
      azkarreadd = response.statusCode;
      print(response.body);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> hadithread(String hadithid, String status) async {
    String url = '$mainurl/hadith_status';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenn',
        },
        body: {
          'hadith_id': hadithid,
          'status': status,
        },
      );
      hadithreadd = response.statusCode;
      print(response.statusCode);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> duaaread(String duaaid, String status) async {
    String url = '$mainurl/duaa_status';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenn',
        },
        body: {
          'duaa_id': duaaid,
          'status': status,
        },
      );
      duaareadd = response.statusCode;
      //     print(response.body);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> deaedread(String duaaid, String status) async {
    String url = '$mainurl/deed_status';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenn',
        },
        body: {
          'deed_id': duaaid,
          'status': status,
        },
      );
      deedreadd = response.statusCode;
      print(response.body);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> salahevluate(String salahid, String status,String zekr) async {
    String url = '$mainurl/salah_status';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenn',
        },
        body: {
          'salah_id': salahid,
          'status': status,
          'StatusOfZkr':zekr,
        },
      );
      cheaksalah = response.statusCode;
      //    print(response.body);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> ramdanstatus(String status) async {
    String url = '$mainurl/ramadan_status';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenn',
        },
        body: {
          'status': status,
        },
      );
      print(response.body);
      ramdanstatuss = response.statusCode;
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> activity(String status, String activityid) async {
    String url = '$mainurl/activity_status';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenn',
        },
        body: {'activity_id': activityid, 'status': status},
      );
      print(response.body);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> quraantracker(String aya, String soura, String goz) async {
    String url = '$mainurl/quran_status';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenn',
        },
        body: {'countOfAya': aya, 'countOfSoura': soura, 'countOfGoza': goz},
      );
      counter = response.statusCode;
      print(response.body);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<Score> getscore() async {
    String url = '$mainurl/score';
    final String tokenn = Userprovider.sd;
    _dio.options.headers["Authorization"] = "Bearer $tokenn";

    Response response = await _dio.get(
      url);
    print(response.data);
    return Score.fromJson(response.data);
  }
}
