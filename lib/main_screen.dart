import 'dart:async';

import 'package:_808/widgets/mixer.dart';
import 'package:_808/widgets/sequencer.dart';
import 'package:_808/widgets/tempo.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'widgets/header.dart';
import 'widgets/instrument_button.dart';
import 'widgets/footer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<bool> kick = [false, false, false, false, false, false, false, false];
  List<bool> snare = [false, false, false, false, false, false, false, false];
  List<bool> hihat = [false, false, false, false, false, false, false, false];
  List<bool> clap = [false, false, false, false, false, false, false, false];

  bool isPlaying = false;
  int playerSlot = -1;
  Timer timer = Timer.periodic(const Duration(milliseconds: 0), (timer) {});
  int bpm = 120;

  double kickVolume = 0.3;
  double snareVolume = 0.3;
  double hihatVolume = 0.3;
  double clapVolume = 0.3;

  void setBpm(int value) {
    if (value > 60 && value < 240) {
      setState(() {
        bpm = value;
      });
    }
  }

  void setBpmUP() {
    if (bpm < 240) {
      setState(() {
        bpm++;
      });
    }
  }

  void setBpmDOWN() {
    if (bpm > 60) {
      setState(() {
        bpm--;
      });
    }
  }

  void setKickVolume(double value) {
    setState(() {
      kickVolume = value;
    });
  }

  void setSnareVolume(double value) {
    setState(() {
      snareVolume = value;
    });
  }

  void setHihatVolume(double value) {
    setState(() {
      hihatVolume = value;
    });
  }

  void setClapVolume(double value) {
    setState(() {
      clapVolume = value;
    });
  }

  void play() {
    isPlaying = true;
    timer = Timer.periodic(Duration(milliseconds: 60000 ~/ bpm), (timer) {
      setState(() {
        if (playerSlot < 7) {
          playerSlot++;
        } else {
          playerSlot = 0;
        }
      });

      if (kick[playerSlot] == true) {
        AudioPlayer().play(AssetSource('Kick.wav'), volume: kickVolume);
      }
      if (snare[playerSlot] == true) {
        AudioPlayer().play(AssetSource('Snare.wav'), volume: snareVolume);
      }
      if (hihat[playerSlot] == true) {
        AudioPlayer().play(AssetSource('HiHat.wav'), volume: hihatVolume);
      }
      if (clap[playerSlot] == true) {
        AudioPlayer().play(AssetSource('Clap.wav'), volume: clapVolume);
      }
    });
  }

  void stop() {
    isPlaying = false;
    playerSlot = -1;
    timer.cancel();
    setState(() {});
  }

  void openMixer() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Mixer(
              setKickVolume: setKickVolume,
              setSnareVolume: setSnareVolume,
              setHihatVolume: setHihatVolume,
              setClapVolume: setClapVolume,
              kickVolume: kickVolume,
              snareVolume: snareVolume,
              hihatVolume: hihatVolume,
              clapVolume: clapVolume,
            ));
  }

  void openTempo() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Tempo(bpm, setBpm, setBpmUP, setBpmDOWN));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Header(),
          SizedBox(
            width: double.infinity,
            child: Column(children: [
              Sequencer("Kick", kick, isPlaying, playerSlot),
              const SizedBox(height: 7),
              Sequencer("Snare", snare, isPlaying, playerSlot),
              const SizedBox(height: 7),
              Sequencer("Hihat", hihat, isPlaying, playerSlot),
              const SizedBox(height: 7),
              Sequencer("Clap", clap, isPlaying, playerSlot),
              const SizedBox(height: 7),
            ]),
          ),
          const SizedBox(
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InstrumentButton("Kick"),
                  InstrumentButton("Snare"),
                  InstrumentButton("HiHat"),
                  InstrumentButton("Clap"),
                ]),
          ),
          Footer(play, stop, isPlaying, openMixer, openTempo),
        ],
      ),
    );
  }
}
