import 'dart:async';
import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/screens/soura.dart';
import 'package:kidsapp/widgets/Controlsbuttons.dart';
import 'package:kidsapp/widgets/iconplay.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:rxdart/rxdart.dart';

class AudioRecord extends StatefulWidget {
  final String path;
  final VoidCallback onStop;
  static bool dialy = false;
  final String url;
  const AudioRecord({this.path, this.onStop, this.url});

  @override
  _AudioRecordState createState() => _AudioRecordState();
}

class _AudioRecordState extends State<AudioRecord> {
  bool _isRecording = false;
  bool _isPaused = false;
  int _recordDuration = 0;
  Timer _timer;
  AudioPlayer audioPlayer;

  @override
  void initState() {
    _isRecording = false;
    audioPlayer = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(Soura.isrecorded);
    return Container(
      height: 50,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: 50,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: AudioRecord.dialy
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: <Widget>[
              _buildRecordStopControl(),
              //   const SizedBox(width: ),
              Soura.isrecorded
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Iconsplay(this.widget.url),
                    )
                  : Container(),
              const SizedBox(width: 5),
              // _buildPauseResumeControl(),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: _buildText(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecordStopControl() {
    Icon icon;
    Color color;

    if (_isRecording || _isPaused) {
      icon = Icon(Icons.stop, color: Colors.white, size: 30);
      color = Theme.of(context).primaryColor.withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = Icon(Icons.mic, color: Colors.white, size: 30);
      color = theme.primaryColor.withOpacity(0.1);
    }

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        child: ClipOval(
          child: Material(
            color: color,
            child: InkWell(
              child: SizedBox(width: 56, height: 56, child: icon),
              onTap: () {
                _isRecording ? _stop() : _start();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    if (_isRecording || _isPaused) {
      return _buildTimer();
    }

    return Container();
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(_recordDuration ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);

    return Text(
      '$minutes : $seconds',
      style: TextStyle(color: Colors.white),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0' + numberStr;
    }

    return numberStr;
  }

  Future<void> _start() async {
    try {
      if (await Record.hasPermission()) {
        await Record.start(path: widget.path);

        bool isRecording = await Record.isRecording();
        setState(() {
          _isRecording = isRecording;
          _recordDuration = 0;
        });

        _startTimer();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stop() async {
    _timer?.cancel();
    await Record.stop();

    setState(() => _isRecording = false);

    widget.onStop();
  }

  void _startTimer() {
    const tick = const Duration(seconds: 1);

    _timer?.cancel();

    _timer = Timer.periodic(tick, (Timer t) {
      setState(() => _recordDuration++);
    });
  }
}

class Sourarecord extends StatefulWidget {
  // static bool dialy;
  final String url;
  final int juzid;
  final int souraid;

  const Sourarecord({
    this.url,
    this.juzid,
    this.souraid,
  });

  @override
  _SourarecordState createState() => _SourarecordState();
}

class _SourarecordState extends State<Sourarecord> {
  bool showPlayer = false;
  String path;
  AudioPlayer advancedPlayer;
  bool play;
  bool loading;
  bool loading1;
  bool loading2;
  @override
  void initState() {
    showPlayer = false;
    advancedPlayer = AudioPlayer();
    play = false;
    loading = false;
    loading1 = false;
    loading2 = false;
    super.initState();
  }

  @override
  void dispose() {
    advancedPlayer.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future<bool> _onWillPopup() async {
    print('ss');
    // AudioRecorder.dialy = false;
    //  Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            height: 60,
            child: FutureBuilder<String>(
              future: getPath(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (showPlayer) {
                    return Row(
                      //    mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        loading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ClipOval(
                                child: Material(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.04),
                                  child: InkWell(
                                    child: SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: Icon(
                                          Icons.send,
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                    onTap: () async {
                                      Soura.isrecorded
                                          ? showDialog(
                                              //  barrierDismissible: false, //
                                              context: context,
                                              builder: (_) {
                                                return WillPopScope(
                                                    onWillPop: _onWillPopup,
                                                    child: AlertDialog(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        content: Container(
                                                          height: 200,
                                                          child: Column(
                                                              children: [
                                                                loading1
                                                                    ? Center(
                                                                        child:
                                                                            CircularProgressIndicator(),
                                                                      )
                                                                    : Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                15),
                                                                        width:
                                                                            220,
                                                                        height:
                                                                            45,
                                                                        child:
                                                                            ElevatedButton(
                                                                          style:
                                                                              ButtonStyle(
                                                                            backgroundColor:
                                                                                MaterialStateProperty.all(
                                                                              Color.fromRGBO(34, 196, 228, 1),
                                                                            ),
                                                                            shape:
                                                                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                            ),
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            await Dbhandler.instance.sourarecrod(
                                                                                File(path),
                                                                                this.widget.juzid,
                                                                                this.widget.souraid,
                                                                                'yes');

                                                                            Navigator.of(context).pop();
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Update The Last Record',
                                                                            style:
                                                                                TextStyle(fontSize: 15),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                loading2
                                                                    ? Center(
                                                                        child:
                                                                            CircularProgressIndicator(),
                                                                      )
                                                                    : Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                15),
                                                                        width:
                                                                            220,
                                                                        height:
                                                                            45,
                                                                        child:
                                                                            ElevatedButton(
                                                                          style:
                                                                              ButtonStyle(
                                                                            backgroundColor:
                                                                                MaterialStateProperty.all(
                                                                              Color.fromRGBO(34, 196, 228, 1),
                                                                            ),
                                                                            shape:
                                                                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                            ),
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            await Dbhandler.instance.sourarecrod(
                                                                                File(path),
                                                                                this.widget.juzid,
                                                                                this.widget.souraid,
                                                                                'no');

                                                                            Navigator.of(context).pop();
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Add new Record',
                                                                            style:
                                                                                TextStyle(fontSize: 15),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              15),
                                                                  width: 220,
                                                                  height: 45,
                                                                  child:
                                                                      ElevatedButton(
                                                                    style:
                                                                        ButtonStyle(
                                                                      backgroundColor:
                                                                          MaterialStateProperty
                                                                              .all(
                                                                        Color.fromRGBO(
                                                                            34,
                                                                            196,
                                                                            228,
                                                                            1),
                                                                      ),
                                                                      shape: MaterialStateProperty
                                                                          .all<
                                                                              RoundedRectangleBorder>(
                                                                        RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10)),
                                                                      ),
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: Text(
                                                                      'Cancel',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]),
                                                        )));
                                              })
                                          : await Dbhandler.instance
                                              .sourarecrod(
                                                  File(path),
                                                  this.widget.juzid,
                                                  this.widget.souraid,
                                                  'no');

                                      Soura.isrecorded = true;
                                      setState(() {
                                        loading = false;
                                      });
                                    },
                                  ),
                                ),
                              ),
                        SizedBox(
                          width: 10,
                        ),
                        ClipOval(
                          child: InkWell(
                            child: SizedBox(
                                child: Icon(
                              Icons.mic,
                              size: 30,
                              color: Colors.white,
                            )),
                            onTap: () {
                              setState(() {
                                showPlayer = false;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Iconsplay(path),
                      ],
                    );
                  } else {
                    return AudioRecord(
                      path: snapshot.data,
                      url: this.widget.url,
                      onStop: () {
                        setState(() => showPlayer = true);
                      },
                    );
                  }
                } else {
                  return Center();
                }
              },
            )),
      ),
    );
  }

  Future<String> getPath() async {
    if (path == null) {
      final dir = await getApplicationDocumentsDirectory();
      path = dir.path +
          '/' +
          DateTime.now().millisecondsSinceEpoch.toString() +
          '.m4a';
    }
    return path;
  }
}
