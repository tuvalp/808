import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class InstrumentButton extends StatefulWidget {
  final String name;
  const InstrumentButton(this.name, {super.key});

  @override
  State<InstrumentButton> createState() => _InstrumentButtonState();
}

class _InstrumentButtonState extends State<InstrumentButton> {
  bool _isPressed = false;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (value) async {
        await player.play(AssetSource('${widget.name}.wav'));
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (value) {
        setState(() {
          _isPressed = false;
        });
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepOrange, width: 1),
          borderRadius: BorderRadius.circular(20),
          color: _isPressed ? Colors.grey.shade300 : Colors.grey.shade200,
        ),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 30, left: 30),
            child: Container(
              width: 20,
              height: 8,
              decoration: BoxDecoration(
                color:
                    _isPressed ? Colors.deepOrange.shade400 : Colors.deepOrange,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Center(
            child: Text(
              widget.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}
