import 'package:flutter/material.dart';
import 'package:_808/utils/player.dart';
import 'package:_808/models/instrument.dart';
import 'package:_808/widgets/sequencer_button.dart';

class SequencerRow extends StatelessWidget {
  const SequencerRow(
      {required this.playbackController, required this.instrument, Key? key})
      : super(key: key);

  final Instrument instrument;
  final PlaybackController playbackController;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.all(1),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 15),
            SizedBox(
              width: 70,
              child: Text(
                instrument.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(width: 10),
            Row(children: [
              for (var instrumentIndex = 0;
                  instrumentIndex < instrument.slot.length;
                  instrumentIndex++)
                Padding(
                  padding: const EdgeInsets.only(right: 1),
                  child: GestureDetector(
                    onTap: () {
                      if (instrument.slot[instrumentIndex] == false) {
                        instrument.play();
                      }

                      instrument.changeSlot(instrumentIndex);
                    },
                    child: SequencerButton(
                      active: instrument.slot[instrumentIndex],
                      playing: playbackController.playerSlot == instrumentIndex,
                      isPlaying: playbackController.isPlaying,
                    ),
                  ),
                ),
              const SizedBox(width: 5),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 50),
                  curve: Curves.easeOut,
                  opacity: playbackController.isPlaying &&
                          instrument.slot[playbackController.playerSlot]
                      ? 1
                      : 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                          center: Alignment.center,
                          radius: 0.6,
                          colors: [
                            const Color.fromARGB(255, 241, 196, 91),
                            Colors.deepOrange.shade100
                          ]),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
