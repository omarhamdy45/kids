import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/azkarprovider.dart';
import 'package:kidsapp/widgets/duadetails.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Duaas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8)
                  .add(EdgeInsets.only(top: 5)),
              child: TextFormField(
                maxLines: 1,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  contentPadding:
                      new EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  errorStyle: TextStyle(color: Colors.redAccent[900]),
                  hintText: '    Search',
                  hintStyle: GoogleFonts.sourceSerifPro(
                    textStyle: TextStyle(
                        color: Colors.grey, letterSpacing: .5, fontSize: 17),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),

                    borderSide: BorderSide(width: 1, color: Colors.white),
                    //   borderRadius: BorderRadius.all(),
                  ),
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
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
                  final azakar= Provider.of<Azkarprovider>(context)
                              .categories
                              .data[index];
                              
                  return GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, Duadetails.route,
                          arguments:azakar);
                    },
                    child: Container(
                      height: 165,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                              height: 138,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/Group 2318.png',
                                  fit: BoxFit.cover,
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
