class Hadithlevel {
  List<Levels> levels;

  Hadithlevel({this.levels});

  Hadithlevel.fromJson(Map<String, dynamic> json) {
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
  List<Allhadiths> allhadiths;

  Levels({this.id, this.name, this.createdAt, this.updatedAt, this.allhadiths});

  Levels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['allhadiths'] != null) {
      allhadiths = new List<Allhadiths>();
      json['allhadiths'].forEach((v) {
        allhadiths.add(new Allhadiths.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.allhadiths != null) {
      data['allhadiths'] = this.allhadiths.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Allhadiths {
  int id;
  String title;
  String description;
  String audio;
  int levelId;
  String createdAt;
  String updatedAt;

  Allhadiths(
      {this.id,
      this.title,
      this.description,
      this.audio,
      this.levelId,
      this.createdAt,
      this.updatedAt});

  Allhadiths.fromJson(Map<String, dynamic> json) {
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