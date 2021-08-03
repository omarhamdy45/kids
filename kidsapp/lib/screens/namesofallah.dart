import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/screens/record.dart';
import 'package:kidsapp/widgets/sourarecord.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class Namesofallah extends StatefulWidget {
  @override
  _NamesofallahState createState() => _NamesofallahState();
}

class _NamesofallahState extends State<Namesofallah> {
  List<ObjectClass> demoData;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    demoData = List.generate(99, (i) {
      return ObjectClass(
        checked: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
          0.05,
          0.4,
          0.9
        ], colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColor.withOpacity(0.6),
          Colors.blue[700]
        ])),
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(bottom: 20, top: 15, left: 15),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      constraints: BoxConstraints(maxWidth: double.infinity),
                      height: 40,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            'Record The 99 Names of Allah ',
                            style: GoogleFonts.roboto(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: Icon(
                        FontAwesomeIcons.playCircle,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                     Container(
                                    width: 200,
                                   
                                    child: Sourarecord()),
                    
                 
                  ],
                ),
              ),
            ),
            Container(
              child: StaggeredGridView.countBuilder(
                shrinkWrap: true,
                crossAxisCount: 2,
                itemCount: 6,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        border: Border.all(
                            width: 4, color: Theme.of(context).primaryColor)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Stack(
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
                                          (1 + index).toString(),
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              Checkbox(
                                  value: demoData[index].checked,
                                  // demoData[index].checked,
                                  splashRadius: 2,
                                  hoverColor: Colors.blueAccent,
                                  activeColor: Theme.of(context).primaryColor,
                                  onChanged: (bool newValue) async {
                                    setState(() {
                                      demoData[index].checked = newValue;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Text(
                          'الرحمن',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Al-rahman',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'The most merciful, ever merciful ,most clemnt',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ObjectClass {
  bool checked;
  ObjectClass({
    this.checked,
  });
}
