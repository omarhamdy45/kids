class Dailyhadith {
  List<Data> data;

  Dailyhadith({
    this.data,
  });

  Dailyhadith.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Data {
  String title;
  String description;
  String audio;
  String updatedAt;
  dynamic id;

  Data({this.title, this.description, this.audio,this.id,this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
     id = json['id'];
    description = json['description'];
    audio = json['audio'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
     data['id'] = this.id;
    data['description'] = this.description;
    data['audio'] = this.audio;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
