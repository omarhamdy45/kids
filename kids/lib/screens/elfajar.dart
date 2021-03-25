import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids/providers/Athan.dart';
import 'package:kids/widgets/salahevluate.dart';
import 'package:provider/provider.dart';

class Elfajar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Salahev(
      'Fajr',
      Provider.of<Athanprovider>(context).time.data.timings.fajr,
      Colors.lightBlueAccent.shade700,
      Colors.white,
      Colors.white,

    );
  }
}
