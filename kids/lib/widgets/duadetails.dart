import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Duadetails extends StatelessWidget {
  String title;
  String image;
  String duatitle1;
  String duatitle2;
  Duadetails(this.title, this.image, this.duatitle1, this.duatitle2);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  this.title,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        letterSpacing: .5,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            Container(
                //  width: MediaQuery.of(context).size.width * 0.1,
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Theme.of(context).accentColor)),
                height: 190,
                child: Image.asset(this.image)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                this.duatitle1,
                textDirection: TextDirection.rtl,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: Theme.of(context).accentColor,
                      letterSpacing: .5,
                      fontSize: 14),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 20, right: 20, left: 20),
              child: Text(
                this.duatitle2,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: Theme.of(context).accentColor,
                      letterSpacing: .5,
                      fontSize: 14),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Icon(
                            Icons.play_arrow_sharp,
                            color: Colors.white,
                            size: 45,
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Icon(
                            Icons.pause_outlined,
                            color: Colors.white,
                            size: 45,
                          )),
                    ],
                  ),
            
            
          ],
        ),
      ),
    );
  }
}
