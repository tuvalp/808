import 'package:flutter/material.dart';

class MixerSlider extends StatefulWidget {
  const MixerSlider(this.title, this.index, this.value, this.setValue,
      {Key? key})
      : super(key: key);
  final String title;
  final int index;
  final double value;
  final void Function(int, double) setValue;
  @override
  _MixerSliderState createState() => _MixerSliderState();
}

class _MixerSliderState extends State<MixerSlider> {
  late double _value;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SizedBox(width: 20),
          SizedBox(
            width: 100,
            child: Text(widget.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 6.0,
                activeTickMarkColor: Colors.deepOrange.shade700,
                inactiveTickMarkColor: Colors.deepOrange.shade200,
                activeTrackColor: Colors.deepOrange.shade700,
                inactiveTrackColor: Colors.deepOrange.shade200,
                thumbColor: Colors.deepOrange.shade700,
                thumbShape: CustomSliderThumbShape(),
              ),
              child: Slider(
                value: _value,
                onChanged: (newValue) {
                  widget.setValue(widget.index, newValue);
                  setState(() {
                    _value = newValue;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            width: 70,
            child: Text('${(_value * 100).toInt()}%',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}

class CustomSliderThumbShape extends SliderComponentShape {
  final double thumbRadius = 24.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final rect = Rect.fromCenter(
      height: thumbRadius,
      width: thumbRadius + 15,
      center: center,
    );

    final RRect rRect = RRect.fromRectAndRadius(
      rect,
      const Radius.circular(5),
    );

    final Paint paint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;

    canvas.drawRRect(rRect, paint);
  }
}
