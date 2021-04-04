import 'package:flutter/material.dart';
import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/providers/azkarprovider.dart';
import 'package:kidsapp/providers/hadithprovider.dart';
import 'package:kidsapp/providers/userprovider.dart';
import 'package:kidsapp/screens/login.dart';
import 'package:kidsapp/screens/ramdanscreen.dart';
import 'package:kidsapp/screens/salah.dart';
import 'package:kidsapp/widgets/duadetails.dart';


import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Athanprovider(),
    ),
    ChangeNotifierProvider(
      create: (context) => Userprovider(),
    ),
    ChangeNotifierProvider(
      create: (context) => Azkarprovider(),
    ),
     ChangeNotifierProvider(
      create: (context) => Hadithprovider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(62, 194, 236, 1),
        accentColor: Color.fromRGBO(167, 85, 163, 1),
      ),
      home: Login(),
       routes: {
        Salah.route: (context) => Salah(),
        Ramdan.route: (context) => Ramdan(),
        Duadetails.route:(context) => Duadetails(),
       }
    );
  }
}
