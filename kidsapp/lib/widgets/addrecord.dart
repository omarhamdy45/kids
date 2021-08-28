import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/screens/soura.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ADdredcord extends StatefulWidget {
  int juzid;
  int souraid;
  String path;
  ADdredcord(this.juzid, this.souraid, this.path);
  @override
  _ADdredcordState createState() => _ADdredcordState();
}

class _ADdredcordState extends State<ADdredcord> {
  bool loading1;
  bool loading2;
  @override
  void initState() {
    loading1 = false;
    loading2 = false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(children: [
        loading1
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: EdgeInsets.only(top: 15),
                width: 220,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(34, 196, 228, 1),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      loading1 = true;
                    });
                    await Dbhandler.instance.sourarecrod(File(this.widget.path),
                        this.widget.juzid, this.widget.souraid, 'yes');
                    if (Dbhandler.instance.sourarecord == 200) {
                      return Alert(
                        context: context,
                        type: AlertType.success,
                        title: 'Sent Successfully Well Done!',
                        closeFunction: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Done",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              setState(() {
                                loading1 = false;
                              });
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            color: Color.fromRGBO(0, 179, 134, 1.0),
                            radius: BorderRadius.circular(0.0),
                          ),
                        ],
                      ).show();
                    } else {
                      setState(() {
                        loading1 = false;
                      });

                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    'Update The Last Record',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
        loading2
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                margin: EdgeInsets.only(top: 15),
                width: 220,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(34, 196, 228, 1),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      loading2 = true;
                    });
                    await Dbhandler.instance.sourarecrod(File(this.widget.path),
                        this.widget.juzid, this.widget.souraid, 'no');
                    print(Dbhandler.instance.sourarecord);
                    if (Dbhandler.instance.sourarecord == 200) {
                      return Alert(
                        context: context,
                        type: AlertType.success,
                        title: 'Sent Successfully Well Done!',
                        closeFunction: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Done",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Soura.isrecorded = true;
                              setState(() {
                                loading2 = false;
                              });
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            color: Color.fromRGBO(0, 179, 134, 1.0),
                            radius: BorderRadius.circular(0.0),
                          ),
                        ],
                      ).show();
                    } else {
                      setState(() {
                        loading2 = false;
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    'Add new Record',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
        loading1 || loading1
            ? Container()
            : Container(
                margin: EdgeInsets.only(top: 15),
                width: 220,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(34, 196, 228, 1),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
      ]),
    );
  }
}
