import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_indicator/page_indicator.dart';

class Azkar extends StatefulWidget {
  @override
  _AzkarState createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {
  int counter1 = 0;
  int counter2 = 0;
  int counter3 = 0;
  PageController c;

  @override
  void initState() {
    super.initState();
    c = new PageController();
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: PageIndicatorContainer(
            length: 3,
            indicatorColor: Colors.grey[300],
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.07),
            indicatorSelectorColor: Theme.of(context).primaryColor,
            shape: IndicatorShape.roundRectangleShape(
                size: Size(30, 5), cornerSize: Size.square(20)),
            child: PageView(
              controller: c,
              physics: new NeverScrollableScrollPhysics(),
              children: [
                Center(
                  child: Container(
                    color: Colors.grey[100],
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.08),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 5,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              color: Theme.of(context).primaryColor,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                child: Center(
                                  child: Text(
                                    'Athkar After pray',
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Text(
                              'سبحان الله',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    letterSpacing: .5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              'Sohan Allah',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    letterSpacing: .5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (counter1 < 33) {
                                    counter1++;
                                  }
                                });
                                if (counter1 == 33) {
                                  c.nextPage(
                                      duration: new Duration(milliseconds: 400),
                                      curve: Curves.easeIn);
                                }
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Text(
                                  '$counter1',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (counter1 < 33) {
                                          counter1++;
                                        }
                                      });
                                      if (counter1 == 33) {
                                        c.nextPage(
                                            duration:
                                                new Duration(milliseconds: 400),
                                            curve: Curves.easeIn);
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 35),
                                      child: Icon(
                                        FontAwesomeIcons.handPointer,
                                        size: 30,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.09,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    color: Colors.grey[100],
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.08),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Theme.of(context).primaryColor,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: Center(
                                child: Text(
                                  'Athkar After pray',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Text(
                            ' الحمد لله',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  letterSpacing: .5,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            'Elhamdollah',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  letterSpacing: .5,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (counter2 < 33) {
                                  counter2++;
                                }
                              });
                              if (counter2 == 33) {
                                c.nextPage(
                                    duration: new Duration(milliseconds: 400),
                                    curve: Curves.easeIn);
                              }
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Text(
                                '$counter2',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (counter2 < 33) {
                                        counter2++;
                                      }
                                    });
                                    if (counter2 == 33) {
                                      c.nextPage(
                                          duration:
                                              new Duration(milliseconds: 400),
                                          curve: Curves.easeIn);
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 35),
                                    child: Icon(
                                      FontAwesomeIcons.handPointer,
                                      size: 30,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.09,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    color: Colors.grey[100],
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.08),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Theme.of(context).primaryColor,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: Center(
                                child: Text(
                                  'Athkar After pray',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Text(
                            ' الله اكبر',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  letterSpacing: .5,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            ' Allah akbr',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  letterSpacing: .5,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (counter3 < 33) {
                                  counter3++;
                                }
                              });
                              if (counter3 == 33) {
                                Navigator.pop(context);
                              }
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Text(
                                '$counter3',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (counter3 < 33) {
                                        counter3++;
                                      }
                                    });
                                    if (counter3 == 33) {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 35),
                                    child: Icon(
                                      FontAwesomeIcons.handPointer,
                                      size: 30,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.09,
                          ),
                          /*
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 150,
                                  margin: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1)
                                      .add(EdgeInsets.symmetric(vertical: 10)),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          )),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Theme.of(context)
                                                      .accentColor)),
                                      onPressed: () async {},
                                      child: Text(
                                        'Done',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      )),
                                )
                              ],
                            ),
                          )
                          */
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
