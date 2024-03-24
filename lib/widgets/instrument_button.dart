import 'package:flutter/material.dart';
import 'package:_808/utils/player.dart';
import 'package:_808/models/instrument.dart';

class InstrumentButton extends StatelessWidget {
  const InstrumentButton(
      {required this.instrument, required this.playbackController, super.key});
  final Instrument instrument;
  final PlaybackController playbackController;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey.shade200,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.deepOrange.shade200,
        onTap: () async {
          instrument.play();
          if (playbackController.isRecord) {
            instrument.changeSlot(playbackController.playerSlot);
          }
        },
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 30, left: 30),
                child: Container(
                  width: 20,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Center(
                child: Text(
                  instrument.name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
