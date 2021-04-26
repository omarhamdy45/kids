import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/models/Categories.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/providers/azkarprovider.dart';
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
  bool loading;
  bool play;
  AudioPlayer advancedPlayer;
  @override
  void initState() {
    super.initState();
    firstrun = true;
    loading = false;
    play = false;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    advancedPlayer = AudioPlayer();
    Data azkar = ModalRoute.of(context).settings.arguments as Data;
    await Provider.of<Azkarprovider>(context).fetchazkarbyid(azkar.id);
    setState(() {
      firstrun = false;
    });
  }

  @override
  void dispose() {
    advancedPlayer.dispose();
    // TODO: implement dispose
    super.dispose();
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
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 10, bottom: 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
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
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.2),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: Theme.of(context).accentColor)),
                      height: 190,
                      child: CachedNetworkImage(
                        imageUrl: Provider.of<Azkarprovider>(context)
                            .categoriess
                            .data
                            .image,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              play = !play;
                            });
                            play
                                ? await advancedPlayer.play(
                                    Provider.of<Azkarprovider>(context,
                                            listen: false)
                                        .categoriess
                                        .data
                                        .azkars[0]
                                        .audio)
                                : await advancedPlayer.pause();
                            advancedPlayer.onPlayerCompletion.listen((event) {
                              advancedPlayer.stop();
                              setState(() {
                                play = false;
                              });
                            });
                          },
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: play
                                  ? Icon(
                                      Icons.pause_outlined,
                                      color: Colors.white,
                                      size: 45,
                                    )
                                  : Icon(
                                      Icons.play_arrow_sharp,
                                      color: Colors.white,
                                      size: 45,
                                    )),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () async {
                            advancedPlayer.stop();
                            setState(() {
                              play = false;
                            });
                          },
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon(
                                Icons.stop,
                                color: Colors.white,
                                size: 45,
                              )),
                        )
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
                      child: loading
                          ? Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Theme.of(context).accentColor)),
                              onPressed: () async {
                                setState(() {
                                  loading = true;
                                });
                                await Dbhandler.instance
                                    .azkarread('read', azkar.id.toString());
                                setState(() {
                                  loading = false;
                                });
                                if (Dbhandler.instance.azkarreadd == 200)
                                  Dialogs.materialDialog(
                                      customView: Container(
                                        child: Gift(
                                          'Amazing',
                                          'ماشاء الله',
                                          'assets/images/Group 804.png',
                                          Colors.white,
                                          Colors.white,
                                          Color.fromRGBO(255, 72, 115, 1),
                                          Colors.white,
                                          Colors.white,
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
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.1),
                                          child: IconsButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              await Navigator
                                                  .pushReplacementNamed(
                                                      context, Duaas.route);
                                            },
                                            text: 'Lovely',
                                            color:
                                                Color.fromRGBO(255, 72, 115, 1),
                                            textStyle:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ]);
                                else {
                                  Navigator.pushReplacementNamed(
                                      context, Duaas.route);
                                }
                              },
                              child: Text(
                                'Done',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
