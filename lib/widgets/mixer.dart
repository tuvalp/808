import 'package:flutter/material.dart';
import 'package:_808/widgets/mixer_slider.dart';

class Mixer extends StatefulWidget {
  const Mixer(this.instruments, this.setVolume, {super.key});

  final List instruments;
  final void Function(int, double) setVolume;

  @override
  State<Mixer> createState() => _MixerState();
}

class _MixerState extends State<Mixer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            ...widget.instruments
                .map((instrument) => MixerSlider(
                    instrument["name"],
                    widget.instruments.indexOf(instrument),
                    instrument["volume"],
                    widget.setVolume))
                .toList(),
          ],
        ),
      ),
    );
  }
}
