import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids/widgets/gift.dart';
import 'package:kids/widgets/ramdanitem.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class Quraan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Ramdanitem.b('Duaa of the Day', 'assets/images/duaa.png'),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.015),
              child: Text(
                'أذكار الاستيقاظ من النوم',
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.015),
              child: Text(
                'الحَمْـدُ الّذي أَحْـيانا بَعْـدَ ما أَماتَـنا وَإليه النُّـشور ',
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.015),
              child: Text(
                'When waking up',
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.015),
              child: Text(
                'Praise is to Allah Who gives us life after He has caused us to die and to Him is the return.',
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Container(
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
                  onPressed: () {
                    Dialogs.materialDialog(
                        customView: Container(
                          child: Gift(
                            'Amazing',
                            'assets/images/Group 804.png',
                            Color.fromRGBO(255, 72, 115, 1),
                            Color.fromRGBO(255, 72, 115, 1),
                            Color.fromRGBO(255, 72, 115, 1),
                            Color.fromRGBO(255, 72, 115, 1),
                            Color.fromRGBO(255, 72, 115, 1),
                          ),
                        ),
                        titleStyle: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 25),
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
                              onPressed: () {},
                              text: 'Lovely',
                              color: Color.fromRGBO(255, 72, 115, 1),
                              textStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ]);
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
