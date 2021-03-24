import 'package:flutter/material.dart';
import 'package:kids/providers/Athan.dart';

import 'package:kids/widgets/salahevluate.dart';
import 'package:provider/provider.dart';

class Asr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Salahev('Asr', Provider.of<Athanprovider>(context).time.data.timings.asr,Colors.yellow.shade600,);
  }
}
