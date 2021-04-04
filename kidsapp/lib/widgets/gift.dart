import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class Gift extends StatelessWidget {
  String image;
  String title;
  Color color1;
  Color color2;
  Color color3;
  Color color4;
  Color color5;

  Gift(this.title, this.image, this.color1, this.color2, this.color3,
      this.color4, this.color5);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        // margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(this.image),
            Text(
              this.title,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Color.fromRGBO(255, 72, 115, 1),
                    letterSpacing: .5,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.18),
              child: Text(
                'congratulates on your promtion and 3 badges ',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(153, 153, 153, 1),
                      letterSpacing: .5,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: this.color1,
                  size: 35,
                ),
                Icon(
                  Icons.star,
                  color: this.color2,
                  size: 35,
                ),
                Icon(
                  Icons.star,
                  color: this.color3,
                  size: 35,
                ),
                Icon(
                  Icons.star,
                  color: this.color4,
                  size: 35,
                ),
                Icon(
                  Icons.star,
                  color: this.color5,
                  size: 35,
                ),
              ],
            )
          ],
        ));
  }
}
