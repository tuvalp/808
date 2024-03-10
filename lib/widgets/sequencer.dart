import 'package:flutter/material.dart';

class Sequencer extends StatefulWidget {
  const Sequencer(this.title, this.instrument, this.isPlaying, this.playerSlot,
      {super.key});
  final String title;
  final List instrument;
  final bool isPlaying;
  final int playerSlot;

  @override
  State<Sequencer> createState() => _SequencerState();
}

class _SequencerState extends State<Sequencer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 60,
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
          ),
        ),
        Row(children: [
          for (var instrumentIndex = 0;
              instrumentIndex < widget.instrument.length;
              instrumentIndex++)
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.instrument[instrumentIndex] =
                      !widget.instrument[instrumentIndex];
                });
              },
              child: Container(
                  margin: const EdgeInsets.only(right: 4),
                  width: 33,
                  height: 33,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrange, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: widget.instrument[instrumentIndex]
                        ? widget.playerSlot == instrumentIndex
                            ? widget.isPlaying
                                ? Colors.deepOrange.shade500
                                : Colors.deepOrange.shade300
                            : Colors.deepOrange.shade300
                        : widget.playerSlot == instrumentIndex
                            ? widget.isPlaying
                                ? Colors.grey.shade500
                                : Colors.grey.shade200
                            : Colors.grey.shade200,
                  )),
            ),
        ]),
      ],
    );
  }
}
