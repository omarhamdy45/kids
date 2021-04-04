import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/providers/hadithprovider.dart';
import 'package:kidsapp/screens/dua.dart';
import 'package:kidsapp/screens/hadeth.dart';
import 'package:kidsapp/screens/qura%60n.dart';
import 'package:kidsapp/widgets/ramdanitem.dart';
import 'package:provider/provider.dart';

class Ramdan extends StatefulWidget {
  static const String route='/ramdan';
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
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await Provider.of<Hadithprovider>(context).fetchallhadith();
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
                                Provider.of<Athanprovider>(context)
                                        .time
                                        .data
                                        .date
                                        .hijri
                                        .month
                                        .number
                                        .toString() +
                                    ' ' +
                                    Provider.of<Athanprovider>(context)
                                        .time
                                        .data
                                        .date
                                        .hijri
                                        .month
                                        .en,
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
                              height: MediaQuery.of(context).size.height * 0.04,
                              child: Center(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'Rest for breakfast',
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
                    margin: EdgeInsets.only(right: 50),
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
                  Ramdanitem('Hadith of the Day', 'assets/images/Group400.png',
                      Hadeth()),
                  Ramdanitem(
                      'Deed of the Day', 'assets/images/quran.png', Quraan()),
                  Ramdanitem(
                      'Du`a of the Day', 'assets/images/duaa.png', Dua()),
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
                          'Iftar time',
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
                              },
                              child: Text(
                                'No',
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
                              },
                              child: Text(
                                'Thohr',
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
                              },
                              child: Text(
                                'Asr',
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
                              },
                              child: Text(
                                'maghrib',
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
                                'verse(s)',
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
                                'Sura',
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
                                'Guz`',
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
                                          onTap: () {
                                            setState(() {
                                              goz2counter--;
                                            });
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
                              Text('select1',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: Color.fromRGBO(125, 137, 137, 1),
                                    ),
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    value1 = !value1;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: value1
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
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                'select1',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(125, 137, 137, 1),
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    value2 = !value2;
                                  });
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
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text('select1',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: Color.fromRGBO(125, 137, 137, 1),
                                    ),
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    value3 = !value3;
                                  });
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
                              Text('select1',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: Color.fromRGBO(125, 137, 137, 1),
                                    ),
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    value4 = !value4;
                                  });
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
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                'select1',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(125, 137, 137, 1),
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    value5 = !value5;
                                  });
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
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text('select1',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: Color.fromRGBO(125, 137, 137, 1),
                                    ),
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    value6 = !value6;
                                  });
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
                        onPressed: () {},
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
