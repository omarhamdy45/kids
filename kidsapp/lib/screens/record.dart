import 'dart:async';
import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/screens/soura.dart';
import 'package:kidsapp/widgets/Controlsbuttons.dart';
import 'package:kidsapp/widgets/iconplay.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:rxdart/rxdart.dart';

class AudioRecorder extends StatefulWidget {
  final String path;
  final VoidCallback onStop;
  static bool dialy = false;
  final String url;
  const AudioRecorder({this.path, this.onStop, this.url});

  @override
  _AudioRecorderState createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
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
    return Container(
      height: 50,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: 50,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: AudioRecorder.dialy
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: <Widget>[
              _buildRecordStopControl(),
              const SizedBox(width: 20),
              AudioRecorder.dialy ? Iconsplay(this.widget.url) : Container(),
              const SizedBox(width: 20),
              // _buildPauseResumeControl(),

              _buildText(),
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
      icon = Icon(Icons.stop, color: Colors.black, size: 30);
      color = Theme.of(context).primaryColor.withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = Icon(Icons.mic, color: Colors.red, size: 30);
      color = theme.primaryColor.withOpacity(0.1);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(width: 50, height: 50, child: icon),
          onTap: () {
            _isRecording ? _stop() : _start();
          },
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
      style: TextStyle(color: Theme.of(context).primaryColor),
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

class MyAppp extends StatefulWidget {
  static bool dialy;
  final String url;
  final String index;
  final hadithid;
  const MyAppp({this.url, this.index, this.hadithid});

  @override
  _MyApppState createState() => _MyApppState();
}

class _MyApppState extends State<MyAppp> {
  bool showPlayer = false;
  String path;
  AudioPlayer advancedPlayer;
  bool play;
  bool loading;
  @override
  void initState() {
    showPlayer = false;
    advancedPlayer = AudioPlayer();
    play = false;
    loading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String ayanum = this.widget.index;
    String hadithid = this.widget.hadithid;
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
                      mainAxisSize: MainAxisSize.max,
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
                                        width: 50,
                                        height: 50,
                                        child: Icon(
                                          Icons.send,
                                          size: 30,
                                          color: Colors.blue,
                                        )),
                                    onTap: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      print(Soura.souraname);
                                      AudioRecorder.dialy
                                          ? await Dbhandler.instance
                                              .hadithrecord(
                                                  'read',
                                                  hadithid.toString(),
                                                  File(path))
                                          : await Dbhandler.instance.ayarecord(
                                              Soura.souranum,
                                              ayanum,
                                              Soura.souraname,
                                              Soura.juznum,
                                              File(path));

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
                          child: Material(
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.04),
                            child: InkWell(
                              child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.mic,
                                    size: 30,
                                    color: Colors.red,
                                  )),
                              onTap: () {
                                setState(() {
                                  showPlayer = false;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Iconsplay(path),
                      ],
                    );
                  } else {
                    return AudioRecorder(
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
