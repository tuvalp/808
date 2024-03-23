import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// Models
import 'models/instrument.dart';

// Widgets
import 'widgets/header.dart';
import 'package:_808/widgets/sequencer.dart';
import 'package:_808/widgets/instrument_controller.dart';
import 'package:_808/widgets/mixer.dart';
import 'package:_808/widgets/tempo.dart';
import 'widgets/footer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Instrument> instruments = [
    Instrument("Kick"),
    Instrument("Snare"),
    Instrument("OpenHat"),
    Instrument("CloseHat"),
    Instrument("Tom"),
    Instrument("Clap"),
    Instrument("Conga"),
    Instrument("Clav"),
  ];

  // List instruments = [
  //   {"name": "Kick", "slot": List.generate(8, (index) => false), "volume": 0.5},
  //   {
  //     "name": "Snare",
  //     "slot": List.generate(8, (index) => false),
  //     "volume": 0.5
  //   },
  //   {
  //     "name": "OpenHat",
  //     "slot": List.generate(8, (index) => false),
  //     "volume": 0.5
  //   },
  //   {
  //     "name": "CloseHat",
  //     "slot": List.generate(8, (index) => false),
  //     "volume": 0.5
  //   },
  //   {"name": "Tom", "slot": List.generate(8, (index) => false), "volume": 0.5},
  //   {"name": "Clap", "slot": List.generate(8, (index) => false), "volume": 0.5},
  //   {
  //     "name": "Conga",
  //     "slot": List.generate(8, (index) => false),
  //     "volume": 0.5
  //   },
  //   {"name": "Clav", "slot": List.generate(8, (index) => false), "volume": 0.5},
  // ];

  bool isPlaying = false;
  bool isRecord = false;
  bool isPause = false;
  int playerSlot = -1;
  Timer timer = Timer.periodic(const Duration(milliseconds: 0), (timer) {});
  int bpm = 120;

  void setBpm(int value) {
    if (value > 59 && value < 241) {
      setState(() {
        bpm = value;
      });
    }
  }

  void setVolume(int index, double value) {
    setState(() {
      instruments[index].volume = value;
    });
  }

  void play() {
    isPlaying = true;
    isPause = false;

    timer = Timer.periodic(Duration(milliseconds: (60000 ~/ bpm)), (timer) {
      setState(() {
        if (playerSlot < 7) {
          playerSlot++;
        } else {
          playerSlot = 0;
        }

        instruments.forEach((instrument) async {
          if (instrument.slot[playerSlot] == true) {
            await AudioPlayer().play(AssetSource('${instrument.name}.wav'),
                mode: PlayerMode.lowLatency, volume: instrument.volume);
          }
        });
      });
    });
  }

  void addToSequence(int index) {
    setState(() {
      instruments[index].slot[playerSlot] = true;
    });
  }

  void record() {
    isRecord = true;
    isPause = false;
    play();
  }

  void pause() {
    isPlaying = false;
    isPause = true;
    timer.cancel();
    setState(() {});
  }

  void stop() {
    isPlaying = false;
    isPause = false;
    isRecord = false;
    playerSlot = -1;
    timer.cancel();
    setState(() {});
  }

  void openMixer() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Mixer(
              instruments,
              setVolume,
            ));
  }

  void openTempo() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => Tempo(bpm, setBpm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Header(),
          const SizedBox(height: 5),
          Sequencer(
              instruments: instruments,
              isPlaying: isPlaying,
              isPause: isPause,
              playerSlot: playerSlot),
          const SizedBox(height: 10),
          InstrumentController(instruments, isRecord, addToSequence),
          Footer(play, stop, pause, record, isPlaying, openMixer, openTempo),
        ],
      ),
    );
  }
}
