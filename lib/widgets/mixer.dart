import 'package:_808/widgets/coustom_slider.dart';
import 'package:flutter/material.dart';

class Mixer extends StatefulWidget {
  const Mixer({
    required this.kickVolume,
    required this.snareVolume,
    required this.hihatVolume,
    required this.clapVolume,
    required this.setHihatVolume,
    required this.setKickVolume,
    required this.setSnareVolume,
    required this.setClapVolume,
  });
  final double kickVolume;
  final double snareVolume;
  final double hihatVolume;
  final double clapVolume;
  final void Function(double) setKickVolume;
  final void Function(double) setSnareVolume;
  final void Function(double) setHihatVolume;
  final void Function(double) setClapVolume;

  @override
  State<Mixer> createState() => _MixerState();
}

class _MixerState extends State<Mixer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepOrange, width: 1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: Icon(Icons.leaderboard_rounded,
                  size: 56, color: Colors.deepOrange),
            ),
          ),
          const SizedBox(height: 25),
          CoustomSlider("Kick", widget.kickVolume, widget.setKickVolume),
          CoustomSlider("Snare", widget.snareVolume, widget.setSnareVolume),
          CoustomSlider("Hihat", widget.hihatVolume, widget.setHihatVolume),
          CoustomSlider("Clap", widget.clapVolume, widget.setClapVolume),
        ],
      ),
    );
  }
}
