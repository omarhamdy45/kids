class Categories {
  List<Data> data;
  

  Categories({this.data});

  Categories.fromJson(Map<String, dynamic> json) {
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
  int id;
  String title;
  Null image;
  List<Azkars> azkars;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
      this.title,
      this.image,
      this.azkars,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    if (json['azkars'] != null) {
      azkars = new List<Azkars>();
      json['azkars'].forEach((v) {
        azkars.add(new Azkars.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    if (this.azkars != null) {
      data['azkars'] = this.azkars.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Azkars {
  int id;
  String desciption;
  String createdAt;
  String updatedAt;

  Azkars({this.id, this.desciption, this.createdAt, this.updatedAt});

  Azkars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    desciption = json['desciption'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['desciption'] = this.desciption;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}




