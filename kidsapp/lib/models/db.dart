import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:kidsapp/models/Athan.dart';
import 'package:kidsapp/models/Categories.dart';
import 'package:kidsapp/models/Hadith.dart';
import 'package:kidsapp/models/Homedata.dart';
import 'package:kidsapp/models/ayacheak.dart';
import 'package:kidsapp/models/ayah.dart';
import 'package:kidsapp/models/ayasaves.dart';
import 'package:kidsapp/models/catgoriess.dart';
import 'package:kidsapp/models/dialyhadith.dart';
import 'package:kidsapp/models/hadithlevel.dart';
import 'package:kidsapp/models/quraanlevles.dart';
import 'package:kidsapp/models/sour.dart';
import 'package:kidsapp/models/location.dart';
import 'package:kidsapp/models/score.dart';
import 'package:kidsapp/models/user.dart';
import 'package:kidsapp/providers/userprovider.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:kidsapp/screens/dialyhadith.dart';
import 'guz2save.dart';

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
  int athancheak;
  int dialyhadith;

  String mainurl = 'https://muslimkids.royaltechni.com/api';

  Future<Athan> gettimes() async {
    String city = Userprovider.city;
    String country = Userprovider.country;
    String method;

    if (country == 'MAKKAH' || country == 'United Arab Emirates') {
      method = '4';
    } else if (country == 'Egypt' ||
        country == 'Syria' ||
        country == 'Lebanon' ||
        country == 'Malaysia') {
      method = '5';
    }
    try {
      String url =
          'https://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method';
      print(url);
      http.Response response = await http.get(Uri.parse(url));
      athancheak = response.statusCode;
      // print(response.body);

      return Athan.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<Locationn> getlocation() async {
    String url = 'http://ip-api.com/json';
    Response response = await _dio.get(url);
    //  print(response.data);
    return Locationn.fromJson(response.data);
  }

  Future<Categories> getallcategries() async {
    String url = '$mainurl/categories';
    Response response = await _dio.get(url);
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

    return Hadith.fromJson(response.data);
  }

  Future<Hadith> getallduuas() async {
    String url = '$mainurl/duaa';
    Response response = await _dio.get(url);

    return Hadith.fromJson(response.data);
  }

  Future<Hadith> getalldeed() async {
    String url = '$mainurl/deed';
    Response response = await _dio.get(url);

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
    // print(response.data);
    return User.fromjson(response.data);
  }

  Future<void> azkarread(String status, String categoryid) async {
    String url = '$mainurl/azkar_status';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        Uri.parse(url),
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
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> hadithread(String hadithid, String status) async {
    String url = '$mainurl/hadith_status';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        Uri.parse(url),
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
      //  print(response.statusCode);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> duaaread(String duaaid, String status) async {
    String url = '$mainurl/duaa_status';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        Uri.parse(url),
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
        Uri.parse(url),
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
      //  print(response.body);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> salahevluate(String salahid, String status, String zekr) async {
    String url = '$mainurl/salah_status';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenn',
        },
        body: {
          'salah_id': salahid,
          'status': status,
          'StatusOfZkr': zekr,
        },
      );
      cheaksalah = response.statusCode;
      print(response.statusCode);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> ramdanstatus(String status) async {
    String url = '$mainurl/ramadan_status';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenn',
        },
        body: {
          'status': status,
        },
      );
      //  print(response.body);
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
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenn',
        },
        body: {'activity_id': activityid, 'status': status},
      );
      //  print(response.body);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> quraantracker(String aya, String soura, String goz) async {
    String url = '$mainurl/quran_status';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenn',
        },
        body: {'countOfAya': aya, 'countOfSoura': soura, 'countOfGoza': goz},
      );
      counter = response.statusCode;
      //   print(response.body);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<Score> getscore() async {
    String url = '$mainurl/score';
    print(url);
    final String tokenn = Userprovider.sd;
    _dio.options.headers["Authorization"] = "Bearer $tokenn";
    try {
      Response response = await _dio.get(url);
      print(url);
      return Score.fromJson(response.data);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<Sour> getsour() async {
    String url = 'http://api.alquran.cloud/v1/surah';

    Response response = await _dio.get(url);
    print(response.data);
    return Sour.fromJson(response.data);
  }

  Future<Ayah> getayatbyid(int id) async {
    String url = 'https://api.quran.sutanlab.id/surah/$id';

    var response = await http.get(Uri.parse(url));
    print(response.body);
    return Ayah.fromJson(convert.jsonDecode(response.body));
  }

  Future<void> azkaraftersalah(String status, String id) async {
    String url = '$mainurl/azkar_salah_status';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenn',
        },
        body: {'status': status, 'salah_id': id},
      );
      //  print(response.body);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> Dialyhadithstatus(String status, String hadithid) async {
    String url = '$mainurl/dailyhadith_status';
    final String tokenn = Userprovider.sd;
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenn',
        },
        body: {
          'status': status,
          'dailyhadith_id': hadithid,
        },
      );
      dialyhadith = response.statusCode;
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> hadithrecord(String status, String hadithid, File file) async {
    String url = '$mainurl/dailyhadith_status';
    final String tokenn = Userprovider.sd;
    String fileName = file.path.split('/').last;
    FormData data = FormData.fromMap({
      "audio": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
      'status': status,
      'dailyhadith_id': hadithid,
    });
    _dio.options.headers["Authorization"] = "Bearer $tokenn";
    _dio.options.headers["Accept"] = "application/json";
    Response response = await _dio.post(
      url,
      data: data,
    );
  }

  Future<void> ayasave(String soraid, String ayaid, String surah, String juza,
      String status) async {
    String url = '$mainurl/quran_saves';
    final String tokenn = Userprovider.sd;

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenn',
        },
        body: {
          'quran_number': soraid,
          'numberOfVerse': ayaid,
          'surah': surah,
          'juza': juza,
          'status': status,
        },
      );
      print(response.body);
    } catch (eroor) {
      print(eroor);
    }
  }

  Future<void> ayarecord(
      String soraid, String ayaid, String surah, String juza, File file) async {
    String url = '$mainurl/quran_saves';
    final String tokenn = Userprovider.sd;
    String fileName = file.path.split('/').last;
    FormData data = FormData.fromMap({
      "audio": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
      'quran_number': soraid,
      'numberOfVerse': ayaid,
      'surah': surah,
      'juza': juza,
      'status': 'read',
    });
    _dio.options.headers["Authorization"] = "Bearer $tokenn";
    _dio.options.headers["Accept"] = "application/json";
    Response response = await _dio.post(
      url,
      data: data,
    );
  }

  Future<Ayasaves> getayasaves(int id) async {
    String url = '$mainurl/numberOfSaves/$id';
    final String tokenn = Userprovider.sd;
    _dio.options.headers["Authorization"] = "Bearer $tokenn";

    Response response = await _dio.get(url);
    print(response.data);

    return Ayasaves.fromJson(response.data);
  }
  Future<Ayasaves> getlevelsaves(int id) async {
    String url = '$mainurl/numberOfSavesThroughLevel/$id';
    final String tokenn = Userprovider.sd;
    _dio.options.headers["Authorization"] = "Bearer $tokenn";

    Response response = await _dio.get(url);
    print(response.data);

    return Ayasaves.fromJson(response.data);
  }
  Future<Ayacheak> getayacheak(int id) async {
    String url = '$mainurl/allOfVerseSave/$id';
    final String tokenn = Userprovider.sd;
    _dio.options.headers["Authorization"] = "Bearer $tokenn";

    Response response = await _dio.get(url);

    return Ayacheak.fromJson(response.data);
  }

  Future<Ayasaves> getallOfVerseSave(int id) async {
    String url = '$mainurl/allOfVerseSave/$id';
    final String tokenn = Userprovider.sd;
    _dio.options.headers["Authorization"] = "Bearer $tokenn";

    Response response = await _dio.get(url);

    return Ayasaves.fromJson(response.data);
  }

  Future<Juz2save> getguzsaved() async {
    String url = '$mainurl/numberOfAllJuzaSaves';
    final String tokenn = Userprovider.sd;
    _dio.options.headers["Authorization"] = "Bearer $tokenn";

    Response response = await _dio.get(url);

    return Juz2save.fromJson(response.data);
  }

  Future<Levles> getlevles() async {
    String url = '$mainurl/QuranLevels';

    Response response = await _dio.get(url);

    return Levles.fromJson(response.data);
  }

  Future<Dailyhadith> getdialyhadith() async {
    String url = '$mainurl/dailyhadith';
    Response response = await _dio.get(url);
    return Dailyhadith.fromJson(response.data);
  }

  Future<Hadithlevel> gethadithleevel() async {
    String url = '$mainurl/HadithLevels';
    Response response = await _dio.get(url);
    return Hadithlevel.fromJson(response.data);
  }
  Future<Homedata> gethomedata() async {
    String url = '$mainurl/homepage';
    final String tokenn = Userprovider.sd;
    _dio.options.headers["Authorization"] = "Bearer $tokenn";
    Response response = await _dio.get(url);
    return Homedata.fromJson(response.data);
  }
}
