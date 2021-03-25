import 'package:flutter/material.dart';
import 'package:kids/providers/Athan.dart';

import 'package:kids/screens/login.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Athanprovider(),
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
    );
  }
}
