import 'package:flutter/material.dart';
import 'package:kids/widgets/duadetails.dart';

class Dua1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Duadetails(
        'when walking up',
        'assets/images/Group 2318.png',
        'الحَمْـدُ لِلّهِ الّذي أَحْـيانا بَعْـدَ ما أَماتَـنا وَإليه النُّـشور',
        'Alḥamdu lillāhil-ladhī aḥyānā ba`da mā amātanā wa ilayhin-nushūr.',
      ),
    );
  }
}
