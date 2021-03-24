import 'package:flutter/material.dart';
import 'package:kids/widgets/ramdanitem.dart';

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
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    //  mainAxisAlignment: MainAxisAlignment.sp,
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
                  Row(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor)),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'Read',
                              style: TextStyle(color: Colors.white),
                            ),
                            Image.asset('assets/images/ab.png'),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor)),
                        onPressed: () {},
                        child: Icon(
                          Icons.download_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
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
                  onPressed: () {},
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
