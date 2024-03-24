import 'package:flutter/material.dart';
import '../utils/player.dart';
import 'instrument_button.dart';

class InstrumentController extends StatelessWidget {
  const InstrumentController({
    Key? key,
    required this.playbackController,
  }) : super(key: key);

  final PlaybackController playbackController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: [
            ...playbackController.instruments
                .map(
                  (instrument) => InstrumentButton(
                    instrument: instrument,
                    playbackController: playbackController,
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
