import 'package:flutter/material.dart';

class SequencerButton extends StatelessWidget {
  const SequencerButton(
      {Key? key,
      required this.active,
      required this.playing,
      required this.isPlaying})
      : super(key: key);
  final bool active;
  final bool playing;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 33,
      height: 38,
      decoration: BoxDecoration(
        color: active ? Colors.deepOrange.shade100 : Colors.grey.shade200,
        border: Border.all(color: Colors.deepOrange, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: AnimatedOpacity(
        opacity: active && playing && isPlaying ? 1 : 0,
        duration: const Duration(milliseconds: 60),
        curve: Curves.easeInOut,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.6,
                  colors: [
                    const Color.fromARGB(255, 241, 196, 91),
                    Colors.deepOrange.shade100
                  ],
                ))),
      ),
    );
  }
}
