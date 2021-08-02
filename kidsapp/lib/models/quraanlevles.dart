class Levles {
  List<Levels> levels;

  Levles({this.levels});

  Levles.fromJson(Map<String, dynamic> json) {
    if (json['levels'] != null) {
      levels = new List<Levels>();
      json['levels'].forEach((v) {
        levels.add(new Levels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.levels != null) {
      data['levels'] = this.levels.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Levels {
  int id;
  String name;
  Null createdAt;
  Null updatedAt;
  List<Qurans> qurans;

  Levels({this.id, this.name, this.createdAt, this.updatedAt, this.qurans});

  Levels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['qurans'] != null) {
      qurans = new List<Qurans>();
      json['qurans'].forEach((v) {
        qurans.add(new Qurans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.qurans != null) {
      data['qurans'] = this.qurans.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Qurans {
  int id;
  int number;
  int juza;
  int levelId;
  String surah;
  int numberOfVerse;
  String createdAt;
  String updatedAt;

  Qurans(
      {this.id,
      this.number,
      this.juza,
      this.levelId,
      this.surah,
      this.numberOfVerse,
      this.createdAt,
      this.updatedAt});

  Qurans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    juza = json['juza'];
    levelId = json['level_id'];
    surah = json['surah'];
    numberOfVerse = json['numberOfVerse'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['juza'] = this.juza;
    data['level_id'] = this.levelId;
    data['surah'] = this.surah;
    data['numberOfVerse'] = this.numberOfVerse;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}