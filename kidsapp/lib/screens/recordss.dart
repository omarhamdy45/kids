import 'package:flutter/material.dart';
import 'package:kidsapp/widgets/namesofallahrecord.dart';
import 'package:kidsapp/widgets/record.dart';
import 'package:kidsapp/widgets/sourarecord.dart';

class Records extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
    body: Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(children: [
        Sourarecord(),
        Namesofallahrecord(),
        MyAppp()
        
      ],),
    ),
      
    );
  }
}