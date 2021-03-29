
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:kids/providers/Athan.dart';
import 'package:kids/screens/duaas.dart';
import 'package:kids/screens/ramdanscreen.dart';
import 'package:kids/screens/salah.dart';
import 'package:kids/widgets/background.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Types extends StatefulWidget {
  @override
  _TypesState createState() => _TypesState();
}

class _TypesState extends State<Types> {
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await Provider.of<Athanprovider>(context).fetchtimes();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Background(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: Duration(milliseconds: 600),
                            type: PageTransitionType.fade,
                            child: Ramdan(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 4, color: Colors.white)),
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Image.asset('assets/images/ramdan.png'),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Ramdan',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Color.fromRGBO(60, 60, 67, 1),
                                  letterSpacing: .5,
                                  fontSize: 24),
                            ),
                          )
                        ],
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: Duration(milliseconds: 800),
                            type: PageTransitionType.fade,
                            child: Salah(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 4)),
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Image.asset('assets/images/salah.png'),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Salah',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Color.fromRGBO(60, 60, 67, 1),
                                  letterSpacing: .5,
                                  fontSize: 24),
                            ),
                          )
                        ],
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: Duration(milliseconds: 600),
                            type: PageTransitionType.fade,
                            child: Duaas(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 4)),
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Image.asset(
                                'assets/images/dua-hands.png',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Duas',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Color.fromRGBO(60, 60, 67, 1),
                                  letterSpacing: .5,
                                  fontSize: 24),
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
