//import 'package:audioplayers/audioplayers.dart';

import 'dart:async';
import 'dart:math';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import 'package:kidsapp/models/ayah.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/models/sour.dart';
import 'package:kidsapp/providers/quraanprovider.dart';
import 'package:kidsapp/screens/record.dart';
import 'package:kidsapp/screens/sours.dart';
import 'package:kidsapp/widgets/Controlsbuttons.dart';
import 'package:kidsapp/widgets/sourarecord.dart';

import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Soura extends StatefulWidget {
  static const String route = '/Soura';
  static String souranum;
  static String juznum;
  static String souraname;
  @override
  _SouraState createState() => _SouraState();
}

class _SouraState extends State<Soura> {
  bool checkBoxValue = false;
  bool firstrun;
  List<int> audios = [];
  List<String> audioss = [];
  List<ObjectClass> demoData;
  // AudioPlayer advancedPlayer;
  AudioPlayer player2;
  AudioPlayer player3;
  bool play;
  Color textcolor1 = Colors.black;
  Color textcolor2 = Colors.blue[600];
  Verses played;
  bool ayaplayed;
  List<double> speed = [1, 0.5, 1.5];
  bool playlist;
  ScrollController _scrollController;
  int j;
  int s = 0;
  bool finsh;
  dynamic postion;
  int k;
  bool fromplaylist;
  int juz;
  List<int> ayasaved = [];

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // advancedPlayer = AudioPlayer();

    Data arg = ModalRoute.of(context).settings.arguments as Data;
    demoData = List.generate(80, (i) {
      return ObjectClass(
        checked: false,
        playlist: false,
      );
    });
    await Provider.of<Quraanprovider>(context, listen: false)
        .fetchayat(arg.number);
    await Provider.of<Quraanprovider>(context, listen: false)
        .fetchayacheak(arg.number);
    for (int i = 0;
        i <
            Provider.of<Quraanprovider>(context, listen: false)
                .ayacheak
                .result
                .length;
        i++) {
      ayasaved.add(Provider.of<Quraanprovider>(context, listen: false)
          .ayacheak
          .result[i]
          .numberOfVerse);
    }
    for (int i = 0; i < ayasaved.length; i++) {
      int b = ayasaved.elementAt(i);

      demoData[b - 1].checked = true;
      print(demoData[0].checked);
    }

