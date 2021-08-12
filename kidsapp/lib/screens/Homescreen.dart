import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/providers/userprovider.dart';
import 'package:kidsapp/screens/salah.dart';
import 'package:kidsapp/widgets/topcard.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.blue,
      Colors.amber,
      Colors.amber[800],
      Colors.grey,
      Colors.black
    ];
    List<String> salahname = ['Fajr', 'Thuhr', 'Asr', 'Maghrib', 'Isha\''];
    List<String> prayerstimes = [
      Provider.of<Athanprovider>(context).time.data.timings.fajr,
      Provider.of<Athanprovider>(context).time.data.timings.dhuhr,
      Provider.of<Athanprovider>(context).time.data.timings.asr,
      Provider.of<Athanprovider>(context).time.data.timings.maghrib,
      Provider.of<Athanprovider>(context).time.data.timings.isha
    ];
    int index;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Text(
                'wlecome ' +
                    Provider.of<Userprovider>(context, listen: false)
                        .currentUser
                        .name +
                    ' !',
                style: GoogleFonts.lato(fontSize: 20),
              ),
              Text(
                  'May the blessings of Allah fill your day with peace, happiness and success. ',
                  style: GoogleFonts.lato(fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: 200,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        height: 35,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.timeline),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Prayer Tracker for the last 7 day',
                              style: GoogleFonts.lato(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 165,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (
                            context,
                            index,
                          ) {
                            return GestureDetector(
                              onTap: () async {
                                await Provider.of<Userprovider>(context,
                                        listen: false)
                                    .fetchsalahsummary(index + 1);
                                Dialogs.materialDialog(
                                    customView: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(salahname[index], style: GoogleFonts.lato(
                                                  fontSize: 16),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,),
                                              Divider(),
                                            Text(
                                              'Alone: ' +
                                                  Provider.of<Userprovider>(
                                                          context,
                                                          listen: false)
                                                      .salah
                                                      .alone
                                                      .toString(),
                                              style: GoogleFonts.lato(
                                                  fontSize: 16),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'jamah: ' +
                                                  Provider.of<Userprovider>(
                                                          context,
                                                          listen: false)
                                                      .salah
                                                      .jamah
                                                      .toString(),
                                              style: GoogleFonts.lato(
                                                  fontSize: 16),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Ontime: ' +
                                                  Provider.of<Userprovider>(
                                                          context,
                                                          listen: false)
                                                      .salah
                                                      .onTime
                                                      .toString(),
                                              style: GoogleFonts.lato(
                                                  fontSize: 16),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Late: ' +
                                                  Provider.of<Userprovider>(
                                                          context,
                                                          listen: false)
                                                      .salah
                                                      .late
                                                      .toString(),
                                              style: GoogleFonts.lato(
                                                  fontSize: 16),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'did\'nt  pray: ' +
                                                  Provider.of<Userprovider>(
                                                          context,
                                                          listen: false)
                                                      .salah
                                                      .didntpray
                                                      .toString(),
                                              style: GoogleFonts.lato(
                                                  fontSize: 16),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'azkar after salah: ' +
                                                  Provider.of<Userprovider>(
                                                          context,
                                                          listen: false)
                                                      .salah
                                                      .azkaraftersalah
                                                      .toString(),
                                              style: GoogleFonts.lato(
                                                  fontSize: 16),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
                                            ),
                                          ],
                                        ),
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
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1),
                                        child: IconsButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          text: 'Done',
                                          color:
                                              Color.fromRGBO(34, 196, 228, 1),
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ]);
                              },
                              child: (Container(
                                color: colors[index],
                                width:
                                    (MediaQuery.of(context).size.width - 20) /
                                        5,
                                height: 165,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        salahname[index],
                                        style: GoogleFonts.lato(
                                            color: Colors.white),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        Provider.of<Userprovider>(context,
                                                listen: false)
                                            .homedata
                                            .lastSalah[index]
                                            .result,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.lato(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Quran -Todays Memorization',
                    style: GoogleFonts.roboto(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Provider.of<Userprovider>(context, listen: false)
                          .homedata
                          .lastQuran
                          .isEmpty
                      ? Center(
                          child: Text(
                            'You didn\'t memorize  any Verses today yet ',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : Container(
                          height: 67 *
                              Provider.of<Userprovider>(context, listen: false)
                                  .homedata
                                  .lastQuran
                                  .length
                                  .toDouble(),
                          child: ListView.builder(
                              itemCount: Provider.of<Userprovider>(context,
                                      listen: false)
                                  .homedata
                                  .lastQuran
                                  .length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                    height: 67,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Provider.of<Userprovider>(context,
                                                  listen: false)
                                              .homedata
                                              .lastQuran[index]
                                              .surah,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              GoogleFonts.roboto(fontSize: 16),
                                        ),
                                        Text(
                                          Provider.of<Userprovider>(context,
                                                      listen: false)
                                                  .homedata
                                                  .lastQuran[index]
                                                  .count
                                                  .toString() +
                                              ' verces memorized today',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              GoogleFonts.roboto(fontSize: 16),
                                        ),
                                        Divider()
                                      ],
                                    ));
                              }),
                        ),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Todays Practiced Thikr',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Provider.of<Userprovider>(context, listen: false)
                          .homedata
                          .lastAzkar
                          .isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'You didn\'t practice any Athkar today yet ',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 25,
                                child: Text(
                                  'You practiced ' +
                                      Provider.of<Userprovider>(context,
                                              listen: false)
                                          .homedata
                                          .countAzkar
                                          .toString() +
                                      ' Azkar Today',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.roboto(fontSize: 16),
                                ),
                              ),
                              Divider(),
                              Container(
                                height: 37 *
                                    Provider.of<Userprovider>(context,
                                            listen: false)
                                        .homedata
                                        .lastAzkar
                                        .length
                                        .toDouble(),
                                child: ListView.builder(
                                    itemCount: Provider.of<Userprovider>(
                                            context,
                                            listen: false)
                                        .homedata
                                        .lastAzkar
                                        .length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Container(
                                          height: 37,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Provider.of<Userprovider>(
                                                        context,
                                                        listen: false)
                                                    .homedata
                                                    .lastAzkar[index]
                                                    .category
                                                    .title,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 16),
                                              ),
                                              Provider.of<Userprovider>(context,
                                                              listen: false)
                                                          .homedata
                                                          .lastAzkar
                                                          .length ==
                                                      1
                                                  ? Container()
                                                  : Divider()
                                            ],
                                          ));
                                    }),
                              ),
                            ],
                          ),
                        )),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Todays Practiced Hadith',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Provider.of<Userprovider>(context, listen: false)
                          .homedata
                          .lastHadith
                          .isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'You didn\'t practice any Hadith  today yet ',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 25,
                                child: Text(
                                  'You practiced  ' +
                                      Provider.of<Userprovider>(context,
                                              listen: false)
                                          .homedata
                                          .countHadith
                                          .toString() +
                                      ' Hadith Today',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.roboto(fontSize: 16),
                                ),
                              ),
                              Divider(),
                              Container(
                                height: 37 *
                                    Provider.of<Userprovider>(context,
                                            listen: false)
                                        .homedata
                                        .lastHadith
                                        .length
                                        .toDouble(),
                                child: ListView.builder(
                                    itemCount: Provider.of<Userprovider>(
                                            context,
                                            listen: false)
                                        .homedata
                                        .lastHadith
                                        .length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Container(
                                          height: 37,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Provider.of<Userprovider>(
                                                        context,
                                                        listen: false)
                                                    .homedata
                                                    .lastHadith[index]
                                                    .hadith
                                                    .title,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 16),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Provider.of<Userprovider>(context,
                                                              listen: false)
                                                          .homedata
                                                          .lastHadith
                                                          .length ==
                                                      1
                                                  ? Container()
                                                  : Divider()
                                            ],
                                          ));
                                    }),
                              ),
                            ],
                          ),
                        )),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Champions of Quran',
                    style: GoogleFonts.roboto(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                  height: 60 *
                      Provider.of<Userprovider>(context, listen: false)
                          .topstudents
                          .azkar
                          .length
                          .toDouble(),
                  child: ListView.builder(
                      itemCount:
                          Provider.of<Userprovider>(context, listen: false)
                              .topstudents
                              .quran
                              .length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Row(
                                children: [
                                  if (index == 0 )
                                    Container(
                                     height: 40,
                                   //  width: 35,
                                        child: Image.asset(
                                            'assets/images/gold1.png')),
                                  if (index == 1)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/gold2.png')),
                                  if (index == 2)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/silver3.png')),
                                         if (index == 3)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/silver4.png')),
                                             if (index == 4)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/bronze5.png')),
                                          
                                  Text(
                                    Provider.of<Userprovider>(context,
                                            listen: false)
                                        .topstudents
                                        .quran[index]
                                        .name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),

                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      Provider.of<Userprovider>(context,
                                              listen: false)
                                          .topstudents
                                          .quran[index]
                                          .quran,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Champions of Thikr',
                    style: GoogleFonts.roboto(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                  height: 60 *
                      Provider.of<Userprovider>(context, listen: false)
                          .topstudents
                          .azkar
                          .length
                          .toDouble(),
                  child: ListView.builder(
                      itemCount:
                          Provider.of<Userprovider>(context, listen: false)
                              .topstudents
                              .azkar
                              .length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Row(
                                children: [
                                    if (index == 0 )
                                    Container(
                                     height: 40,
                                   //  width: 35,
                                        child: Image.asset(
                                            'assets/images/gold1.png')),
                                  if (index == 1)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/gold2.png')),
                                  if (index == 2)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/silver3.png')),
                                         if (index == 3)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/silver4.png')),
                                             if (index == 4)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/bronze5.png')),
                                            
                                  Text(
                                    Provider.of<Userprovider>(context,
                                            listen: false)
                                        .topstudents
                                        .azkar[index]
                                        .name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      Provider.of<Userprovider>(context,
                                              listen: false)
                                          .topstudents
                                          .azkar[index]
                                          .azkar,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Champions of Hadith',
                    style: GoogleFonts.roboto(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                  height: 60 *
                      Provider.of<Userprovider>(context, listen: false)
                          .topstudents
                          .azkar
                          .length
                          .toDouble(),
                  child: ListView.builder(
                      itemCount:
                          Provider.of<Userprovider>(context, listen: false)
                              .topstudents
                              .hadith
                              .length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Row(
                                children: [
                                    if (index == 0 )
                                    Container(
                                     height: 40,
                                   //  width: 35,
                                        child: Image.asset(
                                            'assets/images/gold1.png')),
                                  if (index == 1)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/gold2.png')),
                                  if (index == 2)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/silver3.png')),
                                         if (index == 3)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/silver4.png')),
                                             if (index == 4)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/bronze5.png')),
                                  SizedBox(
                                    width: 5,
                                  ),
                                 
                                  Text(
                                    Provider.of<Userprovider>(context,
                                            listen: false)
                                        .topstudents
                                        .hadith[index]
                                        .name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      Provider.of<Userprovider>(context,
                                              listen: false)
                                          .topstudents
                                          .hadith[index]
                                          .hadith,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Champions of Salah',
                    style: GoogleFonts.roboto(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                  height: 60 *
                      Provider.of<Userprovider>(context, listen: false)
                          .topstudents
                          .salah
                          .length
                          .toDouble(),
                  child: ListView.builder(
                      itemCount:
                          Provider.of<Userprovider>(context, listen: false)
                              .topstudents
                              .salah
                              .length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Row(
                                children: [
                                   if (index == 0 )
                                    Container(
                                     height: 40,
                                   //  width: 35,
                                        child: Image.asset(
                                            'assets/images/gold1.png')),
                                  if (index == 1)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/gold2.png')),
                                  if (index == 2)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/silver3.png')),
                                         if (index == 3)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/silver4.png')),
                                             if (index == 4)
                                     Container(
                                     height: 40,
                                        child: Image.asset(
                                            'assets/images/bronze5.png')),
                                          
                                  Text(
                                    Provider.of<Userprovider>(context,
                                            listen: false)
                                        .topstudents
                                        .salah[index]
                                        .name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      Provider.of<Userprovider>(context,
                                              listen: false)
                                          .topstudents
                                          .salah[index]
                                          .salah,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
