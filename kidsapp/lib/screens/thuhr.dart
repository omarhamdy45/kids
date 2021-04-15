import 'package:flutter/material.dart';
import 'package:kidsapp/providers/Athan.dart';
import 'package:kidsapp/widgets/salahevluate.dart';
import 'package:provider/provider.dart';

class Thuhr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Salahev(
      'Thuhr',
      Provider.of<Athanprovider>(context).time.data.timings.dhuhr,
      Colors.yellow.shade400,
      Colors.grey[700],
      Colors.black,
      Colors.black,
      '2'
    );
  }
}
