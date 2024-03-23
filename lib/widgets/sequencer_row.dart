import 'package:_808/widgets/sequencer_button.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SequencerRow extends StatefulWidget {
  const SequencerRow(this.title, this.instrument, this.isPlaying, this.isPause,
      this.playerSlot,
      {super.key});
  final String title;
  final List instrument;
  final bool isPlaying;
  final bool isPause;
  final int playerSlot;

  @override
  State<SequencerRow> createState() => _SequencerRowState();
}

class _SequencerRowState extends State<SequencerRow> {
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
                widget.title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(width: 10),
            Row(children: [
              for (var instrumentIndex = 0;
                  instrumentIndex < widget.instrument.length;
                  instrumentIndex++)
                Padding(
                  padding: const EdgeInsets.only(right: 1),
                  child: GestureDetector(
                    onTap: () {
                      if (widget.instrument[instrumentIndex] == false) {
                        AudioPlayer().play(AssetSource('${widget.title}.wav'));
                      }

                      setState(() {
                        widget.instrument[instrumentIndex] =
                            !widget.instrument[instrumentIndex];
                      });
                    },
                    child: SequencerButton(
                      active: widget.instrument[instrumentIndex],
                      playing: widget.playerSlot == instrumentIndex,
                      isPlaying: widget.isPlaying,
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
                  opacity:
                      widget.isPlaying && widget.instrument[widget.playerSlot]
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
