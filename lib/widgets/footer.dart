import 'package:_808/utils/player.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final PlaybackController playbackController;
  final void Function() openMixer;
  final void Function() openTempo;
  const Footer(
      {required this.playbackController,
      required this.openMixer,
      required this.openTempo,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Container(
        color: Colors.deepOrange,
        height: 3,
      )),
      GestureDetector(
        onTap: openMixer,
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
              onTap: () => playbackController.stop(),
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
              onTap: () => playbackController.isPlaying
                  ? playbackController.pause()
                  : playbackController.play(),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.deepOrange,
                ),
                child: Icon(
                  playbackController.isPlaying
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
              onTap: playbackController.isPlaying
                  ? playbackController.pause
                  : playbackController.record,
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
        onTap: openTempo,
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
