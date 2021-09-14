import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/lanprovider.dart';
import 'package:kidsapp/screens/login.dart';
import 'package:provider/provider.dart';

class Cheakloginwidget extends StatelessWidget {
  String text;
  Cheakloginwidget(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Provider.of<Lanprovider>(context, listen: true).isenglish
                ? 'To see ${this.text}'
                : 'حتى تستطيع مشاهدة تقييمك',
            style: GoogleFonts.roboto(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.2),
            height: 40,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor)),
                onPressed: () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Login()));
                },
                child: Text(
                  Provider.of<Lanprovider>(context, listen: true).isenglish
                      ? 'press here Login in'
                      : ' اضغط هنا لتسجيل الدخول',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ),
        ],
      ),
    );
  }
}
