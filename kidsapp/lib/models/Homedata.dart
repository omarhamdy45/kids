
class Homedata {
  LastHadith lastHadith;
  int countHadith;
  LastAzkar lastAzkar;
  int countAzkar;
  LastQuran lastQuran;
  int countQuran;

  Homedata(
      {this.lastHadith,
      this.countHadith,
      this.lastAzkar,
      this.countAzkar,
      this.lastQuran,
      this.countQuran});

  Homedata.fromJson(Map<String, dynamic> json) {
    lastHadith = json['LastHadith'] != null
        ? new LastHadith.fromJson(json['LastHadith'])
        : null;
    countHadith = json['CountHadith'];
    lastAzkar = json['LastAzkar'] != null
        ? new LastAzkar.fromJson(json['LastAzkar'])
        : null;
    countAzkar = json['CountAzkar'];
    lastQuran = json['LastQuran'] != null
        ? new LastQuran.fromJson(json['LastQuran'])
        : null;
    countQuran = json['CountQuran'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lastHadith != null) {
      data['LastHadith'] = this.lastHadith.toJson();
    }
    data['CountHadith'] = this.countHadith;
    if (this.lastAzkar != null) {
      data['LastAzkar'] = this.lastAzkar.toJson();
    }
    data['CountAzkar'] = this.countAzkar;
    if (this.lastQuran != null) {
      data['LastQuran'] = this.lastQuran.toJson();
    }
    data['CountQuran'] = this.countQuran;
    return data;
  }
}

class LastHadith {
  int id;
  int dailyhadithId;
  int userId;
  int gradeId;
  int grade;
  Null audio;
  String date;
  Null hijri;
  String createdAt;
  String updatedAt;
  Hadithh hadith;

  LastHadith(
      {this.id,
      this.dailyhadithId,
      this.userId,
      this.gradeId,
      this.grade,
      this.audio,
      this.date,
      this.hijri,
      this.createdAt,
      this.updatedAt,
      this.hadith});

  LastHadith.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dailyhadithId = json['dailyhadith_id'];
    userId = json['user_id'];
    gradeId = json['grade_id'];
    grade = json['grade'];
    audio = json['audio'];
    date = json['date'];
    hijri = json['hijri'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hadith =
        json['hadith'] != null ? new Hadithh.fromJson(json['hadith']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dailyhadith_id'] = this.dailyhadithId;
    data['user_id'] = this.userId;
    data['grade_id'] = this.gradeId;
    data['grade'] = this.grade;
    data['audio'] = this.audio;
    data['date'] = this.date;
    data['hijri'] = this.hijri;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.hadith != null) {
      data['hadith'] = this.hadith.toJson();
    }
    return data;
  }
}

class Hadithh {
  int id;
  String title;
  String description;
  String audio;
  int levelId;
  String createdAt;
  String updatedAt;

  Hadithh(
      {this.id,
      this.title,
      this.description,
      this.audio,
      this.levelId,
      this.createdAt,
      this.updatedAt});

  Hadithh.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    audio = json['audio'];
    levelId = json['level_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['audio'] = this.audio;
    data['level_id'] = this.levelId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class LastAzkar {
  int id;
  int categoryId;
  int userId;
  int gradeId;
  int grade;
  String date;
  String hijri;
  String createdAt;
  String updatedAt;
  Category category;

  LastAzkar(
      {this.id,
      this.categoryId,
      this.userId,
      this.gradeId,
      this.grade,
      this.date,
      this.hijri,
      this.createdAt,
      this.updatedAt,
      this.category});

  LastAzkar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    gradeId = json['grade_id'];
    grade = json['grade'];
    date = json['date'];
    hijri = json['hijri'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['user_id'] = this.userId;
    data['grade_id'] = this.gradeId;
    data['grade'] = this.grade;
    data['date'] = this.date;
    data['hijri'] = this.hijri;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    return data;
  }
}

class Category {
  int id;
  String title;
  String image;
  String createdAt;
  String updatedAt;

  Category({this.id, this.title, this.image, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class LastQuran {
  int id;
  int userId;
  int quranNumber;
  int juza;
  String surah;
  int numberOfVerse;
  Null audio;
  int gradeId;
  int grade;
  String date;
  String createdAt;
  String updatedAt;

  LastQuran(
      {this.id,
      this.userId,
      this.quranNumber,
      this.juza,
      this.surah,
      this.numberOfVerse,
      this.audio,
      this.gradeId,
      this.grade,
      this.date,
      this.createdAt,
      this.updatedAt});

  LastQuran.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    quranNumber = json['quran_number'];
    juza = json['juza'];
    surah = json['surah'];
    numberOfVerse = json['numberOfVerse'];
    audio = json['audio'];
    gradeId = json['grade_id'];
    grade = json['grade'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['quran_number'] = this.quranNumber;
    data['juza'] = this.juza;
    data['surah'] = this.surah;
    data['numberOfVerse'] = this.numberOfVerse;
    data['audio'] = this.audio;
    data['grade_id'] = this.gradeId;
    data['grade'] = this.grade;
    data['date'] = this.date;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}