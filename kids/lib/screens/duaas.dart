import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids/screens/dua1.dart';
import 'package:page_transition/page_transition.dart';

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
                        color: Colors.grey,
                        letterSpacing: .5,
                        fontSize: 17),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),

                    borderSide: BorderSide(width: 1, color: Colors.white),
                    //   borderRadius: BorderRadius.all(),
                  ),
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: Duration(milliseconds: 700),
                            type: PageTransitionType.fade,
                            child: Dua1(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child:
                                  Image.asset('assets/images/Group 2318.png'),
                              // color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Text(
                                'when waking up',
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
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Image.asset('assets/images/Group 2318.png'),
                            // color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'when breaking',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  letterSpacing: .5,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Image.asset('assets/images/Group 2318.png'),
                            // color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'transportation',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  letterSpacing: .5,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Image.asset('assets/images/Group 2318.png'),
                            // color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(
                              'when traveling',
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
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Image.asset('assets/images/Group 2318.png'),
                            // color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'upon completing a meal',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  letterSpacing: .5,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Image.asset('assets/images/Group 2318.png'),
                            // color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Before eating',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  letterSpacing: .5,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Image.asset('assets/images/Group 2318.png'),
                            // color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(
                              'Upon breaking fast',
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
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Image.asset('assets/images/Group 2318.png'),
                            // color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Upon leaving the mosque',
                            maxLines: 1,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  letterSpacing: .5,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Image.asset('assets/images/Group 2318.png'),
                            // color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'when traveling',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  letterSpacing: .5,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
