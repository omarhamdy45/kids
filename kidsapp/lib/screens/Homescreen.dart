import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/providers/userprovider.dart';
import 'package:kidsapp/screens/salah.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.blue,
      Colors.amber,
      Colors.amber[800],
      Colors.grey,
      Colors.black
    ];
    List<String> prayerstimes = [
      Provider.of<Athanprovider>(context).time.data.timings.fajr,
      Provider.of<Athanprovider>(context).time.data.timings.dhuhr,
      Provider.of<Athanprovider>(context).time.data.timings.asr,
      Provider.of<Athanprovider>(context).time.data.timings.maghrib,
      Provider.of<Athanprovider>(context).time.data.timings.isha
    ];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text(
                'wlecome ' +
                    Provider.of<Userprovider>(context, listen: false)
                        .currentUser
                        .name +
                    ' !',
                style: GoogleFonts.lato(fontSize: 20),
              ),
              Text(
                  'May the blessings of Allah fill your day with peace,happiness and success. ',
                  style: GoogleFonts.lato(fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: 200,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        height: 35,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.timeline),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Today Prayer Times',
                              style: GoogleFonts.lato(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 165,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (
                            context,
                            index,
                          ) {
                            return (Container(
                              color: colors[index],
                              width:
                                  (MediaQuery.of(context).size.width - 20) / 5,
                              height: 165,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'fajr',
                                      style:
                                          GoogleFonts.lato(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      prayerstimes[index],
                                      style:
                                          GoogleFonts.lato(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  constraints: BoxConstraints(maxHeight: double.infinity),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quran - Lastsaved',
                          style: GoogleFonts.lato(fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        
                        Text(
                          Provider.of<Userprovider>(context, listen: false)
                              .homedata
                              .lastQuran
                              .surah,
                          style: GoogleFonts.lato(fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Saved ' +
                              Provider.of<Userprovider>(context, listen: false)
                                  .homedata
                                  .countQuran
                                  .toString() +
                              ' verses today',
                          style: GoogleFonts.lato(fontSize: 16),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  constraints: BoxConstraints(maxHeight: double.infinity),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Athkar - Lastplayed',
                          style: GoogleFonts.lato(fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          Provider.of<Userprovider>(context, listen: false)
                              .homedata
                              .lastAzkar
                              .category
                              .title,
                          style: GoogleFonts.lato(fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Completed ' +
                              Provider.of<Userprovider>(context, listen: false)
                                  .homedata
                                  .countAzkar
                                  .toString() +
                              ' azkar today',
                          style: GoogleFonts.lato(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 200,
                            child: Image.network(
                                'https://muslimkids.royaltechni.com/public/assets/images/categories/-1623509021.png')),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  constraints: BoxConstraints(maxHeight: double.infinity),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'hadith - Lastplayed',
                          style: GoogleFonts.lato(fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          Provider.of<Userprovider>(context, listen: false)
                              .homedata
                              .lastHadith
                              .hadith
                              .title,
                          style: GoogleFonts.lato(fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Completed ' +
                              Provider.of<Userprovider>(context, listen: false)
                                  .homedata
                                  .countHadith
                                  .toString() +
                              ' hadith today',
                          style: GoogleFonts.lato(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
