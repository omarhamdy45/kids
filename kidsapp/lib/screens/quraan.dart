import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/lanprovider.dart';
import 'package:kidsapp/providers/quraanprovider.dart';
import 'package:kidsapp/screens/soura.dart';
import 'package:kidsapp/screens/sours.dart';
import 'package:kidsapp/widgets/navigation.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class Quraan extends StatefulWidget {
  @override
  _QuraanState createState() => _QuraanState();
}

class _QuraanState extends State<Quraan> {
  bool firstrun;
  List<int> arg;
  List<int> sour = List<int>.generate(30, (counter) => counter);
  List<int> ayatleanth = [
    564,
    431,
    137,
    399,
    195,
    246,
    175,
    357,
    169,
    178,
    171,
    339,
    202,
    190,
    269,
    185,
    227,
    154,
    170,
    151,
    127,
    159,
    142,
    149,
    110,
    124,
    131,
    126,
    111,
    148,
  ];

  @override
  void didChangeDependencies() async {
    // ignore: todo
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await Provider.of<Quraanprovider>(context, listen: false).fetchsour();
    await Provider.of<Quraanprovider>(context, listen: false).fetchjuz2saaves();
    await Provider.of<Quraanprovider>(context, listen: false).fetchlevels();
    if (!mounted) return;
    setState(() {
      firstrun = false;
    });
  }

  @override
  void initState() {
    // ignore: todo
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
                                onTap: () async {
                                  final List<int> arg = [sour[29 - index] + 1];

                                  await Navigator.push(
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
                                                  'Vercres : ${ayatleanth[index]}',
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
                                                                .result[index]
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
                            itemCount: Provider.of<Quraanprovider>(context)
                                .levles
                                .levels
                                .length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                child: ExpandableNotifier(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: <Widget>[
                                      ScrollOnExpand(
                                        scrollOnExpand: true,
                                        scrollOnCollapse: true,
                                        child: Container(
                                          child: ExpandablePanel(
                                            theme: const ExpandableThemeData(
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: false,
                                              tapBodyToCollapse: true,
                                            ),
                                            header: Card(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Container(
                                                height: 60,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 2),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Text(
                                                    "Level ${index + 1}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            expanded: Container(
                                              height:
                                                  Provider.of<Quraanprovider>(
                                                              context)
                                                          .levles
                                                          .levels[index]
                                                          .qurans
                                                          .length *
                                                      145.toDouble(),
                                              child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: Provider.of<
                                                              Quraanprovider>(
                                                          context)
                                                      .levles
                                                      .levels
                                                      .length,
                                                  itemBuilder: (context, i) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        List<int> arg = [];

                                                        arg.add(Provider.of<
                                                                    Quraanprovider>(
                                                                context,
                                                                listen: false)
                                                            .levles
                                                            .levels[index]
                                                            .qurans[i]
                                                            .number);
                                                        arg.add(Provider.of<
                                                                    Quraanprovider>(
                                                                context,
                                                                listen: false)
                                                            .levles
                                                            .levels[index]
                                                            .qurans[i]
                                                            .juza);
                                                        arg.add(0);
                                                        arg.add(Provider.of<
                                                                    Quraanprovider>(
                                                                context,
                                                                listen: false)
                                                            .levles
                                                            .levels[index]
                                                            .qurans[i]
                                                            .numberOfVerse);
                                                        Navigator.push(
                                                          // or pushReplacement, if you need that
                                                          context,
                                                          FadeInRoute(
                                                              routeName:
                                                                  Soura.route,
                                                              page: Soura(),
                                                              argument: arg),
                                                        );
                                                      },
                                                      child: Container(
                                                        height: 130,
                                                        margin: EdgeInsets.symmetric(
                                                            horizontal:
                                                                MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.07,
                                                            vertical: 8),
                                                        child: Card(
                                                            elevation: 5,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            color: Colors.white,
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child:
                                                                      Container(
                                                                    child: Row(
                                                                      children: [
                                                                        Text(
                                                                          Provider.of<Quraanprovider>(context)
                                                                              .levles
                                                                              .levels[index]
                                                                              .qurans[i]
                                                                              .number
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(color: Colors.black),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.only(
                                                                        bottom:
                                                                            10),
                                                                    child: Text(
                                                                      Provider.of<Quraanprovider>(
                                                                              context)
                                                                          .levles
                                                                          .levels[
                                                                              index]
                                                                          .qurans[
                                                                              i]
                                                                          .surah,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      softWrap:
                                                                          true,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .fade,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              5)
                                                                      .add(EdgeInsets.only(
                                                                          bottom:
                                                                              5)),
                                                                  child:
                                                                      new LinearPercentIndicator(
                                                                    //   fillColor: Theme.of(context).pr,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.77,

                                                                    animation:
                                                                        false,
                                                                    lineHeight:
                                                                        10.0,
                                                                    animationDuration:
                                                                        1000,
                                                                    percent:
                                                                        10 /
                                                                            100,
                                                                    // center: Text("80.0%"),
                                                                    linearStrokeCap:
                                                                        LinearStrokeCap
                                                                            .roundAll,
                                                                    progressColor:
                                                                        Theme.of(context)
                                                                            .primaryColor,
                                                                    backgroundColor: Theme.of(
                                                                            context)
                                                                        .primaryColor
                                                                        .withOpacity(
                                                                            0.2),
                                                                  ),
                                                                )
                                                              ],
                                                            )),
                                                      ),
                                                    );
                                                  }),
                                            ),

                                            /*
                                             Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                for (var _ in Iterable
                                                    .generate(Provider.of<
                                                                Quraanprovider>(
                                                            context)
                                                        .levles
                                                        .levels[index]
                                                        .qurans
                                                        .length))
                                                  Container(
                                                    margin:
                                                        EdgeInsets.all(20),
                                                    width: double.infinity,
                                                    color: Colors.white,
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 10),
                                                        child: Text(
                                                          Provider.of<Quraanprovider>(
                                                                  context)
                                                              .levles
                                                              .levels[index]
                                                              .qurans[1]
                                                              .surah,
                                                          softWrap: true,
                                                          overflow:
                                                              TextOverflow
                                                                  .fade,
                                                        )),
                                                  ),
                                              ],
                                            ),
                                            */
                                            builder: (_, collapsed, expanded) {
                                              return Expandable(
                                                collapsed: collapsed,
                                                expanded: expanded,
                                                theme:
                                                    const ExpandableThemeData(
                                                        crossFadePoint: 0),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                              );
                            },
                          ),
                  ],
                )),
    );
  }
}
