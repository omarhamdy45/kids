import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/models/Categories.dart';
import 'package:kidsapp/providers/azkarprovider.dart';
import 'package:provider/provider.dart';

class Duadetails extends StatefulWidget {
  static const String route = '/Duadetails';

  @override
  _DuadetailsState createState() => _DuadetailsState();
}

class _DuadetailsState extends State<Duadetails> {
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
    Data azkar = ModalRoute.of(context).settings.arguments as Data;
    await Provider.of<Azkarprovider>(context).fetchazkarbyid(azkar.id);
    print(azkar.id);
    setState(() {
      firstrun = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Data azkar = ModalRoute.of(context).settings.arguments as Data;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: firstrun
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          azkar.title,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Theme.of(context).accentColor,
                                letterSpacing: .5,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        //  width: MediaQuery.of(context).size.width * 0.1,
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.2),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).accentColor)),
                        height: 190,
                        child: Image.asset(
                          'assets/images/Group 2318.png',
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    /*
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        azkar.azkars[0].desciption,
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                              letterSpacing: .5,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 5, bottom: 20, right: 20, left: 20),
                      child: Text(
                        azkar.azkars[0].desciption,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                              letterSpacing: .5,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 5, bottom: 20, right: 20, left: 20),
                      child: Text(
                        azkar.azkars[0].desciption,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                              letterSpacing: .5,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    */
                    Container(
                        child: ListView.builder(
                            itemCount: azkar.azkars.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      child: Text(
                                        azkar.azkars[index].desciption,
                                        textDirection: TextDirection.rtl,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color:
                                                  Theme.of(context).accentColor,
                                              letterSpacing: .5,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    /*
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 5,
                                          bottom: 20,
                                          right: 20,
                                          left: 20),
                                      child: Text(
                                        azkar.azkars[index].desciption,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color:
                                                  Theme.of(context).accentColor,
                                              letterSpacing: .5,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    */
                                  ],
                                ),
                              );
                            })),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 30,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Icon(
                              Icons.play_arrow_sharp,
                              color: Colors.white,
                              size: 45,
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        CircleAvatar(
                            radius: 30,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Icon(
                              Icons.pause_outlined,
                              color: Colors.white,
                              size: 45,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
