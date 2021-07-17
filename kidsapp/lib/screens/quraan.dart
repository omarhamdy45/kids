import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/lanprovider.dart';
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
  List<int> arg;
  List<int> sour = List<int>.generate(30, (counter) => counter);

  List<int> start = [
    77,
    66,
    57,
    51,
    45,
    41,
    39,
    36,
    33,
    29,
    27,
    25,
    22,
    20,
    18,
    16,
    14,
    12,
    11,
    9,
    8,
    7,
    6,
    5,
    4,
    3,
    3,
    2,
    2,
    0,
  ];
  List<int> end = [
    114,
    77,
    66,
    57,
    51,
    45,
    41,
    39,
    36,
    33,
    29,
    27,
    25,
    22,
    20,
    18,
    20,
    16,
    12,
    11,
    9,
    8,
    7,
    6,
    5,
    4,
    4,
    3,
    3,
    2,
  ];

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await Provider.of<Quraanprovider>(context, listen: false).fetchsour();
    await Provider.of<Quraanprovider>(context, listen: false).fetchjuz2saaves();
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
    print(start.length);
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
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Levels'),
                          Switch(
                            value:
                                Provider.of<Lanprovider>(context, listen: true)
                                    .isguz2,
                            onChanged: (value) {
                              Provider.of<Lanprovider>(context, listen: false)
                                  .changeselect(value);
                              //       Navigator.of(context).pop();
                            },
                            activeColor: Theme.of(context).primaryColor,
                          ),
                          Text('Juz`'),
                        ],
                      ),
                    ),
                    Provider.of<Lanprovider>(context, listen: false).isguz2
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: sour.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  final List<int> arg = [
                                    start[index],
                                    end[index],
                                  30
                                  ];
                                  print(arg);
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
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01)),
                                  height: 130,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    color: Theme.of(context).primaryColor,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 7),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Juz` ${sour[29 - index] + 1}',
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        color: Colors.white,
                                                        letterSpacing: .5,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 30),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 15, top: 15),
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
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            child: Row(
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
                                                      backgroundColor:
                                                          Colors.grey[100],
                                                      child: CircleAvatar(
                                                          radius: 19,
                                                          backgroundColor:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          child: Icon(
                                                            Icons.check_sharp,
                                                            color: Colors.white,
                                                          )),
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                      ).add(EdgeInsets.only(
                                                              top: 10)),
                                                      child: Text(
                                                        Provider.of<Quraanprovider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .juz2save
                                                                .result[0]
                                                                .numberOfVersrRead
                                                                .toString() +
                                                            '/564',
                                                        style:
                                                            GoogleFonts.roboto(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              letterSpacing: .5,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: 12,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  if (index == 0) {
                                    arg = [
                                      1,
                                      112,
                                      114,
                                      113,
                                      111,
                                      110,
                                      105,
                                      107
                                    ];
                                  }
                                  if (index == 1) {
                                    arg = [
                                      106,
                                      109,
                                      91,
                                      94,
                                      103,
                                      102,
                                      93,
                                      100,
                                      97,
                                    ];
                                  }
                                  if (index == 2) {
                                    arg = [96, 104, 99, 101, 92, 90, 89, 98];
                                  }
                                  if (index == 3) {
                                    arg = [88, 87, 86, 85, 84, 83];
                                  }
                                  if (index == 4) {
                                    arg = [82, 81, 80, 79, 78];
                                  }
                                  if (index == 5) {
                                    arg = [32, 67];
                                  }
                                  if (index == 6) {
                                    arg = [50, 55];
                                  }
                                  if (index == 7) {
                                    arg = [50, 36];
                                  }
                                  if (index == 8) {
                                    arg = [49, 56];
                                  }
                                  if (index == 9) {
                                    arg = [18];
                                  }
                                  if (index == 10) {
                                    arg = [33];
                                  }
                                  if (index == 11) {
                                    arg = [24];
                                  }
                                  //  print(arg);
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
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01)),
                                  height: 130,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    color: Theme.of(context).primaryColor,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 7),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.65,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Level ${index + 1}',
                                                    style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 25),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: Row(
                                              children: [
                                                VerticalDivider(
                                                  width: 2,
                                                  endIndent: 10,
                                                  indent: 10,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 20,
                                                      backgroundColor:
                                                          Colors.grey[100],
                                                      child: CircleAvatar(
                                                          radius: 19,
                                                          backgroundColor:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          child: Icon(
                                                            Icons.check_sharp,
                                                            color: Colors.white,
                                                          )),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ],
                )),
    );
  }
}
