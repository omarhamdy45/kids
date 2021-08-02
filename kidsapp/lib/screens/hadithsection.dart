import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/hadithprovider.dart';
import 'package:kidsapp/providers/lanprovider.dart';
import 'package:kidsapp/providers/quraanprovider.dart';
import 'package:kidsapp/screens/dialhadithbylevel.dart';
import 'package:kidsapp/screens/dialyhadith.dart';
import 'package:kidsapp/screens/record.dart';
import 'package:kidsapp/screens/soura.dart';
import 'package:kidsapp/widgets/navigation.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class Hadithsection extends StatefulWidget {
  @override
  _HadithsectionState createState() => _HadithsectionState();
}

class _HadithsectionState extends State<Hadithsection> {
  bool firstrun;
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
    await Provider.of<Hadithprovider>(context, listen: false)
        .fetchdailyhadith();
    await Provider.of<Hadithprovider>(context, listen: false)
        .fetchhadithlevels();
    setState(() {
      firstrun = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: double.infinity,
          width: double.infinity,
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
                          Text('Levles'),
                          Switch(
                            value:
                                Provider.of<Lanprovider>(context, listen: true)
                                    .islevel,
                            onChanged: (value) {
                              Provider.of<Lanprovider>(context, listen: false)
                                  .changehadithselecet(value);
                              //       Navigator.of(context).pop();
                            },
                            activeColor: Theme.of(context).primaryColor,
                          ),
                          Text('open Library'),
                        ],
                      ),
                    ),
                    Provider.of<Lanprovider>(context, listen: false).islevel
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: Provider.of<Hadithprovider>(context,
                                    listen: false)
                                .dailyhadith
                                .data
                                .length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  final dialyhadith =
                                      Provider.of<Hadithprovider>(context,
                                              listen: false)
                                          .dailyhadith
                                          .data[index];
                                  AudioRecorder.dialy = true;
                                  Navigator.push(
                                    // or pushReplacement, if you need that
                                    context,
                                    FadeInRoute(
                                        routeName: Dialyhadith.route,
                                        page: Dialyhadith(),
                                        argument: dialyhadith),
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
                                                    'Hadith ${index + 1}',
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
                                                Container(
                                                  child: Text(
                                                    Provider.of<Hadithprovider>(
                                                            context,
                                                            listen: false)
                                                        .dailyhadith
                                                        .data[index]
                                                        .title,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                          )
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
                                          //   color: Colors.amber,
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
                                                              Hadithprovider>(
                                                          context)
                                                      .hadithlevles
                                                      .levels
                                                      .length,
                                                  itemBuilder: (context, i) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        final dialyhadith = Provider
                                                                .of<Hadithprovider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                            .hadithlevles
                                                            .levels[index]
                                                            .allhadiths[index];
                                                        AudioRecorder.dialy =
                                                            true;
                                                        Navigator.push(
                                                          // or pushReplacement, if you need that
                                                          context,
                                                          FadeInRoute(
                                                              routeName:
                                                                  Dialyhadithbylevle
                                                                      .route,
                                                              page:
                                                                  Dialyhadithbylevle(),
                                                              argument:
                                                                  dialyhadith),
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
                                                                        Spacer(),
                                                                        CircleAvatar(
                                                                          radius:
                                                                              20,
                                                                          backgroundColor:
                                                                              Colors.black,
                                                                          child: CircleAvatar(
                                                                              radius: 19,
                                                                              backgroundColor: Colors.white,
                                                                              child: Icon(
                                                                                Icons.check_sharp,
                                                                                color: Colors.black,
                                                                              )),
                                                                        ),
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
                                                                      Provider.of<Hadithprovider>(
                                                                              context)
                                                                          .hadithlevles
                                                                          .levels[
                                                                              index]
                                                                          .allhadiths[
                                                                              index]
                                                                          .title,
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
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    );
                                                  }),
                                            ),
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
