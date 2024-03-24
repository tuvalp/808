import 'package:flutter/material.dart';
import 'package:_808/utils/player.dart';

class Tempo extends StatefulWidget {
  const Tempo({required this.playbackController, super.key});
  final PlaybackController playbackController;

  @override
  State<Tempo> createState() => _TempoState();
}

class _TempoState extends State<Tempo> {
  TextEditingController controller = TextEditingController(text: "0");
  int displyValue = 0;

  @override
  void initState() {
    controller.value =
        TextEditingValue(text: widget.playbackController.bpm.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 300,
        child: Center(
          child: SizedBox(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Tempo",
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.deepOrange),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            controller.value = TextEditingValue(
                              text: (int.parse(controller.value.text) + 1)
                                  .toString(),
                            );
                          });
                          widget.playbackController
                              .setBpm(int.parse(controller.value.text));
                        },
                        iconSize: 56,
                        icon: const Icon(Icons.add_circle_rounded),
                        color: Colors.deepOrange,
                      ),
                      SizedBox(
                        width: 100,
                        height: 60,
                        child: TextFormField(
                          onEditingComplete: () {
                            widget.playbackController
                                .setBpm(int.parse(controller.value.text));
                          },
                          controller: controller,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(top: 0, bottom: 8),
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          style: const TextStyle(
                            fontSize: 32,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            controller.value = TextEditingValue(
                              text: (int.parse(controller.value.text) - 1)
                                  .toString(),
                            );
                          });
                          widget.playbackController
                              .setBpm(int.parse(controller.value.text));
                        },
                        iconSize: 56,
                        icon: const Icon(Icons.remove_circle_rounded),
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
