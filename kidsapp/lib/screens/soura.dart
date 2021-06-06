//import 'package:audioplayers/audioplayers.dart';
import 'dart:ffi';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kidsapp/models/PageManger.dart';
import 'package:kidsapp/models/ayah.dart';
import 'package:kidsapp/models/sour.dart';
import 'package:kidsapp/providers/quraanprovider.dart';

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
  List<String> audios = [];

  List<ObjectClass> demoData;
  // AudioPlayer advancedPlayer;
  AudioPlayer player2;
  bool play;
  Color textcolor1 = Colors.black;
  Color textcolor2 = Colors.blue[600];
  Verses played;
  bool ayaplayed;
  List<double> speed = [1, 0.5, 1.5];
  int i = 0;

  PageManager _pageManager;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // advancedPlayer = AudioPlayer();

    Data arg = ModalRoute.of(context).settings.arguments as Data;
    demoData = List.generate(80, (i) {
      return ObjectClass(
        checked: false,
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
    _pageManager = PageManager();
    firstrun = true;
    play = false;
    ayaplayed = false;
  }

  @override
  void dispose() {
    player2.dispose();
    _pageManager.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(audios);
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
                              height: 52,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Center(
                                  child: Text(
                                'PLaylist',
                                style: GoogleFonts.roboto(fontSize: 20),
                              )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                onTap: () async {
                                  /*
                                  print(audios.length);
                                  setState(() {
                                    play = !play;
                                  });

                                  for (int i = 0; i < audios.length; ++i) {
                                    final audio = audios[i];
                                    await player2.setUrl(audio);
                                    print(audio);
                                    play
                                        ? await player2.play()
                                        : await player2.pause();
                                    play
                                        ? await player2.pause()
                                        : await player2.stop();
                                  }
                                  setState(() {
                                    play = false;
                                  });
                                  */
                                },
                                child: Icon(
                                  FontAwesomeIcons.playCircle,
                                  color: Colors.white,
                                  size: 45,
                                ))
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

                                  setState(() {
                                    played = Provider.of<Quraanprovider>(
                                            context,
                                            listen: false)
                                        .ayah
                                        .data
                                        .verses[index];
                                  });
                                },
                                onTap: () async {
                                  setState(() {
                                    play = false;
                                    player2.stop();
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
                                                  style: GoogleFonts.roboto(
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
                                              CircleAvatar(
                                                radius: 16,
                                                backgroundColor: Colors.black,
                                                child: CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .primaryColor,
                                                  child: Text(
                                                    (1 + index).toString(),
                                                    style: TextStyle(
                                                        color: Colors.white),
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
                                final duration = snapshot.data ?? Duration.zero;
                                return StreamBuilder<PositionData>(
                                  stream: Rx.combineLatest2<Duration, Duration,
                                          PositionData>(
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

                                      position = Duration.zero;
                                      player2.stop();
                                    }

                                    ayaplayed = false;

                                    var bufferedPosition =
                                        positionData.bufferedPosition;
                                    if (bufferedPosition > duration) {
                                      bufferedPosition = duration;
                                    }

                                    return ProgressBar(
                                      thumbRadius: 12,
                                      progressBarColor:
                                          Theme.of(context).primaryColor,
                                      thumbColor: Theme.of(context).accentColor,
                                      progress: position,
                                      buffered: bufferedPosition,
                                      total: duration,
                                      onSeek: (duration) {
                                        player2.seek(duration);
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    // color: Colors.white,
                                    onPressed: () async {
                                      await player2.seek(Duration(seconds: 3));
                                    },
                                    icon: Icon(Icons.timer_3_select,
                                        color: Colors.black)),
                                GestureDetector(
                                  onTap: () async {
                                    // print(player2.duration);

                                    setState(() {
                                      ayaplayed = !ayaplayed;
                                    });

                                    ayaplayed
                                        ? await player2.play()
                                        : await player2.pause();
                                  },
                                  child: ayaplayed
                                      ? Icon(
                                          FontAwesomeIcons.pauseCircle,
                                          color: Colors.black,
                                          size: 45,
                                        )
                                      : Icon(
                                          FontAwesomeIcons.playCircle,
                                          color: Colors.black,
                                          size: 45,
                                        ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await player2.stop();
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.stopCircle,
                                    color: Colors.black,
                                    size: 45,
                                  ),
                                ),
                                StreamBuilder<LoopMode>(
                                  stream: player2.loopModeStream,
                                  builder: (context, snapshot) {
                                    final loopMode =
                                        snapshot.data ?? LoopMode.off;
                                    const icons = [
                                      Icon(
                                        Icons.repeat,
                                        color: Colors.black,
                                        size: 40,
                                      ),
                                      Icon(Icons.repeat,
                                          color:
                                              Color.fromRGBO(184, 95, 143, 1),
                                          size: 40),
                                    ];
                                    const cycleModes = [
                                      LoopMode.off,
                                      LoopMode.all,
                                    ];
                                    final index = cycleModes.indexOf(loopMode);
                                    return IconButton(
                                      icon: icons[index],
                                      onPressed: () {
                                        player2.setLoopMode(cycleModes[
                                            (cycleModes.indexOf(loopMode) + 1) %
                                                cycleModes.length]);
                                      },
                                    );
                                  },
                                ),
                                GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        i < 2 ? ++i : i = 0;
                                      });
                                      await player2.setSpeed(speed[i]);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      child: Container(
                                        margin: EdgeInsets.all(2),
                                        color: Colors.transparent,
                                        child: Text(
                                          speed[i].toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
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
  ObjectClass({
    this.checked,
    this.textcolor1,
  });
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;

  PositionData(this.position, this.bufferedPosition);
}
