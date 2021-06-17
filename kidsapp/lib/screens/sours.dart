import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/models/sour.dart';
import 'package:kidsapp/providers/azkarprovider.dart';
import 'package:kidsapp/providers/quraanprovider.dart';
import 'package:kidsapp/screens/soura.dart';
import 'package:kidsapp/widgets/duadetails.dart';
import 'package:kidsapp/widgets/navigation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class Surz extends StatefulWidget {
  static const String route = 'Surz';
  @override
  _SurzState createState() => _SurzState();
}

class _SurzState extends State<Surz> {
  List<Data> list;
  int i;

  @override
  Widget build(BuildContext context) {
    List<int> arg = ModalRoute.of(context).settings.arguments as List<int>;
    list = [
      for (i = arg[0]; i < arg[1]; i += 1)
        Provider.of<Quraanprovider>(context).sour.data[i]
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        child: ListView(
          children: [
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.arrow_back_outlined,
                            size: 35,),
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
                itemCount: list.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, i) {
                  return GestureDetector(
                    onTap: () {
                      final arg = list[i];
                      Navigator.push(
                        // or pushReplacement, if you need that
                        context,
                        FadeInRoute(
                            routeName: Soura.route, page: Soura(), argument: arg),
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
                            //     margin: EdgeInsets.only(top: 5),
                            child: Text(
                              list[i].numberOfAyahs.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2, right: 2),
                            child: Text(
                              list[i].englishName,
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
                              list[i].name.split(' ').last.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
        padding: EdgeInsets.all(5.0),
        child: new LinearPercentIndicator(
          width: MediaQuery.of(context).size.width * 0.27,
          animation: true,
          lineHeight: 10.0,
          animationDuration: 1000,
          percent: 0.0,
          // center: Text("80.0%"),
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: Colors.amber,
          backgroundColor: Colors.grey[300],
        
         
        ),
    )
    
                         
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
