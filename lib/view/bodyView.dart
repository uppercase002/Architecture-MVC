import 'package:flutter/material.dart';

class BodyView extends StatelessWidget {
  final int counter;

  const BodyView({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text(
            "Vous avez appuyé sur le bouton",
            style: TextStyle(fontSize: 20, fontWeight: .w900),
          ),
          Text(
            "$counter fois",
            style: TextStyle(fontWeight: .bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
