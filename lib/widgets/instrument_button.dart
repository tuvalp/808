import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class InstrumentButton extends StatefulWidget {
  final String name;
  final int index;
  final bool isRecord;
  final Function(int) addToSequence;
  const InstrumentButton(
      this.name, this.index, this.isRecord, this.addToSequence,
      {super.key});

  @override
  State<InstrumentButton> createState() => _InstrumentButtonState();
}

class _InstrumentButtonState extends State<InstrumentButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey.shade200,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.deepOrange.shade200,
        onTap: () async {
          await AudioPlayer().play(AssetSource('${widget.name}.wav'));
          if (widget.isRecord) {
            widget.addToSequence(widget.index);
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
                  widget.name,
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
