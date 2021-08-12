import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kidsapp/providers/userprovider.dart';
import 'package:provider/provider.dart';

class Topcard extends StatelessWidget {
  String name;
  int listlength;
  String score;
  int index;
  Topcard(this.name, this.listlength, this.score);
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.blue,
      Colors.amber,
      Colors.amber[800],
      Colors.grey,
      Colors.black
    ];
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 60 *
            Provider.of<Userprovider>(context, listen: false)
                .topstudents
                .azkar
                .length
                .toDouble(),
        child: ListView.builder(
            itemCount: Provider.of<Userprovider>(context, listen: false)
                      .topstudents
                      .quran
                      .length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: Row(
                      children: [
                        if (index == 0)
                          Icon(
                            FontAwesomeIcons.medal,
                            color: Colors.amber[600],
                          ),
                        if (index == 1)
                          Icon(
                            FontAwesomeIcons.medal,
                            color: Colors.grey[600],
                          ),
                        if (index == 2)
                          Icon(
                            FontAwesomeIcons.medal,
                            color: Colors.brown,
                          ),
                        if (index == 4 || index == 3)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text((index + 1).toString()),
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: colors[index],
                          child: Text(
                            Provider.of<Userprovider>(context, listen: false)
                      .topstudents
                      .quran[index]
                      .quran,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          Provider.of<Userprovider>(context, listen: false)
                      .topstudents
                      .quran[index]
                      .name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                             Provider.of<Userprovider>(context, listen: false)
                      .topstudents
                      .quran[index]
                      .quran,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}
