import 'package:shared_preferences/shared_preferences.dart';

class User {
  int id;
  String name;
  String email;
  String token;
  User.fromjson(dynamic json)
      : this.token = json['success']['token'],
        this.name = json['user']['name'],
        this.id = json['user']['id'],
        this.email = json['user']['email'];
  User.fromPrefs(SharedPreferences prefs)
      : this.token = prefs.get('token'),
        this.name = prefs.get('name'),
        this.email = prefs.get('email');
      //  this.id =int.parse(prefs.get('id'),);
}
