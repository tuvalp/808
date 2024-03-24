import 'dart:async';
import '../models/instrument.dart';

class PlaybackController {
  late final List<Instrument> instruments;
  late Function() onPlaybackStateChanged;
  late bool _isPlaying;
  late bool _isRecord;
  late bool _isPause;
  late int _playerSlot;
  late int _bpm;
  late Timer _timer;

  PlaybackController({
    required this.instruments,
    required this.onPlaybackStateChanged,
    int initialBpm = 120,
  }) {
    _bpm = initialBpm;
    _isPlaying = false;
    _isRecord = false;
    _isPause = false;
    _playerSlot = -1;
    _timer = Timer.periodic(const Duration(milliseconds: 0), (_) {});
  }

  bool get isPlaying => _isPlaying;
  bool get isRecord => _isRecord;
  bool get isPause => _isPause;
  int get playerSlot => _playerSlot;
  int get bpm => _bpm;

  void setBpm(int value) {
    if (value > 59 && value < 241) {
      _bpm = value;
    }
  }

  void play() {
    _isPlaying = true;
    _isPause = false;

    _timer = Timer.periodic(Duration(milliseconds: (60000 ~/ _bpm)), (timer) {
      if (_playerSlot < 7) {
        _playerSlot++;
      } else {
        _playerSlot = 0;
      }

      for (var instrument in instruments) {
        if (instrument.slot[_playerSlot]) {
          instrument.play();
        }
      }

      onPlaybackStateChanged();
    });
  }

  void record() {
    _isRecord = true;
    _isPause = false;
    play();
  }

  void pause() {
    _isPlaying = false;
    _isPause = true;
    _timer.cancel();

    onPlaybackStateChanged();
  }

  void stop() {
    _isPlaying = false;
    _isPause = false;
    _isRecord = false;
    _playerSlot = -1;
    _timer.cancel();

    onPlaybackStateChanged();
  }
}
