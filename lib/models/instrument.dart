import 'package:audioplayers/audioplayers.dart';

class Instrument {
  final String name;
  final List<bool> slot;
  double volume;
  late Function() onPlaybackStateChanged;

  Instrument(
    this.name, {
    List<bool>? slot,
    this.volume = 0.5,
    required this.onPlaybackStateChanged,
  }) : slot = slot ?? List.generate(8, (index) => false);

  void setVolume(double value) {
    volume = value;
    onPlaybackStateChanged();
  }

  void changeSlot(int index) {
    slot[index] = !slot[index];
    onPlaybackStateChanged();
  }

  Future<void> play() async {
    await AudioPlayer().play(AssetSource('$name.wav'),
        mode: PlayerMode.lowLatency, volume: volume);
  }
}