    if (!mounted) return;
    setState(() {
      firstrun = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player2 = AudioPlayer();
    player3 = AudioPlayer();
    finsh = false;
    _scrollController = ScrollController();
    playlist = false;
    firstrun = true;
    play = false;
    ayaplayed = false;
    fromplaylist = false;
  }

  void stop() async {
    await player2.stop();
    setState(() {
      ayaplayed = false;
    });
  }

  @override
  void dispose() {
    player2.dispose();
    _scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    print("on will pop");

    Navigator.of(context).pop();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(ayasaved);
    Data arg = ModalRoute.of(context).settings.arguments as Data;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: Theme.of(context).primaryColor,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
                            child: Center(
                              child: Container(
                                  margin: EdgeInsets.all(15),
                                  child: Text(arg.englishName + '-' + arg.name,
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: .5,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ))),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  height: 40,
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  child: Center(
                                      child: Text(
                                    audios.isNotEmpty
                                        ? 'verce ' +
                                            (audios[0]).toString() +
                                            ' - ' +
                                            audios.last.toString()
                                        : 'PLaylist',
                                    style: GoogleFonts.roboto(fontSize: 16),
                                  )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    print(audios);
                        
                                    setState(() {
                                      playlist = !playlist;
                                      ayaplayed = true;
                                      play = true;
                                      fromplaylist = true;
                                    });
                                    for (int i = audios.first - 1;
                                        i < audios.last;
                                        i++) {
                                      audioss.add(Provider.of<Quraanprovider>(
                                              context,
                                              listen: false)
                                          .ayah
                                          .data
                                          .verses[i]
                                          .audio
                                          .primary);
                                    }
                                    audioss = audioss.toSet().toList();
                                    await player2.setAudioSource(
                                      ConcatenatingAudioSource(
                                        children: [
                                          for (var i in audioss)
                                            AudioSource.uri(Uri.parse(i)),
                                        ],
                                      ),
                                      // Playback will be prepared to start from track1.mp3
                                      initialIndex: 0,
                        
                                     
                        
                                      // default
                                      // Playback will be prepared to start from position zero.
                                      // initialPosition: Duration.zero, // default
                                    );
                        
                                    await player2.play();
                                    // audioss.clear();
                        
                                    setState(() {
                                      playlist = false;
                                    });
                                  },
                                  child: Icon(
                                    playlist
                                        ? FontAwesomeIcons.pauseCircle
                                        : FontAwesomeIcons.playCircle,
                                    color: audios.isEmpty
                                        ? Colors.white
                                        : Colors.yellow,
                                    size: 45,
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  color: Theme.of(context).primaryColor,
                                  child: Sourarecord()),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: play
                        ? EdgeInsets.only(bottom: 160)
                        : EdgeInsets.only(bottom: 0),
                    color: Colors.white,
                    child: firstrun
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            controller: _scrollController,
                            itemCount: Provider.of<Quraanprovider>(context,
                                    listen: false)
                                .ayah
                                .data
                                .verses
                                .length,
                            itemBuilder: (context, index) {
                              Soura.souranum = arg.number.toString();
                              Soura.souraname = arg.name.toString();
                              if (arg.number > 77 && arg.number < 114) {
                                juz = 30;
                              }
                              if (arg.number > 66 && arg.number < 77) {
                                juz = 29;
                              }
                              if (arg.number > 57 && arg.number < 66) {
                                juz = 28;
                              }
                              Soura.juznum = juz.toString();

                              return Center(
                                  child: GestureDetector(
                                onDoubleTap: () async {
                                  setState(() {
                                    demoData[index].textcolor1 =
                                        Theme.of(context).primaryColor;
                                    for (int j = 0; j < index; j++) {
                                      demoData[j].textcolor1 = Colors.black;
                                    }
                                    ayaplayed = true;
                                    play = true;
                                    audios.clear();
                                  });
                                  await player2.setUrl(
                                      Provider.of<Quraanprovider>(context,
                                              listen: false)
                                          .ayah
                                          .data
                                          .verses[index]
                                          .audio
                                          .primary);
                                  await player2.play();
                                },
                                onTap: () async {
                                  setState(() {
                                    play = false;
                                    player2.stop();
                                    demoData[index].textcolor1 = Colors.black;
                                  });
                                },
                                child: Container(
                                margin: EdgeInsets.only(bottom: play?22:1,left: 5,right: 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            flex: 8,
                                            child: Container(
                                            
                                                constraints: BoxConstraints(
                                                    maxHeight: double.infinity,
                                                    maxWidth: double.infinity),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                       margin: EdgeInsets.only(top: 10),
                                                      child: Text(
                                                        Provider.of<Quraanprovider>(
                                                                context,
                                                                listen: false)
                                                            .ayah
                                                            .data
                                                            .verses[index]
                                                            .text
                                                            .arab,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.amiri(
                                                          textStyle: TextStyle(
                                                              color: demoData[
                                                                      index]
                                                                  .textcolor1,
                                                              letterSpacing: .5,
                                                              fontSize: 22),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
        
                                                      child: Text(
                                                        Provider.of<Quraanprovider>(
                                                                context,
                                                                listen: false)
                                                            .ayah
                                                            .data
                                                            .verses[index]
                                                            .text
                                                            .transliteration
                                                            .en,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.amiri(
                                                          textStyle: TextStyle(
                                                              color: demoData[
                                                                      index]
                                                                  .textcolor1,
                                                              letterSpacing: .5,
                                                              fontSize: 22),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                    
                                                      child: Text(
                                                        Provider.of<Quraanprovider>(
                                                                context,
                                                                listen: false)
                                                            .ayah
                                                            .data
                                                            .verses[index]
                                                            .translation
                                                            .en,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.amiri(
                                                          textStyle: TextStyle(
                                                              color: demoData[
                                                                      index]
                                                                  .textcolor1,
                                                              letterSpacing: .5,
                                                              fontSize: 22),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    demoData[index].playlist =
                                                        !demoData[index]
                                                            .playlist;
                                                  });
                                                  if (demoData[index]
                                                      .playlist) {
                                                    audios.add((1 + index));
                                                    audios.sort();
                                                  } else {
                                                    // audios.remove((1 + index));
                                                    if (audios.first ==
                                                        audios.last) {
                                                      audios.clear();
                                                    }

                                                    if (1 + index ==
                                                        audios.last) {
                                                      audios
                                                          .add(audios.last - 1);
                                                      audios
                                                          .remove((1 + index));
                                                      audios.sort();
                                                    }
                                                    if (1 + index ==
                                                        audios.first) {
                                                      audios.add(
                                                          audios.first + 1);
                                                      audios
                                                          .remove((1 + index));
                                                      audios.sort();
                                                    }
                                                  }

                                                  for (int i = audios[0];
                                                      i < audios.last - 1;
                                                      i++) {
                                                    demoData[i].playlist = true;
                                                  }

                                                  print(audios);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: demoData[index]
                                                                  .playlist &&
                                                              audios.isNotEmpty
                                                          ? Colors.grey
                                                          : Theme.of(context)
                                                              .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Stack(
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/hexa.png',
                                                        width: 30,
                                                        height: 30,
                                                      ),
                                                      Positioned(
                                                        bottom: 5,
                                                        left: 0,
                                                        right: 0,
                                                        top: 5,
                                                        child: Container(
                                                          child: FittedBox(
                                                            child: Text(
                                                              (1 + index)
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Checkbox(
                                                  value:
                                                      demoData[index].checked,
                                                  // demoData[index].checked,
                                                  splashRadius: 2,
                                                  hoverColor: Colors.blueAccent,
                                                  activeColor: Theme.of(context)
                                                      .primaryColor,
                                                  onChanged:
                                                      (bool newValue) async {
                                                    setState(() {
                                                      demoData[index].checked =
                                                          newValue;
                                                    });
                                                    print(demoData[index]
                                                        .checked);
                                                    !demoData[index].checked
                                                        ? await Dbhandler
                                                            .instance
                                                            .ayasave(
                                                                arg.number
                                                                    .toString(),
                                                                (index + 1)
                                                                    .toString(),
                                                                arg.name,
                                                                juz.toString(),
                                                                'no')
                                                        : await Dbhandler
                                                            .instance
                                                            .ayasave(
                                                                arg.number
                                                                    .toString(),
                                                                (index + 1)
                                                                    .toString(),
                                                                arg.name,
                                                                juz.toString(),
                                                                'read');
                                                  }),
                                            ],
                                          ),
                                        ],
                                      ),
                                      MyAppp(
                                        index: (index + 1).toString(),
                                      ),
                                      Divider(
                                        height: 1,
                                        color: Colors.grey[300],
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                            }),
                  )),
                ],
              ),
              play
                  ? Positioned(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      bottom: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(15),
                                  child: Text(
                                    arg.number.toString() +
                                        ' - ' +
                                        arg.englishName +
                                        ' - ' +
                                        arg.name,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: .5,
                                          fontSize: 16),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            StreamBuilder<Duration>(
                                stream: player2.durationStream,
                                builder: (context, snapshot) {
                                  final duration =
                                      snapshot.data ?? Duration.zero;
                                  return StreamBuilder<PositionData>(
                                    stream: Rx.combineLatest2<Duration,
                                            Duration, PositionData>(
                                        player2.positionStream,
                                        player2.bufferedPositionStream,
                                        (position, bufferedPosition) =>
                                            PositionData(
                                                position, bufferedPosition)),
                                    builder: (context, snapshot) {
                                      final positionData = snapshot.data ??
                                          PositionData(
                                              Duration.zero, Duration.zero);
                                      var position = positionData.position;
                                      if (position > duration) {
                                        position = duration;
                                      }
                                      var bufferedPosition =
                                          positionData.bufferedPosition;
                                      if (bufferedPosition > duration) {
                                        bufferedPosition = duration;
                                      }
                                      return ProgressBar(
                                          thumbRadius: 12,
                                          progressBarColor:
                                              Theme.of(context).primaryColor,
                                          thumbColor:
                                              Theme.of(context).accentColor,
                                          progress: position,
                                          buffered: bufferedPosition,
                                          total: duration,
                                          onSeek: (duration) {
                                            player2.seek(duration);
                                          });
                                    },
                                  );
                                }),
                            ControlButtons(player2),
                          ],
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

class ObjectClass {
  bool checked;
  Color textcolor1 = Colors.black;
  bool playlist;
  ObjectClass({
    this.checked,
    this.textcolor1,
    this.playlist,
  });
}

class PositionData {
  Duration position;
  Duration bufferedPosition;

  PositionData(this.position, this.bufferedPosition);
}
