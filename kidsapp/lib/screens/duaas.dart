import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/azkarprovider.dart';
import 'package:kidsapp/screens/types.dart';
import 'package:kidsapp/widgets/duadetails.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

class Duaas extends StatelessWidget {
  static const String route = 'duaas';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, left: 10, bottom: 8),
              child: GestureDetector(
                onTap: () async {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  await Navigator.pushReplacementNamed(context, Types.route);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_outlined,
                      size: 35,
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: StaggeredGridView.countBuilder(
                shrinkWrap: true,
                crossAxisCount: 4,
                itemCount:
                    Provider.of<Azkarprovider>(context).categories.data.length,
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
                              height: 138,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: Provider.of<Azkarprovider>(context)
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
                            height: 22,
                            child: Text(
                              Provider.of<Azkarprovider>(context)
                                  .categories
                                  .data[index]
                                  .title,
                              maxLines: 1,
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
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
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
