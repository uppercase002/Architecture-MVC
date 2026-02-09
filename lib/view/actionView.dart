import 'package:flutter/material.dart';

class ActionView extends StatelessWidget {
  final VoidCallback increment;
  final Function(int) decrement;

  const ActionView({super.key, required this.increment, required this.decrement});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: increment,
          child: Icon(Icons.add, size: 20),
        ),
        FloatingActionButton(
          onPressed: (() => decrement(1)),
          child: Icon(Icons.minimize, size: 20),
        ),
      ],
    );
  }
}
