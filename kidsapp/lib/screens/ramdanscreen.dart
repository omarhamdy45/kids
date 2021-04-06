import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/providers/deedprovider.dart';
import 'package:kidsapp/providers/duaaprovider.dart';
import 'package:kidsapp/providers/hadithprovider.dart';
import 'package:kidsapp/providers/lanprovider.dart';
import 'package:kidsapp/providers/userprovider.dart';
import 'package:kidsapp/screens/dua.dart';
import 'package:kidsapp/screens/hadeth.dart';
import 'package:kidsapp/screens/qura%60n.dart';
import 'package:kidsapp/widgets/ramdanitem.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ramdan extends StatefulWidget {
  static const String route = '/ramdan';
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

  Color color = Color.fromRGBO(62, 194, 236, 1);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstrun = true;
   
     Provider.of<Lanprovider>(context,
                                          listen: false).getLan();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await Provider.of<Hadithprovider>(context, listen: false).fetchallhadith();
    await Provider.of<Duaaprovider>(context, listen: false).fetchallduaas();
    await Provider.of<Deedprovider>(context, listen: false).fetchalldeed();
     
    setState(() {
      firstrun = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: firstrun
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
                                '1' + ' ' + 'Ramdan',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(167, 85, 163, 1),
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              // Image.asset('assets/images/Group 240.png')
                            ],
                          ),
                          Card(
                            color: Theme.of(context).primaryColor,
                            child: Container(
                              height: 50,
                              child: Center(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'Remaining time to breakfast',
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
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
                        right: MediaQuery.of(context).size.height * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.timer_sharp,
                          color: Color.fromRGBO(167, 85, 163, 1),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          '6:00',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(167, 85, 163, 1),
                                letterSpacing: .5,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Ramdanitem('Hadith Of The Day', 'assets/images/Group400.png',
                      Hadeth()),
                  Ramdanitem(
                      'Story Of The Day', 'assets/images/quran.png', Quraan()),
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
                                    borderRadius: BorderRadius.circular(2.0),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(select1
                                          ? Theme.of(context).accentColor
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
                                    borderRadius: BorderRadius.circular(2.0),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(select2
                                          ? Theme.of(context).accentColor
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
                                    borderRadius: BorderRadius.circular(2.0),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(select3
                                          ? Theme.of(context).accentColor
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
                                    borderRadius: BorderRadius.circular(2.0),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(select4
                                          ? Theme.of(context).accentColor
                                          : color)),
                              onPressed: () {
                                setState(() {
                                  select1 = false;
                                  select2 = false;
                                  select3 = false;
                                  select4 = true;
                                });
                                Dbhandler.instance.ramdanstatus('maghrib');
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
                                    borderRadius: BorderRadius.circular(2.0),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Theme.of(context).primaryColor)),
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
                                    borderRadius: BorderRadius.circular(2.0),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Theme.of(context).primaryColor)),
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
                                    borderRadius: BorderRadius.circular(2.0),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Theme.of(context).primaryColor)),
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
                                    MediaQuery.of(context).size.width * 0.02),
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
                                            vercecounter--;
                                            print(vercecounter);
                                          });
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
                                            Theme.of(context).primaryColor,
                                        child: Text(
                                          vercecounter.toString(),
                                          style: TextStyle(color: Colors.white),
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
                                    MediaQuery.of(context).size.width * 0.02),
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
                                            surracounter--;
                                            print(vercecounter);
                                          });
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
                                            Theme.of(context).primaryColor,
                                        child: Text(
                                          surracounter.toString(),
                                          style: TextStyle(color: Colors.white),
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
                                              goz2counter--;
                                            });
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setInt(
                                                "goz2counter", goz2counter);
                                          }),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Expanded(
                                      flex: 4,
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 2),
                                        child: CircleAvatar(
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            child: Text(
                                              goz2counter.toString(),
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
                        horizontal: MediaQuery.of(context).size.width * 0.02),
                    //
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  setState(() {
                                    value1 = !value1;
                                  });

                                  await Provider.of<Lanprovider>(context,
                                          listen: false)
                                      .changeLan(value1);
                                  await Dbhandler.instance
                                      .activity('done', '1');
                                  print(Provider.of<Lanprovider>(context,
                                          listen: false)
                                      .isEn);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
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
                                      color: Color.fromRGBO(125, 137, 137, 1),
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
                                  setState(() {
                                    value2 = !value2;
                                  });
                                  await Dbhandler.instance
                                      .activity('done', '2');
                                  print(Provider.of<Lanprovider>(context,
                                          listen: false)
                                      .isEn);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: value2
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
                                      color: Color.fromRGBO(125, 137, 137, 1),
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
                        horizontal: MediaQuery.of(context).size.width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  setState(() {
                                    value3 = !value3;
                                  });
                                  await Dbhandler.instance
                                      .activity('done', '3');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: value3
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
                                      color: Color.fromRGBO(125, 137, 137, 1),
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
                                  setState(() {
                                    value4 = !value4;
                                  });
                                  await Dbhandler.instance
                                      .activity('done', '4');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: value4
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
                                      color: Color.fromRGBO(125, 137, 137, 1),
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
                        horizontal: MediaQuery.of(context).size.width * 0.02),
                    //
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  setState(() {
                                    value5 = !value5;
                                  });
                                  await Dbhandler.instance
                                      .activity('done', '5');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: value5
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
                                      color: Color.fromRGBO(125, 137, 137, 1),
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
                                  setState(() {
                                    value6 = !value6;
                                  });
                                  await Dbhandler.instance
                                      .activity('done', '6');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: value6
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
                                      color: Color.fromRGBO(125, 137, 137, 1),
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
                        horizontal: MediaQuery.of(context).size.width * 0.02),
                    //
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  setState(() {
                                    value7 = !value7;
                                  });
                                  await Dbhandler.instance
                                      .activity('done', '7');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: value7
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
                                      color: Color.fromRGBO(125, 137, 137, 1),
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
                                  setState(() {
                                    value8 = !value8;
                                  });
                                  await Dbhandler.instance
                                      .activity('done', '8');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: value8
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
                                      color: Color.fromRGBO(125, 137, 137, 1),
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
                            horizontal: MediaQuery.of(context).size.width * 0.3)
                        .add(EdgeInsets.symmetric(vertical: 10)),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).accentColor)),
                        onPressed: () async {
                          await Dbhandler.instance.quraantracker(
                              vercecounter.toString(),
                              surracounter.toString(),
                              goz2counter.toString());
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ),
                ],
              ),
      ),
    );
  }
}
