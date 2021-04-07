import 'package:flutter/material.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/providers/duaaprovider.dart';
import 'package:kidsapp/screens/ramdanscreen.dart';
import 'package:kidsapp/widgets/gift.dart';
import 'package:kidsapp/widgets/ramdanitem.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';

class Dua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int date = DateTime.now().day;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Ramdanitem.b('Duaa of the Day', 'assets/images/duaa.png'),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                Provider.of<Duaaprovider>(context, listen: false)
                    .duaa
                    .data[Ramdan.day - 1]
                    .title,
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                Provider.of<Duaaprovider>(context, listen: false)
                    .duaa
                    .data[Ramdan.day - 1]
                    .descriptionAr,
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                Provider.of<Duaaprovider>(context, listen: false)
                    .duaa
                    .data[Ramdan.day - 1]
                    .descriptionEn,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 16),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                Provider.of<Duaaprovider>(context, listen: false)
                    .duaa
                    .data[Ramdan.day - 1]
                    .descriptionFr,
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: 30,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(
                          Icons.play_arrow_sharp,
                          color: Colors.white,
                          size: 45,
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                        radius: 30,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(
                          Icons.pause_outlined,
                          color: Colors.white,
                          size: 45,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.3)
                  .add(EdgeInsets.symmetric(vertical: 10)),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).accentColor)),
                  onPressed: () async {
                    await Dbhandler.instance
                        .duaaread((Ramdan.day - 1).toString(), 'read');
                    if (Dbhandler.instance.duaareadd == 200) {
                      Dialogs.materialDialog(
                          customView: Container(
                            child: Gift(
                              'assets/images/Group 795.png',
                              ' May Allah Bless You',
                                  '  بارك الله فيك',
                              Color.fromRGBO(255, 72, 115, 1),
                              Color.fromRGBO(255, 72, 115, 1),
                              Color.fromRGBO(255, 72, 115, 1),
                              Color.fromRGBO(255, 72, 115, 1),
                              Color.fromRGBO(255, 72, 115, 1),
                              Color.fromRGBO(255, 72, 115, 1),
                            ),
                          ),
                          titleStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 25),
                          color: Colors.white,
                          //    animation: 'assets/cong_example.json',
                          context: context,
                          actions: [
                            Container(
                              height: 40,
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.1),
                              child: IconsButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                text: 'Done',
                                color: Color.fromRGBO(255, 72, 115, 1),
                                textStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ]);
                    }
                  },
                  child: Text(
                    'Finsh',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
