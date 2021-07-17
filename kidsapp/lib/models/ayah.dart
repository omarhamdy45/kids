class Ayah {
  int code;
  String status;
  String message;
  Dataa data;

  Ayah({this.code, this.status, this.message, this.data});

  Ayah.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Dataa.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Dataa {
  int number;
  int sequence;
  int numberOfVerses;
  Name name;
  Revelation revelation;
  Tafsir tafsir;
  PreBismillah preBismillah;
  List<Verses> verses;

  Dataa(
      {this.number,
      this.sequence,
      this.numberOfVerses,
      this.name,
      this.revelation,
      this.tafsir,
      this.preBismillah,
      this.verses});

  Dataa.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    sequence = json['sequence'];
    numberOfVerses = json['numberOfVerses'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    
    if (json['verses'] != null) {
      verses = new List<Verses>();
      json['verses'].forEach((v) {
        verses.add(new Verses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['sequence'] = this.sequence;
    data['numberOfVerses'] = this.numberOfVerses;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.revelation != null) {
      data['revelation'] = this.revelation.toJson();
    }
    if (this.tafsir != null) {
      data['tafsir'] = this.tafsir.toJson();
    }
    if (this.preBismillah != null) {
      data['preBismillah'] = this.preBismillah.toJson();
    }
    if (this.verses != null) {
      data['verses'] = this.verses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Name {
  String short;
  String long;
  Transliteration transliteration;
  Transliteration translation;

  Name({this.short, this.long, this.transliteration, this.translation});

  Name.fromJson(Map<String, dynamic> json) {
    short = json['short'];
    long = json['long'];
    transliteration = json['transliteration'] != null
        ? new Transliteration.fromJson(json['transliteration'])
        : null;
    translation = json['translation'] != null
        ? new Transliteration.fromJson(json['translation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['short'] = this.short;
    data['long'] = this.long;
    if (this.transliteration != null) {
      data['transliteration'] = this.transliteration.toJson();
    }
    if (this.translation != null) {
      data['translation'] = this.translation.toJson();
    }
    return data;
  }
}

class Transliteration {
  String en;
  String id;

  Transliteration({this.en, this.id});

  Transliteration.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['id'] = this.id;
    return data;
  }
}

class Revelation {
  String arab;
  String en;
  String id;

  Revelation({this.arab, this.en, this.id});

  Revelation.fromJson(Map<String, dynamic> json) {
    arab = json['arab'];
    en = json['en'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['arab'] = this.arab;
    data['en'] = this.en;
    data['id'] = this.id;
    return data;
  }
}

class Tafsir {
  String id;

  Tafsir({this.id});

  Tafsir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class PreBismillah {
  Textt text;
  Transliteration translation;
  Audioo audio;

  PreBismillah({this.text, this.translation, this.audio});

  PreBismillah.fromJson(Map<String, dynamic> json) {
    text = json['text'] != null ? new Textt.fromJson(json['text']) : null;
    translation = json['translation'] != null
        ? new Transliteration.fromJson(json['translation'])
        : null;
    audio = json['audio'] != null ? new Audioo.fromJson(json['audio']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.text != null) {
      data['text'] = this.text.toJson();
    }
    if (this.translation != null) {
      data['translation'] = this.translation.toJson();
    }
    if (this.audio != null) {
      data['audio'] = this.audio.toJson();
    }
    return data;
  }
}

class Textt {
  String arab;
  Transliteration transliteration;

  Textt({this.arab, this.transliteration});

  Textt.fromJson(Map<String, dynamic> json) {
    arab = json['arab'];
    transliteration = json['transliteration'] != null
        ? new Transliteration.fromJson(json['transliteration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['arab'] = this.arab;
    if (this.transliteration != null) {
      data['transliteration'] = this.transliteration.toJson();
    }
    return data;
  }
}

class Audioo {
  String primary;
  
  Audioo({this.primary,});

  Audioo.fromJson(Map<String, dynamic> json) {
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
  Transliteration translation;
  Audioo audio;
  
  Verses({this.text, this.translation, this.audio,});

  Verses.fromJson(Map<String, dynamic> json) {
    text = json['text'] != null ? new Textt.fromJson(json['text']) : null;
    translation = json['translation'] != null
        ? new Transliteration.fromJson(json['translation'])
        : null;
    audio = json['audio'] != null ? new Audioo.fromJson(json['audio']) : null;
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.text != null) {
      data['text'] = this.text.toJson();
    }
    if (this.translation != null) {
      data['translation'] = this.translation.toJson();
    }
    if (this.audio != null) {
      data['audio'] = this.audio.toJson();
    }
    
    return data;
  }
}
