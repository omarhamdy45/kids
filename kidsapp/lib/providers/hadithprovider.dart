import 'package:flutter/material.dart';
import 'package:kidsapp/models/Hadith.dart';
import 'package:kidsapp/models/db.dart';


class Hadithprovider with ChangeNotifier {
 Hadith azkar;
 Future<void> fetchallhadith() async {
    try {
    azkar = await Dbhandler.instance.getallhadith();
    print(azkar.data[1].descriptionAr);
    } catch (error) {
      print('errorrrrrrrrrrrrrr');
    }
  }


}
