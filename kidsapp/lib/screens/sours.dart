import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/models/sour.dart';
import 'package:kidsapp/providers/azkarprovider.dart';
import 'package:kidsapp/providers/lanprovider.dart';
import 'package:kidsapp/providers/quraanprovider.dart';
import 'package:kidsapp/screens/soura.dart';
import 'package:kidsapp/widgets/duadetails.dart';
import 'package:kidsapp/widgets/navigation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class Surz extends StatefulWidget {
  static const String route = 'Surz';
  static bool firstrun;
  @override
  _SurzState createState() => _SurzState();
}

class _SurzState extends State<Surz> {
  List<Data> list = [];
  List<Data> listt = [];
  int i;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Surz.firstrun = true;
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    List<int> arg = ModalRoute.of(context).settings.arguments as List<int>;
    if (Provider.of<Lanprovider>(context, listen: false).isguz2 == true) {
      await Provider.of<Quraanprovider>(context, listen: false)
          .fetchayasave(arg[2]);
    }

    if (!mounted) return;
    setState(() {
      Surz.firstrun = false;
    });
  }

  Future<bool> _onWillPop() async {
    print("on will pop");
    listt.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    List<int> arg = ModalRoute.of(context).settings.arguments as List<int>;
    print(Provider.of<Lanprovider>(context, listen: false).isguz2);
    Provider.of<Lanprovider>(context, listen: false).isguz2 == true
        ? list = [
            for (i = arg[1] - 1; i > arg[0] - 1; i--)
              Provider.of<Quraanprovider>(context).sour.data[i]
          ]
        : arg.forEach((element) {
            print(element);

            listt.add(
                Provider.of<Quraanprovider>(context).sour.data[element - 1]);
          });

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          child: Surz.firstrun
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          _onWillPop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.arrow_back_outlined,
                                  size: 35,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: StaggeredGridView.countBuilder(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        itemCount:
                            Provider.of<Lanprovider>(context, listen: false)
                                        .isguz2 ==
                                    true
                                ? list.length
                                : listt.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, i) {
                          return GestureDetector(
                            onTap: () {
                              final arg = Provider.of<Lanprovider>(context,
                                              listen: false)
                                          .isguz2 ==
                                      true
                                  ? list[i]
                                  : listt[i];
                              print(Surz.firstrun);
                              Navigator.push(
                                // or pushReplacement, if you need that
                                context,
                                FadeInRoute(
                                    routeName: Soura.route,
                                    page: Soura(),
                                    argument: arg),
                              );
                            },
                            child: Container(
                              height: 110,
                              margin: EdgeInsets.all(5),
                              //  color: Theme.of(context).primaryColor,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 2, right: 2),
                                    child: Text(
                                      Provider.of<Lanprovider>(context,
                                                      listen: false)
                                                  .isguz2 ==
                                              true
                                          ? list[i].englishName
                                          : listt[i].englishName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    //        margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      Provider.of<Lanprovider>(context,
                                                      listen: false)
                                                  .isguz2 ==
                                              true
                                          ? list[i]
                                              .name
                                              .split(' ')
                                              .last
                                              .toString()
                                          : listt[i]
                                              .name
                                              .split(' ')
                                              .last
                                              .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Provider.of<Lanprovider>(context,
                                                  listen: false)
                                              .isguz2 ==
                                          true
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                Provider.of<Quraanprovider>(
                                                        context,
                                                        listen: false)
                                                    .ayasaves
                                                    .result[i]
                                                    .numberOfVersrRead
                                                    .toString(),
                                                style: GoogleFonts.roboto(
                                                    color: Colors.white),
                                              ),
                                              Spacer(),
                                              Text(
                                                list[i]
                                                    .numberOfAyahs
                                                    .toString(),
                                                style: GoogleFonts.roboto(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                  Provider.of<Lanprovider>(context,
                                                  listen: false)
                                              .isguz2 ==
                                          true
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                                  horizontal: 5)
                                              .add(EdgeInsets.only(bottom: 5)),
                                          child: new LinearPercentIndicator(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.27,
                                            animation: false,
                                            lineHeight: 10.0,
                                            animationDuration: 1000,
                                            percent:
                                                Provider.of<Quraanprovider>(
                                                            context,
                                                            listen: false)
                                                        .ayasaves
                                                        .result[i]
                                                        .numberOfVersrRead /
                                                    Provider.of<Quraanprovider>(
                                                            context,
                                                            listen: false)
                                                        .ayasaves
                                                        .result[i]
                                                        .numberOfVerse,
                                            // center: Text("80.0%"),
                                            linearStrokeCap:
                                                LinearStrokeCap.roundAll,
                                            progressColor: Colors.amber,
                                            backgroundColor: Colors.grey[300],
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          );
                        },
                        staggeredTileBuilder: (int index) =>
                            new StaggeredTile.fit(1),
                        mainAxisSpacing: 2.0,
                        crossAxisSpacing: 2.0,
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
