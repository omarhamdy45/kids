import 'package:flutter/material.dart';
import 'package:kids/providers/Athan.dart';

import 'package:kids/widgets/salahevluate.dart';
import 'package:provider/provider.dart';

class Isha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Salahev('Isha', Provider.of<Athanprovider>(context).time.data.timings.isha,Colors.black);
  }
}
