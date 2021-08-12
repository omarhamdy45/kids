class Topstudents {
  List<Hadithtop> hadith;
  List<Azkar> azkar;
  List<Salah> salah;
  List<Quran> quran;

  Topstudents({this.hadith, this.azkar, this.salah, this.quran});

  Topstudents.fromJson(Map<String, dynamic> json) {
    if (json['hadith'] != null) {
      hadith = new List<Hadithtop>();
      json['hadith'].forEach((v) {
        hadith.add(new Hadithtop.fromJson(v));
      });
    }
    if (json['azkar'] != null) {
      azkar = new List<Azkar>();
      json['azkar'].forEach((v) {
        azkar.add(new Azkar.fromJson(v));
      });
    }
    if (json['salah'] != null) {
      salah = new List<Salah>();
      json['salah'].forEach((v) {
        salah.add(new Salah.fromJson(v));
      });
    }
    if (json['quran'] != null) {
      quran = new List<Quran>();
      json['quran'].forEach((v) {
        quran.add(new Quran.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hadith != null) {
      data['hadith'] = this.hadith.map((v) => v.toJson()).toList();
    }
    if (this.azkar != null) {
      data['azkar'] = this.azkar.map((v) => v.toJson()).toList();
    }
    if (this.salah != null) {
      data['salah'] = this.salah.map((v) => v.toJson()).toList();
    }
    if (this.quran != null) {
      data['quran'] = this.quran.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hadithtop {
  String name;
  int userId;
  String hadith;

  Hadithtop({this.name, this.userId, this.hadith});

  Hadithtop.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['user_id'];
    hadith = json['hadith'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['hadith'] = this.hadith;
    return data;
  }
}

class Azkar {
  String name;
  int userId;
  String azkar;

  Azkar({this.name, this.userId, this.azkar});

  Azkar.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['user_id'];
    azkar = json['azkar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['azkar'] = this.azkar;
    return data;
  }
}

class Salah {
  String name;
  int userId;
  String salah;

  Salah({this.name, this.userId, this.salah});

  Salah.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['user_id'];
    salah = json['salah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['salah'] = this.salah;
    return data;
  }
}

class Quran {
  String name;
  int userId;
  String quran;

  Quran({this.name, this.userId, this.quran});

  Quran.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['user_id'];
    quran = json['quran'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['quran'] = this.quran;
    return data;
  }
}