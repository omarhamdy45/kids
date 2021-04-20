import 'package:flutter/material.dart';

import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/providers/azkarprovider.dart';
import 'package:kidsapp/providers/deedprovider.dart';
import 'package:kidsapp/providers/duaaprovider.dart';
import 'package:kidsapp/providers/hadithprovider.dart';
import 'package:kidsapp/providers/lanprovider.dart';
import 'package:kidsapp/providers/userprovider.dart';
import 'package:kidsapp/screens/azkar.dart';
import 'package:kidsapp/screens/duaas.dart';
import 'package:kidsapp/screens/login.dart';
import 'package:kidsapp/screens/splash.dart';
import 'package:kidsapp/screens/ramdanscreen.dart';
import 'package:kidsapp/screens/salah.dart';
import 'package:kidsapp/screens/types.dart';
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
    ChangeNotifierProvider(
      create: (context) => Duaaprovider(),
    ),
    ChangeNotifierProvider(
      create: (context) => Deedprovider(),
    ),
    ChangeNotifierProvider(
      create: (context) => Lanprovider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Islamiccity',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(62, 194, 236, 1),
          accentColor: Color.fromRGBO(167, 85, 163, 1),
        ),
        home: FutureBuilder(
          future:
              Provider.of<Userprovider>(context, listen: false).isLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Splash();
            } else if (snapshot.data == true) {
              return Splash();
            } else {
              return Login();
            }
          },
        ),
        routes: {
          Login.route: (context) => Login(),
          Salah.route: (context) => Salah(),
          Ramdan.route: (context) => Ramdan(),
          Duadetails.route: (context) => Duadetails(),
          Duaas.route: (context) => Duaas(),
          Azkar.route: (context) => Azkar(),
          Types.route: (context) => Types(),
        });
  }
}
