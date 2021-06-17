//import 'package:audioplayers/audioplayers.dart';

import 'dart:math';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import 'package:kidsapp/models/ayah.dart';
import 'package:kidsapp/models/sour.dart';
import 'package:kidsapp/providers/quraanprovider.dart';
import 'package:kidsapp/widgets/Controlsbuttons.dart';

import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class Soura extends StatefulWidget {
  static const String route = '/Soura';
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

  @override
  Widget build(BuildContext context) {
    Data arg = ModalRoute.of(context).settings.arguments as Data;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
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
                        Row(
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

                                  preload: true,

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
                          ],
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
                            controller: _scrollController,
                            itemCount: Provider.of<Quraanprovider>(context,
                                    listen: false)
                                .ayah
                                .data
                                .verses
                                .length,
                            itemBuilder: (context, index) {
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
                                  margin: EdgeInsets.all(8),
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
                                              child: Container(
                                                margin: EdgeInsets.all(10),
                                                child: Text(
                                                  Provider.of<Quraanprovider>(
                                                          context,
                                                          listen: false)
                                                      .ayah
                                                      .data
                                                      .verses[index]
                                                      .text
                                                      .arab,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  style: GoogleFonts.amiri(
                                                    textStyle: TextStyle(
                                                        color: demoData[index]
                                                            .textcolor1,
                                                        letterSpacing: .5,
                                                        fontSize: 22),
                                                  ),
                                                ),
                                              ),
                                            ),
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
                                                  splashRadius: 10,
                                                  hoverColor: Colors.blueAccent,
                                                  activeColor: Theme.of(context)
                                                      .primaryColor,
                                                  onChanged: (bool newValue) {
                                                    setState(() {
                                                      demoData[index].checked =
                                                          newValue;
                                                    });
                                                  }),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        height: 1,
                                        color: Colors.grey[300],
                                      ),
                                      SizedBox(
                                        height: 10,
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
                                  /*
                                    final positionData = snapshot.data ??
                                        PositionData(
                                            Duration.zero, Duration.zero);
                                    var position = positionData.position;
                                    if (position > duration) {
                                      position = duration;
                                      // position = Duration.zero;
                                      stop();
                                    }

                                    var bufferedPosition =
                                        positionData.bufferedPosition;
                                    if (bufferedPosition > duration) {
                                      bufferedPosition = duration;
                                    }
                                    */
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
