import 'package:_808/widgets/sequencer_row.dart';
import 'package:flutter/material.dart';

class Sequencer extends StatelessWidget {
  final List instruments;
  final bool isPlaying;
  final bool isPause;
  final int playerSlot;
  const Sequencer({
    required this.instruments,
    required this.isPlaying,
    required this.isPause,
    required this.playerSlot,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: instruments.length * 50,
      child: Stack(
        children: [
          Column(
            children: [
              ...instruments
                  .map((instrument) => SequencerRow(
                        instrument['name'],
                        instrument['slot'],
                        isPlaying,
                        isPause,
                        playerSlot,
                      ))
                  .toList(),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 50),
            left: (isPlaying || (isPause && playerSlot > -1))
                ? 95 + playerSlot * 34
                : double.infinity,
            top: (isPlaying || (isPause && playerSlot > -1))
                ? 5
                : double.infinity,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(50, 255, 86, 34),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 33,
              height: (instruments.length * 50) - 10,
            ),
          ),
        ],
      ),
    );
  }
}
