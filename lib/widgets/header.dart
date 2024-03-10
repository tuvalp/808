import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.deepOrange,
              height: 3,
            ),
          ),
          const Text("808",
              style: TextStyle(
                  fontSize: 42,
                  color: Colors.deepOrange,
                  fontFamily: "Merienda",
                  fontWeight: FontWeight.w700)),
          Expanded(
            child: Container(
              color: Colors.deepOrange,
              height: 3,
            ),
          ),
        ],
      ),
    );
  }
}
