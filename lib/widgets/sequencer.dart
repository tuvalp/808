import 'package:flutter/material.dart';
import 'package:_808/utils/player.dart';
import 'package:_808/widgets/sequencer_row.dart';

class Sequencer extends StatelessWidget {
  final PlaybackController playbackController;

  const Sequencer({
    required this.playbackController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: playbackController.instruments.length * 50,
      child: Stack(
        children: [
          Column(
            children: [
              ...playbackController.instruments
                  .map((instrument) => SequencerRow(
                        instrument: instrument,
                        playbackController: playbackController,
                      ))
                  .toList(),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 50),
            left: (playbackController.isPlaying ||
                    (playbackController.isPause &&
                        playbackController.playerSlot > -1))
                ? 95 + playbackController.playerSlot * 34
                : double.infinity,
            top: (playbackController.isPlaying ||
                    (playbackController.isPause &&
                        playbackController.playerSlot > -1))
                ? 5
                : double.infinity,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(50, 255, 86, 34),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 33,
              height: (playbackController.instruments.length * 50) - 10,
            ),
          ),
        ],
      ),
    );
  }
}
