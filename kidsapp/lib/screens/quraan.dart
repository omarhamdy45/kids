import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/quraanprovider.dart';
import 'package:kidsapp/screens/sours.dart';
import 'package:kidsapp/widgets/navigation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Quraan extends StatefulWidget {
  @override
  _QuraanState createState() => _QuraanState();
}

class _QuraanState extends State<Quraan> {
  bool firstrun;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await Provider.of<Quraanprovider>(context, listen: false).fetchsour();
    if (!mounted) return;
    setState(() {
      firstrun = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstrun = true;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: double.infinity,
          child: firstrun
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                    final List<int> arg=[77,114];
                          Navigator.push(
                              // or pushReplacement, if you need that
                              context,
                              FadeInRoute(
                                  routeName: Surz.route,
                                  page: Surz(),
                                  argument: arg),
                            );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 7).add(
                            EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.01)),
                        height: 130,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Theme.of(context).primaryColor,
                          child: Container(
                            margin: EdgeInsets.only(left: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Juz` 30',
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: .5,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 15, top: 15),
                                      child: Text(
                                        'Vercres : 564',
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: .5,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    VerticalDivider(
                                      width: 2,
                                      endIndent: 10,
                                      indent: 10,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.grey[100],
                                          child: CircleAvatar(
                                              radius: 19,
                                              backgroundColor: Theme.of(context)
                                                  .primaryColor,
                                              child: Icon(
                                                Icons.check_sharp,
                                                color: Colors.white,
                                              )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ).add(EdgeInsets.only(top: 10)),
                                          child: Text(
                                            '0/564',
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  letterSpacing: .5,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        final List<int> arg=[66,77];
                          Navigator.push(
                              // or pushReplacement, if you need that
                              context,
                              FadeInRoute(
                                  routeName: Surz.route,
                                  page: Surz(),
                                  argument: arg),
                            );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 7).add(
                            EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.01)),
                        height: 130,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Theme.of(context).primaryColor,
                          child: Container(
                            margin: EdgeInsets.only(left: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Juz` 29',
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: .5,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 15, top: 15),
                                      child: Text(
                                        'Vercres : 431',
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: .5,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    VerticalDivider(
                                      width: 2,
                                      endIndent: 10,
                                      indent: 10,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.grey[100],
                                          child: CircleAvatar(
                                              radius: 19,
                                              backgroundColor: Theme.of(context)
                                                  .primaryColor,
                                              child: Icon(
                                                Icons.check_sharp,
                                                color: Colors.white,
                                              )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ).add(EdgeInsets.only(top: 10)),
                                          child: Text(
                                            '0/431',
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  letterSpacing: .5,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                           final List<int> arg=[57,66];
                          Navigator.push(
                              // or pushReplacement, if you need that
                              context,
                              FadeInRoute(
                                  routeName: Surz.route,
                                  page: Surz(),
                                  argument: arg),
                            );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 7).add(
                            EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.01)),
                        height: 130,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Theme.of(context).primaryColor,
                          child: Container(
                            margin: EdgeInsets.only(left: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Juz` 28',
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: .5,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 15, top: 15),
                                      child: Text(
                                        'Vercres : 137',
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: .5,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    VerticalDivider(
                                      width: 2,
                                      endIndent: 10,
                                      indent: 10,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.grey[100],
                                          child: CircleAvatar(
                                              radius: 19,
                                              backgroundColor: Theme.of(context)
                                                  .primaryColor,
                                              child: Icon(
                                                Icons.check_sharp,
                                                color: Colors.white,
                                              )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ).add(EdgeInsets.only(top: 10)),
                                          child: Text(
                                            '0/137',
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  letterSpacing: .5,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
    );
  }
}
