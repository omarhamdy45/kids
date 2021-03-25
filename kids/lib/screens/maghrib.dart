import 'package:flutter/material.dart';
import 'package:kids/providers/Athan.dart';

import 'package:kids/widgets/salahevluate.dart';
import 'package:provider/provider.dart';

class Maghrib extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Salahev('Maghrib', Provider.of<Athanprovider>(context).time.data.timings.maghrib,Colors.grey[400], Colors.grey[700],Colors.black);
  }
}
