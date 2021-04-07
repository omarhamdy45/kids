import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/models/Categories.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/providers/azkarprovider.dart';
import 'package:kidsapp/providers/userprovider.dart';
import 'package:kidsapp/screens/duaas.dart';
import 'package:kidsapp/widgets/gift.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
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
                                        Provider.of<Azkarprovider>(context)
                                            .categoriess
                                            .data
                                            .azkars[index]
                                            .desciptionAr,
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
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 5,
                                          bottom: 20,
                                          right: 20,
                                          left: 20),
                                      child: Text(
                                        Provider.of<Azkarprovider>(context)
                                            .categoriess
                                            .data
                                            .azkars[index]
                                            .desciptionEn,
                                        textDirection: TextDirection.ltr,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color:
                                                  Theme.of(context).accentColor,
                                              letterSpacing: .5,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 5,
                                          bottom: 20,
                                          right: 20,
                                          left: 20),
                                      child: Text(
                                        Provider.of<Azkarprovider>(context)
                                            .categoriess
                                            .data
                                            .azkars[index]
                                            .desciptionFr,
                                        textDirection: TextDirection.ltr,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color:
                                                  Theme.of(context).accentColor,
                                              letterSpacing: .5,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.3)
                          .add(EdgeInsets.symmetric(vertical: 10)),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).accentColor)),
                          onPressed: () async {
                            await Dbhandler.instance
                                .azkarread('read', azkar.id.toString());
                            Dialogs.materialDialog(
                                customView: Container(
                                  child: Gift(
                                    'Amazing',
                                    'ماشاء الله',
                                    'assets/images/Group 804.png',
                                    Color.fromRGBO(255, 72, 115, 1),
                                    Color.fromRGBO(255, 72, 115, 1),
                                    Color.fromRGBO(255, 72, 115, 1),
                                    Color.fromRGBO(255, 72, 115, 1),
                                    Color.fromRGBO(255, 72, 115, 1),
                                      Color.fromRGBO(255, 72, 115, 1),
                                  ),
                                ),
                                titleStyle: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 25),
                                color: Colors.white,
                                //    animation: 'assets/cong_example.json',
                                context: context,
                                actions: [
                                  Container(
                                    height: 40,
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.1),
                                    child: IconsButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.pushReplacementNamed(
                                            context, Duaas.route);
                                      },
                                      text: 'Lovely',
                                      color: Color.fromRGBO(255, 72, 115, 1),
                                      textStyle: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ]);
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
