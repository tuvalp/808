import 'package:flutter/material.dart';
import 'package:_808/widgets/mixer_slider.dart';

import 'package:_808/models/instrument.dart';

class Mixer extends StatelessWidget {
  const Mixer(this.instruments, {super.key});

  final List<Instrument> instruments;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            ...instruments
                .map((instrument) => MixerSlider(
                      instrument,
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
