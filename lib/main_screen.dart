import 'package:flutter/material.dart';
import 'package:_808/models/instrument.dart';
import 'package:_808/widgets/header.dart';
import 'package:_808/widgets/sequencer.dart';
import 'package:_808/widgets/instrument_controller.dart';
import 'package:_808/widgets/mixer.dart';
import 'package:_808/widgets/tempo.dart';
import 'package:_808/widgets/footer.dart';
import 'utils/player.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PlaybackController _playbackController;

  @override
  void initState() {
    super.initState();
    _playbackController = PlaybackController(
      instruments: [
        Instrument("Kick", onPlaybackStateChanged: _onPlaybackStateChanged),
        Instrument("Snare", onPlaybackStateChanged: _onPlaybackStateChanged),
        Instrument("OpenHat", onPlaybackStateChanged: _onPlaybackStateChanged),
        Instrument("CloseHat", onPlaybackStateChanged: _onPlaybackStateChanged),
        Instrument("Tom", onPlaybackStateChanged: _onPlaybackStateChanged),
        Instrument("Clap", onPlaybackStateChanged: _onPlaybackStateChanged),
        Instrument("Conga", onPlaybackStateChanged: _onPlaybackStateChanged),
        Instrument("Clav", onPlaybackStateChanged: _onPlaybackStateChanged),
      ],
      onPlaybackStateChanged: _onPlaybackStateChanged,
    );
  }

  void _onPlaybackStateChanged() {
    setState(() {});
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
            playbackController: _playbackController,
          ),
          const SizedBox(height: 10),
          InstrumentController(
            playbackController: _playbackController,
          ),
          Footer(
            playbackController: _playbackController,
            openMixer: openMixer,
            openTempo: openTempo,
          ),
        ],
      ),
    );
  }

  void openMixer() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Mixer(
              _playbackController.instruments,
            ));
  }

  void openTempo() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => Tempo(
        playbackController: _playbackController,
      ),
    );
  }
}
