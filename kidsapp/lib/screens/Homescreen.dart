import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/lanprovider.dart';
import 'package:kidsapp/providers/userprovider.dart';
import 'package:kidsapp/widgets/salah_details.dart';
import 'package:kidsapp/widgets/topazkarcard.dart';
import 'package:kidsapp/widgets/topcard.dart';
import 'package:kidsapp/widgets/tophadithcard.dart';
import 'package:kidsapp/widgets/topslahacard.dart';
import 'package:provider/provider.dart';

import 'Home.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool firstrun;
  List<Color> colors = [
    Colors.blue,
    Colors.amber,
    Colors.amber[800],
    Colors.grey,
    Colors.black
  ];
  List<String> salahname = ['Fajr', 'Thuhr', 'Asr', 'Maghrib', 'Isha\''];
  List<String> arabicsalahname = [
    'الفجر',
    'الظهر',
    'العصر',
    'المغرب',
    'العشاء'
  ];
  @override
  void initState() {
    firstrun = true;
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await Provider.of<Userprovider>(context, listen: false).fetchhomedata();
    await Provider.of<Userprovider>(context, listen: false).fetchtopstudents();
    await Provider.of<Userprovider>(context, listen: false).getusername();
     await Provider.of<Userprovider>(context, listen: false).fetchscore();
    setState(() {
      firstrun = false;
    });
  }

  @override
  void dispose() {
    Provider.of<Userprovider>(context, listen: false).dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Provider.of<Lanprovider>(context, listen: false).isenglish
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: firstrun
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: [
                      Provider.of<Lanprovider>(context, listen: false).isenglish
                          ? Text(
                              'wlecome ' +
                                  Provider.of<Userprovider>(context,
                                          listen: false)
                                      .currentUser
                                      .name +
                                  ' !',
                              style: GoogleFonts.lato(fontSize: 20),
                            )
                          : Text(
                              ' مرحباً' +
                                  Provider.of<Userprovider>(context,
                                          listen: false)
                                      .currentUser
                                      .name +
                                  ' !',
                              style: GoogleFonts.lato(fontSize: 20),
                            ),
                      Text(
                          Provider.of<Lanprovider>(context, listen: false)
                                  .isenglish
                              ? 'May the blessings of Allah fill your day with peace, happiness and success. '
                              : 'نتمنى لك يومًا سعيدًا مليئًا بالخير والبركات',
                          style: GoogleFonts.lato(fontSize: 20)),
                          SizedBox(height: 10,),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Your score:',
                                  style: GoogleFonts.roboto(
                                    letterSpacing: 0.5,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber[900],
                                ),
                                Text(
                                  Provider.of<Userprovider>(context,
                                          listen: false)
                                      .score
                                      .totalScore
                                      .toString(),
                                  style: GoogleFonts.roboto(
                                    letterSpacing: 0.5,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      SizedBox(
                        height: 20,
                      ),

                      Salahdetials(),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            Provider.of<Lanprovider>(context, listen: false)
                                    .isenglish
                                ? 'Quran -Today\'s Memorization'
                                : ' القرآن - التقدم في الحفظ',
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Provider.of<Userprovider>(context,
                                      listen: false)
                                  .homedata
                                  .lastQuran
                                  .isEmpty
                              ? Center(
                                  child: Text(
                                    Provider.of<Lanprovider>(context,
                                                listen: false)
                                            .isenglish
                                        ? 'You didn\'t memorize  any Verses today yet '
                                        : 'لم يتم حفظ شيء من القرآن اليوم',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              : Container(
                                  height: 76 *
                                      Provider.of<Userprovider>(context,
                                              listen: false)
                                          .homedata
                                          .lastQuran
                                          .length
                                          .toDouble(),
                                  child: ListView.builder(
                                      itemCount: Provider.of<Userprovider>(
                                              context,
                                              listen: false)
                                          .homedata
                                          .lastQuran
                                          .length,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            height: 76,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  Provider.of<Userprovider>(
                                                          context,
                                                          listen: false)
                                                      .homedata
                                                      .lastQuran[index]
                                                      .surah,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 16),
                                                ),
                                                //   Provider.of<Lanprovider>(context,listen: false).isenglish?
                                                Text(
                                                  Provider.of<Lanprovider>(
                                                              context,
                                                              listen: false)
                                                          .isenglish
                                                      ? Provider.of<Userprovider>(
                                                                  context,
                                                                  listen: false)
                                                              .homedata
                                                              .lastQuran[index]
                                                              .count
                                                              .toString() +
                                                          ' Verses memorized today'
                                                      : 'عدد الآيات التي تم حفظها اليوم:' +
                                                          Provider.of<Userprovider>(
                                                                  context,
                                                                  listen: false)
                                                              .homedata
                                                              .lastQuran[index]
                                                              .count
                                                              .toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 16),
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
                            Provider.of<Lanprovider>(context, listen: false)
                                    .isenglish
                                ? 'Today\'s Practiced Thikr'
                                : 'الأذكار اليومية',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Provider.of<Userprovider>(context,
                                      listen: false)
                                  .homedata
                                  .lastAzkar
                                  .isEmpty
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      Provider.of<Lanprovider>(context,
                                                  listen: false)
                                              .isenglish
                                          ? 'You didn\'t practice any Athkar today yet '
                                          : 'لم يتم تلاوة أذكار اليوم',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 25,
                                        child: Provider.of<Lanprovider>(context,
                                                    listen: false)
                                                .isenglish
                                            ? Text(
                                                'You practiced ' +
                                                    Provider.of<Userprovider>(
                                                            context,
                                                            listen: false)
                                                        .homedata
                                                        .countAzkar
                                                        .toString() +
                                                    ' Thikr Today',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 16),
                                              )
                                            : Text(
                                                'عدد الأذكار التي تم تلاوتها اليوم: ' +
                                                    Provider.of<Userprovider>(
                                                            context,
                                                            listen: false)
                                                        .homedata
                                                        .countHadith
                                                        .toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 16),
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
                                            itemCount:
                                                Provider.of<Userprovider>(
                                                        context,
                                                        listen: false)
                                                    .homedata
                                                    .lastAzkar
                                                    .length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Container(
                                                  height: 37,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize: 16),
                                                      ),
                                                      Provider.of<Userprovider>(
                                                                      context,
                                                                      listen:
                                                                          false)
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
                            Provider.of<Lanprovider>(context, listen: false)
                                    .isenglish
                                ? 'Today\'s Practiced Hadith'
                                : ' الحديث - التقدم في الحفظ ',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Provider.of<Userprovider>(context,
                                      listen: false)
                                  .homedata
                                  .lastHadith
                                  .isEmpty
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      Provider.of<Lanprovider>(context,
                                                  listen: false)
                                              .isenglish
                                          ? 'You didn\'t practice any Hadith  today yet '
                                          : 'لم يتم حفظ أحاديث اليوم',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 25,
                                          child: Provider.of<Lanprovider>(
                                                      context,
                                                      listen: false)
                                                  .isenglish
                                              ? Text(
                                                  'You practiced  ' +
                                                      Provider.of<Userprovider>(
                                                              context,
                                                              listen: false)
                                                          .homedata
                                                          .countHadith
                                                          .toString() +
                                                      ' Hadith Today',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 16),
                                                )
                                              : Text(
                                                  'عدد الأحاديث التي تم حفظها اليوم: ' +
                                                      Provider.of<Userprovider>(
                                                              context,
                                                              listen: false)
                                                          .homedata
                                                          .countHadith
                                                          .toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 16),
                                                )),
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
                                            itemCount:
                                                Provider.of<Userprovider>(
                                                        context,
                                                        listen: false)
                                                    .homedata
                                                    .lastHadith
                                                    .length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Container(
                                                  height: 37,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        Provider.of<Userprovider>(
                                                                context,
                                                                listen: false)
                                                            .homedata
                                                            .lastHadith[index]
                                                            .hadith
                                                            .title,
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize: 16),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      Provider.of<Userprovider>(
                                                                      context,
                                                                      listen:
                                                                          false)
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
                      Provider.of<Userprovider>(context, listen: false)
                              .topstudents
                              .quran
                              .isNotEmpty
                          ? Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                Provider.of<Lanprovider>(context, listen: false)
                                        .isenglish
                                    ? 'Qur\'an Champions'
                                    : 'مسابقة القرأن',
                                style: GoogleFonts.roboto(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ))
                          : Container(),
                      Topquraancard(),
                      Provider.of<Userprovider>(context, listen: false)
                              .topstudents
                              .azkar
                              .isNotEmpty
                          ? Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                Provider.of<Lanprovider>(context, listen: false)
                                        .isenglish
                                    ? 'Thikr Champions'
                                    : 'مسابقة الذكر',
                                style: GoogleFonts.roboto(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ))
                          : Container(),
                      Topqazkarcard(),
                      Provider.of<Userprovider>(context, listen: false)
                              .topstudents
                              .hadith
                              .isNotEmpty
                          ? Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                Provider.of<Lanprovider>(context, listen: false)
                                        .isenglish
                                    ? 'Hadith Champions'
                                    : 'مسابقة الحديث',
                                style: GoogleFonts.roboto(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ))
                          : Container(),
                      Tophadithcard(),
                      Provider.of<Userprovider>(context, listen: false)
                              .topstudents
                              .salah
                              .isNotEmpty
                          ? Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                Provider.of<Lanprovider>(context, listen: false)
                                        .isenglish
                                    ? 'Salah Champions'
                                    : 'مسابقة الصلاة',
                                style: GoogleFonts.roboto(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ))
                          : Container(),
                      Topsalahcard()
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
