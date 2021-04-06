import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/providers/azkarprovider.dart';
import 'package:kidsapp/providers/hadithprovider.dart';
import 'package:kidsapp/providers/userprovider.dart';
import 'package:kidsapp/screens/duaas.dart';
import 'package:kidsapp/screens/login.dart';
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
  String currentPostion;
  // LatLng currentPostion;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstrun = true;
    Userprovider.sd =
        Provider.of<Userprovider>(context, listen: false).currentUser.token;
    _getUserLocation();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    // await Provider.of<Azkarprovider>(context, listen: false).fetchallazkar();
    await Provider.of<Azkarprovider>(context, listen: false)
        .fetchallcatgories();
    await Provider.of<Userprovider>(context, listen: false).fetchuserlocation();
    await Provider.of<Athanprovider>(context, listen: false).fetchtimes();

    setState(() {
      firstrun = false;
    });
  }

  void _getUserLocation() async {
    var position = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    Userprovider.city=first.adminArea;
    Userprovider.country=first.countryName;

    print(first.addressLine);
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
                                  MediaQuery.of(context).size.height * 0.03),
                          child: ListView(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.02,
                                    right: MediaQuery.of(context).size.width *
                                        0.02,
                                    bottom: MediaQuery.of(context).size.height *
                                        0.07),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Score:' + Userprovider.score.toString(),
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color:
                                                  Color.fromRGBO(60, 60, 67, 1),
                                              letterSpacing: .5,
                                              fontSize: 24)),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Provider.of<Userprovider>(context,
                                                listen: false)
                                            .clearuserdata();
                                        Navigator.of(context)
                                            .pushReplacementNamed(Login.route);
                                      },
                                      child: Icon(
                                        Icons.logout,
                                        size: 35,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
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
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                              ),
                              GestureDetector(
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
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                              ),
                              GestureDetector(
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
                              )
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          )),
    );
  }
}
