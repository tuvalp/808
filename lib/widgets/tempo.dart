import 'package:flutter/material.dart';

class Tempo extends StatefulWidget {
  const Tempo(this.bpm, this.setBpm, this.setBpmUP, this.setBpmDOWN,
      {super.key});
  final int bpm;
  final void Function(int) setBpm;
  final void Function() setBpmUP;
  final void Function() setBpmDOWN;

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
    return Center(
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
                    onPressed: () async {
                      widget.setBpmUP();

                      updateBmp();
                      setState(() {});
                    },
                    iconSize: 48,
                    icon: const Icon(Icons.add_circle),
                    color: Colors.deepOrange,
                  ),
                  SizedBox(
                    width: 100,
                    height: 60,
                    child: TextFormField(
                      onChanged: (value) {
                        widget.setBpm(int.parse(value));
                      },
                      controller: controller,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 15, 5, 15),
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
                      widget.setBpmDOWN();
                    },
                    iconSize: 48,
                    icon: const Icon(Icons.remove_circle),
                    color: Colors.deepOrange,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
