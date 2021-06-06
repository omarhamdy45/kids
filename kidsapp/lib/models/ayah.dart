class Ayah {
  Dataa data;

  Ayah({this.data});

  Ayah.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Dataa.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Dataa {
  List<Verses> verses;

  Dataa({this.verses});

  Dataa.fromJson(Map<String, dynamic> json) {
    if (json['verses'] != null) {
      verses = new List<Verses>();
      json['verses'].forEach((v) {
        verses.add(new Verses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.verses != null) {
      data['verses'] = this.verses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Textt {
  dynamic arab;

  Textt({
    this.arab,
  });

  Textt.fromJson(Map<String, dynamic> json) {
    arab = json['arab'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['arab'] = this.arab;

    return data;
  }
}

class Audio {
  dynamic primary;

  Audio({
    this.primary,
  });

  Audio.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary'] = this.primary;

    return data;
  }
}

class Verses {
  Textt text;

  Audio audio;

  Verses({
    this.text,
    this.audio,
  });

  Verses.fromJson(Map<String, dynamic> json) {
    text = json['text'] != null ? new Textt.fromJson(json['text']) : null;
    audio = json['audio'] != null ? new Audio.fromJson(json['audio']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.text != null) {
      data['text'] = this.text.toJson();
    }

    if (this.audio != null) {
      data['audio'] = this.audio.toJson();
    }

    return data;
  }
}
