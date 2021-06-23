class Ayasaves {
  List<Result> result;

  Ayasaves({this.result});

  Ayasaves.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int quranNumber;
  String surah;
  int numberOfVerse;
  int numberOfVersrRead;

  Result(
      {this.quranNumber,
      this.surah,
      this.numberOfVerse,
      this.numberOfVersrRead});

  Result.fromJson(Map<String, dynamic> json) {
    quranNumber = json['quran_number'];
    surah = json['surah'];
    numberOfVerse = json['numberOfVerse'];
    numberOfVersrRead = json['numberOfVersrRead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quran_number'] = this.quranNumber;
    data['surah'] = this.surah;
    data['numberOfVerse'] = this.numberOfVerse;
    data['numberOfVersrRead'] = this.numberOfVersrRead;
    return data;
  }
}