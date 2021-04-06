import 'package:flutter/material.dart';
import 'package:kidsapp/models/Athan.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/providers/hadithprovider.dart';
import 'package:kidsapp/screens/ramdanscreen.dart';
import 'package:kidsapp/widgets/ramdanitem.dart';
import 'package:provider/provider.dart';

class Hadeth extends StatelessWidget {
  bool done = true;
  @override
  Widget build(BuildContext context) {
    int date = DateTime.now().day;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Ramdanitem.b('Hadith of day', 'assets/images/Group400.png'),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                Provider.of<Hadithprovider>(context, listen: false)
                    .azkar
                    .data[date % 13]
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
                Provider.of<Hadithprovider>(context, listen: false)
                    .azkar
                    .data[date % 12]
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
                Provider.of<Hadithprovider>(context, listen: false)
                    .azkar
                    .data[date % 13]
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
                Provider.of<Hadithprovider>(context, listen: false)
                    .azkar
                    .data[date % 13]
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
                    await Dbhandler.instance.hadithread((date%13).toString(), 'read');
                    Navigator.pushReplacementNamed(context, Ramdan.route,
                        arguments: done);
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
