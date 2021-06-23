import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/providers/deedprovider.dart';
import 'package:kidsapp/providers/duaaprovider.dart';
import 'package:kidsapp/providers/hadithprovider.dart';
import 'package:kidsapp/providers/lanprovider.dart';

import 'package:kidsapp/screens/dua.dart';
import 'package:kidsapp/screens/hadethramdan.dart';
import 'package:kidsapp/screens/sera.dart';
import 'package:kidsapp/screens/types.dart';
import 'package:kidsapp/widgets/gift.dart';
import 'package:kidsapp/widgets/ramdanitem.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';

class Ramdan extends StatefulWidget {
  static const String route = '/ramdan';
  static var day = new HijriCalendar.now().hDay;
  @override
  _RamdanState createState() => _RamdanState();
}

class _RamdanState extends State<Ramdan> {
  int surracounter = 0;
  int vercecounter = 0;
  int goz2counter = 0;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;
  bool value8 = false;
  bool select1 = false;
  bool select2 = false;
  bool select3 = false;
  bool select4 = false;
  bool firstrun;
  int hour;
  int minute;
  int hour1;
  int min;
  int hours;
  bool loading;
  int year;
  int mon;
  int day;
  int ramdany;

  Color color = Color.fromRGBO(62, 194, 236, 1);
  DateTime datetime = DateTime.now();
  @override
  void initState() {
    super.initState();
    firstrun = true;
    loading = false;
    Provider.of<Lanprovider>(context, listen: false).getLan();
    Provider.of<Lanprovider>(context, listen: false).getLan2();
    Provider.of<Lanprovider>(context, listen: false).getLan3();
    Provider.of<Lanprovider>(context, listen: false).getLan4();
    Provider.of<Lanprovider>(context, listen: false).getLan5();
    Provider.of<Lanprovider>(context, listen: false).getLan6();
    Provider.of<Lanprovider>(context, listen: false).getLan7();
    Provider.of<Lanprovider>(context, listen: false).getLan8();
    Provider.of<Lanprovider>(context, listen: false).getcounter1();
    Provider.of<Lanprovider>(context, listen: false).getcounter2();
    Provider.of<Lanprovider>(context, listen: false).getcounter3();
    hour = int.parse(Provider.of<Athanprovider>(context, listen: false)
        .time
        .data
        .timings
        .maghrib
        .split(':')
        .first);
    minute = int.parse(Provider.of<Athanprovider>(context, listen: false)
        .time
        .data
        .timings
        .maghrib
        .split(':')
        .last);
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await Provider.of<Hadithprovider>(context, listen: false).fetchallhadith();
    await Provider.of<Duaaprovider>(context, listen: false).fetchallduaas();
    await Provider.of<Deedprovider>(context, listen: false).fetchalldeed();
    var format = DateFormat("HH:mm");
    var one = format.parse("$hour:$minute");
    var two = format.parse("${datetime.hour}:${datetime.minute}");
    if (two.isBefore(one)) {
      var five = one.difference(two);
      print(five.toString().length);
      min = (five.toString().length == 14)
          ? int.parse(five.toString().substring(2, 4))
          : int.parse(five.toString().substring(3, 5));
      hours = int.parse(five.toString().split(':').first);
    } else {
      var four = two.difference(one);
      min = 60 - int.parse(four.toString().substring(2, 4));
      hours = 23 - int.parse(four.toString().split(':').first);
    }
    if (!mounted) return;
    setState(() {
      firstrun = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mounth = new HijriCalendar.now().getLongMonthName().toString();

    mon = HijriCalendar.now().hMonth;
    day = HijriCalendar.now().hDay;
    year = HijriCalendar.now().hYear;
    if (HijriCalendar.now().isBefore(year + 1, 09, 01)) {
      if (HijriCalendar.now().hMonth < 09) {
        ramdany = year;
      } else {
        ramdany = year + 1;
      }
    }
    var a = DateTime.utc(year, mon, day);
    var b = DateTime.utc(ramdany, 09, 01);
    var c = b.difference(a).inDays;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: mounth != 'Ramadan'
            ? Center(
                child: Container(
                  child: Text('$c days left to Ramadan'),
                ),
              )
            : firstrun
                ? Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.02,
                              top: 7,
                              right: MediaQuery.of(context).size.width * 0.01,
                              bottom: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    Ramdan.day.toString() + ' ' + mounth,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(167, 85, 163, 1),
                                          letterSpacing: .5,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  // Image.asset('assets/images/Group 240.png')
                                ],
                              ),
                              Card(
                                color: Color.fromRGBO(62, 194, 236, 1),
                                child: Container(
                                  height: 50,
                                  //  width: ,
                                  child: Center(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        'Remaining time to breakfast',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: .5,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.09),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              hours.toString() +
                                  'hour' +
                                  ':' +
                                  min.toString() +
                                  'minute',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Color.fromRGBO(167, 85, 163, 1),
                                    letterSpacing: .5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Ramdanitem('Hadith Of The Day',
                          'assets/images/Group400.png', Hadeth()),
                      Ramdanitem('Story Of The Day', 'assets/images/quran.png',
                          Sera()),
                      Ramdanitem(
                          'Dua’ Of The Day', 'assets/images/duaa.png', Dua()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.015),
                            child: Text(
                              ' How much you have fasted today',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Color.fromRGBO(167, 85, 163, 1),
                                    letterSpacing: .5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Image.asset('assets/images/bal.png'),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              select1
                                                  ? Theme.of(context)
                                                      .accentColor
                                                  : color)),
                                  onPressed: () {
                                    setState(() {
                                      select1 = true;
                                      select2 = false;
                                      select3 = false;
                                      select4 = false;
                                    });
                                    Dbhandler.instance.ramdanstatus('no');
                                  },
                                  child: Text(
                                    'Didn’t fast',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              select2
                                                  ? Theme.of(context)
                                                      .accentColor
                                                  : color)),
                                  onPressed: () {
                                    setState(() {
                                      select1 = false;
                                      select2 = true;
                                      select3 = false;
                                      select4 = false;
                                    });
                                    Dbhandler.instance.ramdanstatus('thuhr');
                                  },
                                  child: Text(
                                    'Until Thuhr',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              select3
                                                  ? Theme.of(context)
                                                      .accentColor
                                                  : color)),
                                  onPressed: () {
                                    setState(() {
                                      select1 = false;
                                      select2 = false;
                                      select3 = true;
                                      select4 = false;
                                    });
                                    Dbhandler.instance.ramdanstatus('asr');
                                  },
                                  child: Text(
                                    'Until Asr',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              select4
                                                  ? Theme.of(context)
                                                      .accentColor
                                                  : color)),
                                  onPressed: () async {
                                    setState(() {
                                      select1 = false;
                                      select2 = false;
                                      select3 = false;
                                      select4 = true;
                                    });
                                    await Dbhandler.instance
                                        .ramdanstatus('maghrib');
                                  },
                                  child: Text(
                                    'Until Maghrib',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.015),
                            child: Text(
                              'Qur`an Tracker',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Color.fromRGBO(167, 85, 163, 1),
                                    letterSpacing: .5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Image.asset('assets/images/moshaf.png'),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(62, 194, 236, 1),
                                      )),
                                  onPressed: () {},
                                  child: Text(
                                    'Ayat',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(62, 194, 236, 1),
                                      )),
                                  onPressed: () {},
                                  child: Text(
                                    'Suwar',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(62, 194, 236, 1),
                                      )),
                                  onPressed: () {},
                                  child: Text(
                                    'Ajza’`',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Theme.of(context).accentColor,
                                        child: GestureDetector(
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                if (vercecounter > 0)
                                                  vercecounter--;
                                              });
                                              Provider.of<Lanprovider>(context,
                                                      listen: false)
                                                  .changecounter1(vercecounter);
                                            }),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: CircleAvatar(
                                            backgroundColor:
                                                Color.fromRGBO(62, 194, 236, 1),
                                            child: Text(
                                              Provider.of<Lanprovider>(context,
                                                      listen: true)
                                                  .counter1
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: CircleAvatar(
                                        //   minRadius: MediaQuery.of(context).size.width*0.05,
                                        backgroundColor:
                                            Theme.of(context).accentColor,
                                        child: InkWell(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              vercecounter++;
                                            });
                                            Provider.of<Lanprovider>(context,
                                                    listen: false)
                                                .changecounter1(vercecounter);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Theme.of(context).accentColor,
                                        child: InkWell(
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                if (surracounter > 0)
                                                  surracounter--;
                                              });
                                              Provider.of<Lanprovider>(context,
                                                      listen: false)
                                                  .changecounter2(surracounter);
                                            }),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: CircleAvatar(
                                            backgroundColor:
                                                Color.fromRGBO(62, 194, 236, 1),
                                            child: Text(
                                              Provider.of<Lanprovider>(context,
                                                      listen: true)
                                                  .counter2
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Theme.of(context).accentColor,
                                        //   minRadius: MediaQuery.of(context).size.width*0.05,

                                        child: InkWell(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              surracounter++;
                                            });
                                            Provider.of<Lanprovider>(context,
                                                    listen: false)
                                                .changecounter2(surracounter);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.all(5),
                                /*
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.02),
                          */
                                child: Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              Theme.of(context).accentColor,
                                          child: InkWell(
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                              onTap: () async {
                                                setState(() {
                                                  if (goz2counter > 0)
                                                    goz2counter--;
                                                });
                                                Provider.of<Lanprovider>(
                                                        context,
                                                        listen: false)
                                                    .changecounter3(
                                                        goz2counter);
                                              }),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2),
                                            child: CircleAvatar(
                                                backgroundColor: Color.fromRGBO(
                                                    62, 194, 236, 1),
                                                child: Text(
                                                  Provider.of<Lanprovider>(
                                                          context,
                                                          listen: true)
                                                      .counter3
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                          )),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Container(
                                        child: Expanded(
                                          flex: 3,
                                          child: Container(
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Theme.of(context).accentColor,
                                              //   minRadius: MediaQuery.of(context).size.width*0.05,

                                              child: InkWell(
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    goz2counter++;
                                                  });
                                                  Provider.of<Lanprovider>(
                                                          context,
                                                          listen: false)
                                                      .changecounter3(
                                                          goz2counter);
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                        //  row
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: Text(
                              'Daily cheak list',
                              //  maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Color.fromRGBO(167, 85, 163, 1),
                                    letterSpacing: .5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02),
                        //
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await Provider.of<Lanprovider>(context,
                                              listen: false)
                                          .changeLan((!Provider.of<Lanprovider>(
                                                  context,
                                                  listen: false)
                                              .isEn));
                                      await Dbhandler.instance
                                          .activity('done', '1');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(62, 194, 236, 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Provider.of<Lanprovider>(context,
                                                    listen: true)
                                                .isEn
                                            ? Icon(
                                                Icons.check,
                                                size: 20.0,
                                                color: Colors.white,
                                              )
                                            : Icon(
                                                Icons.check_box_outline_blank,
                                                size: 20.0,
                                                color: Colors.blue,
                                              ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Ate Suhoor',
                                      //      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(125, 137, 137, 1),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await Provider.of<Lanprovider>(context,
                                              listen: false)
                                          .changeLan2(
                                              (!Provider.of<Lanprovider>(
                                                      context,
                                                      listen: false)
                                                  .isEn2));
                                      await Dbhandler.instance
                                          .activity('done', '2');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(62, 194, 236, 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Provider.of<Lanprovider>(context,
                                                    listen: true)
                                                .isEn2
                                            ? Icon(
                                                Icons.check,
                                                size: 20.0,
                                                color: Colors.white,
                                              )
                                            : Icon(
                                                Icons.check_box_outline_blank,
                                                size: 20.0,
                                                color: Colors.blue,
                                              ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Gave in Sadaqah',
                                    //      maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(125, 137, 137, 1),
                                          letterSpacing: .5,
                                          //               fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await Provider.of<Lanprovider>(context,
                                              listen: false)
                                          .changeLan3(
                                              (!Provider.of<Lanprovider>(
                                                      context,
                                                      listen: false)
                                                  .isEn3));
                                      await Dbhandler.instance
                                          .activity('done', '3');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(62, 194, 236, 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Provider.of<Lanprovider>(context,
                                                    listen: true)
                                                .isEn3
                                            ? Icon(
                                                Icons.check,
                                                size: 20.0,
                                                color: Colors.white,
                                              )
                                            : Icon(
                                                Icons.check_box_outline_blank,
                                                size: 20.0,
                                                color: Colors.blue,
                                              ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Exercised',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(125, 137, 137, 1),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      Provider.of<Lanprovider>(context,
                                              listen: false)
                                          .changeLan4(
                                              (!Provider.of<Lanprovider>(
                                                      context,
                                                      listen: false)
                                                  .isEn4));
                                      await Dbhandler.instance
                                          .activity('done', '4');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(62, 194, 236, 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Provider.of<Lanprovider>(context,
                                                    listen: true)
                                                .isEn4
                                            ? Icon(
                                                Icons.check,
                                                size: 20.0,
                                                color: Colors.white,
                                              )
                                            : Icon(
                                                Icons.check_box_outline_blank,
                                                size: 20.0,
                                                color: Colors.blue,
                                              ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Attended halaqa online/offline',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(125, 137, 137, 1),
                                          letterSpacing: .5,
                                          //            fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02),
                        //
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      Provider.of<Lanprovider>(context,
                                              listen: false)
                                          .changeLan5(
                                              (!Provider.of<Lanprovider>(
                                                      context,
                                                      listen: false)
                                                  .isEn5));
                                      await Dbhandler.instance
                                          .activity('done', '5');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(62, 194, 236, 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Provider.of<Lanprovider>(context,
                                                    listen: true)
                                                .isEn5
                                            ? Icon(
                                                Icons.check,
                                                size: 20.0,
                                                color: Colors.white,
                                              )
                                            : Icon(
                                                Icons.check_box_outline_blank,
                                                size: 20.0,
                                                color: Colors.blue,
                                              ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Kind to self & others',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(125, 137, 137, 1),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      Provider.of<Lanprovider>(context,
                                              listen: false)
                                          .changeLan6(
                                              (!Provider.of<Lanprovider>(
                                                      context,
                                                      listen: false)
                                                  .isEn6));
                                      await Dbhandler.instance
                                          .activity('done', '6');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(62, 194, 236, 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Provider.of<Lanprovider>(context,
                                                    listen: true)
                                                .isEn6
                                            ? Icon(
                                                Icons.check,
                                                size: 20.0,
                                                color: Colors.white,
                                              )
                                            : Icon(
                                                Icons.check_box_outline_blank,
                                                size: 20.0,
                                                color: Colors.blue,
                                              ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Hosted/attended Iftar.',
                                    //      maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(125, 137, 137, 1),
                                          letterSpacing: .5,
                                          //     fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02),
                        //
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      Provider.of<Lanprovider>(context,
                                              listen: false)
                                          .changeLan7(!Provider.of<Lanprovider>(
                                                  context,
                                                  listen: false)
                                              .isEn7);
                                      await Dbhandler.instance
                                          .activity('done', '7');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(62, 194, 236, 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Provider.of<Lanprovider>(context,
                                                    listen: true)
                                                .isEn7
                                            ? Icon(
                                                Icons.check,
                                                size: 20.0,
                                                color: Colors.white,
                                              )
                                            : Icon(
                                                Icons.check_box_outline_blank,
                                                size: 20.0,
                                                color: Colors.blue,
                                              ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Greeted everyone with smile',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(125, 137, 137, 1),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      Provider.of<Lanprovider>(context,
                                              listen: false)
                                          .changeLan8(!Provider.of<Lanprovider>(
                                                  context,
                                                  listen: false)
                                              .isEn8);
                                      await Dbhandler.instance
                                          .activity('done', '8');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(62, 194, 236, 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Provider.of<Lanprovider>(context,
                                                    listen: true)
                                                .isEn8
                                            ? Icon(
                                                Icons.check,
                                                size: 20.0,
                                                color: Colors.white,
                                              )
                                            : Icon(
                                                Icons.check_box_outline_blank,
                                                size: 20.0,
                                                color: Colors.blue,
                                              ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Helped my mum and dad.',
                                    //      maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(125, 137, 137, 1),
                                          letterSpacing: .5,
                                          //     fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.3)
                            .add(EdgeInsets.symmetric(vertical: 10)),
                        child: loading
                            ? Center(child: CircularProgressIndicator())
                            : ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    )),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Theme.of(context).accentColor)),
                                onPressed: () async {
                                  setState(() {
                                    loading = true;
                                  });

                                  await Dbhandler.instance.quraantracker(
                                      vercecounter.toString(),
                                      surracounter.toString(),
                                      goz2counter.toString());
                                  setState(() {
                                    loading = false;
                                  });
                                  if (Dbhandler.instance.counter == 200) {
                                    Dialogs.materialDialog(
                                        customView: Container(
                                          child: Gift(
                                            'Keep Moving Forward',
                                            'دائمًا إلى الأمام',
                                            'assets/images/Group 795.png',
                                            Colors.white,
                                            Color.fromRGBO(255, 72, 115, 1),
                                            Color.fromRGBO(255, 72, 115, 1),
                                            Color.fromRGBO(255, 72, 115, 1),
                                            Colors.white,
                                            Color.fromRGBO(255, 72, 115, 1),
                                          ),
                                        ),
                                        titleStyle: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: 25),
                                        color: Colors.white,
                                        //    animation: 'assets/cong_example.json',
                                        context: context,
                                        actions: [
                                          Container(
                                            height: 40,
                                            margin: EdgeInsets.symmetric(
                                                horizontal:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.1),
                                            child: IconsButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              onPressed: () async {
                                                Navigator.of(context).popUntil(
                                                    (route) => route.isFirst);
                                                await Navigator
                                                    .pushReplacementNamed(
                                                        context, Types.route);
                                              },
                                              text: 'Done',
                                              color: Color.fromRGBO(
                                                  255, 72, 115, 1),
                                              textStyle: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ]);
                                  } else {
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: Text(
                                  'Done',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                      ),
                    ],
                  ),
      ),
    );
  }
}
