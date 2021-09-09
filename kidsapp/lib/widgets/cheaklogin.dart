import 'package:flutter/material.dart';
import 'package:kidsapp/providers/lanprovider.dart';
import 'package:kidsapp/screens/login.dart';
import 'package:provider/provider.dart';

class Cheaklogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      child: Column(
        children: [
          Text(
            'You need to Login',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: 200,
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
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 200,
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
                  Navigator.of(context).pop();
                },
                child: Text(
                  Provider.of<Lanprovider>(context, listen: true).isenglish
                      ? 'continue '
                      : ' ابق هنا',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          )
        ],
      ),
    );
  }
}
