import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  final void Function() play;
  final void Function() stop;
  final bool isPlaying;
  final void Function() openMixer;
  final void Function() openTempo;
  const Footer(
      this.play, this.stop, this.isPlaying, this.openMixer, this.openTempo);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Container(
        color: Colors.deepOrange,
        height: 3,
      )),
      GestureDetector(
        onTap: widget.openMixer,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.leaderboard_rounded,
            color: Colors.deepOrange,
            size: 21,
          ),
        ),
      ),
      Expanded(
          child: Container(
        color: Colors.deepOrange,
        height: 3,
      )),
      GestureDetector(
        onTap: widget.isPlaying ? widget.stop : widget.play,
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.deepOrange,
          ),
          child: Icon(
            widget.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      Expanded(
          child: Container(
        color: Colors.deepOrange,
        height: 3,
      )),
      GestureDetector(
        onTap: widget.openTempo,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.speed_rounded,
            color: Colors.deepOrange,
            size: 21,
          ),
        ),
      ),
      Expanded(
          child: Container(
        color: Colors.deepOrange,
        height: 3,
      )),
    ]);
  }
}
