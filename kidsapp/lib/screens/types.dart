import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/providers/azkarprovider.dart';
import 'package:kidsapp/providers/hadithprovider.dart';
import 'package:kidsapp/screens/duaas.dart';
import 'package:kidsapp/screens/ramdanscreen.dart';
import 'package:kidsapp/screens/salah.dart';
import 'package:kidsapp/widgets/background.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Types extends StatefulWidget {
  @override
  _TypesState createState() => _TypesState();
}

class _TypesState extends State<Types> {
  bool firstrun;
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
    await Provider.of<Athanprovider>(context, listen: false).fetchtimes();
   // await Provider.of<Azkarprovider>(context, listen: false).fetchallazkar();
    await Provider.of<Azkarprovider>(context, listen: false)
        .fetchallcatgories();

    setState(() {
      firstrun = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Background(),
                firstrun
                    ? Center(child: CircularProgressIndicator())
                    : Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.06),
                          child: Column(
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
                                    CircleAvatar(
                                      backgroundColor:
                                          Color.fromRGBO(254, 222, 133, 1),
                                      radius: 60,
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        child: Image.asset(
                                          'assets/images/ramdan.png',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'Ramdan',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color:
                                                Color.fromRGBO(60, 60, 67, 1),
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
                                    CircleAvatar(
                                      backgroundColor:
                                          Color.fromRGBO(254, 222, 133, 1),
                                      radius: 60,
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        child: Image.asset(
                                            'assets/images/salah.png'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'Salah',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color:
                                                Color.fromRGBO(60, 60, 67, 1),
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
                                    CircleAvatar(
                                      backgroundColor:
                                          Color.fromRGBO(254, 222, 133, 1),
                                      radius: 60,
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        child: Image.asset(
                                          'assets/images/dua-hands.png',
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'Duas',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color:
                                                Color.fromRGBO(60, 60, 67, 1),
                                            letterSpacing: .5,
                                            fontSize: 24),
                                      ),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                Positioned(
                    right: 15,
                    top: 15,
                    child: Icon(
                      Icons.logout,
                      size: 30,
                    )),
              ],
            ),
          )),
    );
  }
}
