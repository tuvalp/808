import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  final void Function() play;
  final void Function() stop;
  final void Function() pause;
  final void Function() record;
  final bool isPlaying;
  final void Function() openMixer;
  final void Function() openTempo;
  const Footer(this.play, this.stop, this.pause, this.record, this.isPlaying,
      this.openMixer, this.openTempo);

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
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange, width: 1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Icon(
            Icons.leaderboard_rounded,
            color: Colors.deepOrange,
            size: 23,
          ),
        ),
      ),
      Expanded(
          child: Container(
        color: Colors.deepOrange,
        height: 3,
      )),
      SizedBox(
        width: 185,
        height: 80,
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 100,
              height: 30,
              color: Colors.deepOrange,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: widget.stop,
              child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  color: Colors.deepOrange,
                ),
                child: const Icon(
                  Icons.square,
                  color: Colors.white,
                  size: 21,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: widget.isPlaying ? widget.pause : widget.play,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.deepOrange,
                ),
                child: Icon(
                  widget.isPlaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 58,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: widget.isPlaying ? widget.pause : widget.record,
              child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  color: Colors.deepOrange,
                ),
                child: const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
        ]),
      ),
      Expanded(
          child: Container(
        color: Colors.deepOrange,
        height: 3,
      )),
      GestureDetector(
        onTap: widget.openTempo,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange, width: 1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Icon(
            Icons.speed_rounded,
            color: Colors.deepOrange,
            size: 23,
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
