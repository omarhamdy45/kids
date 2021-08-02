import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/azkarprovider.dart';
import 'package:kidsapp/screens/Home.dart';
import 'package:kidsapp/widgets/duadetails.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

class Duaas extends StatefulWidget {
  static const String route = 'duaas';

  @override
  _DuaasState createState() => _DuaasState();
}

class _DuaasState extends State<Duaas> {
  bool firstrun;
  /*
  List<String> images = [
    'assets/images/besmallah.png',
    'assets/images/SALAAM.png',
    'assets/images/3alikom el SALAM.png',
    'assets/images/thanking.png',
    'assets/images/sleep boy.png',
    'assets/images/wake up boy.png',
    'assets/images/meal.png',
    'assets/images/wear.png',
    'assets/images/toilet.png',
    'assets/images/toilet away.png',
    'assets/images/end of majlis.png',
    'assets/images/home 2.png',
    'assets/images/home 1.png',
    'assets/images/masged1.png',
    'assets/images/masged2.png',
    'assets/images/masged3.png',
    'assets/images/wodo2.png',
    'assets/images/market.png',
    'assets/images/travel.png',
    'assets/images/morning remembrance.png',
    'assets/images/azaan.png',
    'assets/images/mirror.png'
  ];
  */
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
    await Provider.of<Azkarprovider>(context, listen: false)
        .fetchallcatgories();
    if (mounted) {
      setState(() {
        firstrun = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: firstrun
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  Container(
                    child: StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      itemCount: Provider.of<Azkarprovider>(context)
                          .categories
                          .data
                          .length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final azakar = Provider.of<Azkarprovider>(context)
                            .categories
                            .data[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Duadetails.route,
                                arguments: azakar);
                          },
                          child: Container(
                            height: 165,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                    height: 118,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.fill,
                                        imageUrl:
                                            Provider.of<Azkarprovider>(context)
                                                .categories
                                                .data[index]
                                                .image,
                                        placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            new Icon(Icons.error),
                                      ),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 42,
                                  child: Text(
                                    Provider.of<Azkarprovider>(context)
                                        .categories
                                        .data[index]
                                        .title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          letterSpacing: .5,
                                          fontSize: 14),
                                    ),
                                  ),
                                )
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
    );
  }
}
