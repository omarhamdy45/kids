import 'package:flutter/material.dart';
import 'package:kidsapp/models/Hadith.dart';
import 'package:kidsapp/models/db.dart';


class Duaaprovider with ChangeNotifier {
 Hadith duaa;
 Future<void> fetchallduaas() async {
    try {
    duaa = await Dbhandler.instance.getallduuas();
   print(duaa.data[0].descriptionFr);
    } catch (error) {
      print('errorrrrrrrrrrrrrrr');
    }
  }


}
