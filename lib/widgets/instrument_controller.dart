import 'package:_808/widgets/instrument_button.dart';
import 'package:flutter/material.dart';

class InstrumentController extends StatelessWidget {
  const InstrumentController(
      this.instruments, this.isRecord, this.addToSequence,
      {super.key});
  final List instruments;
  final bool isRecord;
  final void Function(int) addToSequence;

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
            ...instruments
                .map((instrument) => InstrumentButton(instrument['name'],
                    instruments.indexOf(instrument), isRecord, addToSequence))
                .toList()
          ],
        ),
      ),
    );
  }
}
