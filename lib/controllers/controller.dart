import 'package:flutter/material.dart';
import 'package:mvc/models/counter.dart';
import 'package:mvc/view/actionView.dart';
import 'package:mvc/view/bodyView.dart';

class Controller extends StatefulWidget {
  final String title;

  const Controller({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    return ControllerState();
  }
}

class ControllerState extends State<Controller> {

  final Counter _counter = Counter();

  void _increment() => setState(() => _counter.increment());
  void _decrement(int number) => setState(() => _counter.decrement(number));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BodyView(counter: _counter.count),
      floatingActionButton: ActionView(increment: _increment, decrement: _decrement,),
    );
  }
}
