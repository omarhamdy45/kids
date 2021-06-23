import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/hadithprovider.dart';
import 'package:kidsapp/screens/dialyhadith.dart';
import 'package:kidsapp/screens/record.dart';
import 'package:kidsapp/widgets/navigation.dart';
import 'package:provider/provider.dart';

class Hadithsection extends StatefulWidget {
  @override
  _HadithsectionState createState() => _HadithsectionState();
}

class _HadithsectionState extends State<Hadithsection> {
  bool firstrun;
  @override
  void initState() {
    firstrun = true;
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await Provider.of<Hadithprovider>(context, listen: false)
        .fetchdailyhadith();
    setState(() {
      firstrun = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: firstrun
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: Provider.of<Hadithprovider>(context, listen: false)
                    .dailyhadith
                    .data
                    .length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      final dialyhadith =
                          Provider.of<Hadithprovider>(context, listen: false)
                              .dailyhadith
                              .data[index];
                      AudioRecorder.dialy = true;
                      Navigator.push(
                        // or pushReplacement, if you need that
                        context,
                        FadeInRoute(
                            routeName: Dialyhadith.route,
                            page: Dialyhadith(),
                            argument: dialyhadith),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 7).add(
                          EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.01)),
                      height: 130,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Theme.of(context).primaryColor,
                        child: Container(
                          margin: EdgeInsets.only(left: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Hadith ${index + 1}',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: .5,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Text(
                                      Provider.of<Hadithprovider>(context,
                                              listen: false)
                                          .dailyhadith
                                          .data[index]
                                          .title,
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: .5,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Row(
                                  children: [
                                    VerticalDivider(
                                      width: 2,
                                      endIndent: 10,
                                      indent: 10,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.grey[100],
                                          child: CircleAvatar(
                                              radius: 19,
                                              backgroundColor: Theme.of(context)
                                                  .primaryColor,
                                              child: Icon(
                                                Icons.check_sharp,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
