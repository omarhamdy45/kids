import 'package:flutter/material.dart';
import 'package:kidsapp/providers/Athan.dart';

import 'package:kidsapp/widgets/salahevluate.dart';
import 'package:provider/provider.dart';

class Isha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Salahev('Isha’', Provider.of<Athanprovider>(context).time.data.timings.isha,Colors.black,Colors.white,Colors.white,'5'
    );
  }
}
