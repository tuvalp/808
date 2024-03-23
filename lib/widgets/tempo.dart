import 'package:flutter/material.dart';

class Tempo extends StatefulWidget {
  const Tempo(this.bpm, this.setBpm, {super.key});
  final int bpm;
  final void Function(int) setBpm;

  @override
  State<Tempo> createState() => _TempoState();
}

class _TempoState extends State<Tempo> {
  TextEditingController controller = TextEditingController(text: "0");
  int displyValue = 0;

  void updateBmp() {
    setState(() {
      controller.value = TextEditingValue(text: widget.bpm.toString());
    });
  }

  @override
  void initState() {
    controller.value = TextEditingValue(text: widget.bpm.toString());
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
                          widget.setBpm(int.parse(controller.value.text));
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
                            widget.setBpm(int.parse(controller.value.text));
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
                          widget.setBpm(int.parse(controller.value.text));
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
