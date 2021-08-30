import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/models/dialyhadith.dart';
import 'package:kidsapp/models/hadithlevel.dart';
import 'package:kidsapp/widgets/record.dart';
import 'package:kidsapp/widgets/gift.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class Dialyhadithbylevle extends StatefulWidget {
  static const String route = '/Dialyhadithbylevle';

  @override
  _DialyhadithState createState() => _DialyhadithState();
}

class _DialyhadithState extends State<Dialyhadithbylevle> {
  bool loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = false;
    
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() {
      print("on will pop");
      AudioRecorder.dialy = false;
      Navigator.of(context).pop();
    }

    Allhadiths  dialyhadith = ModalRoute.of(context).settings.arguments as Allhadiths ;
    final htmlData = """ ${dialyhadith.description}""";
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 10, bottom: 8),
                    child: GestureDetector(
                      onTap: () {
                        _onWillPop();
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
                  Container(
                    width: double.infinity,
                    child: Html(
                      data: htmlData,
                      style: {
                        "div": Style(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.blueAccent),
                      },
                    ),
                  ),
                  MyAppp(
                    url: dialyhadith.audio,
                    hadithid: dialyhadith.id,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.2)
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
                              await Dbhandler.instance.Dialyhadithstatus(
                                  'read', dialyhadith.id.toString());
                              setState(() {
                                loading = false;
                              });
                              if (Dbhandler.instance.dialyhadith == 200)
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
                                            Navigator.of(context).pop();
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
                                Navigator.of(context).pop();
                              }
                            },
                            child: Text(
                              'Done',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
