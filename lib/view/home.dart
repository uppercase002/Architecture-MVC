import 'package:flutter/material.dart';
import 'package:mvc/controllers/controller.dart';
import 'package:mvc/controllers/sharePreferencesController.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MVC & SharePreferences"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Controller(title: "Architecture MVC"),
                  ),
                );
              },
              child: Text("MVC"),
            ),
            TextButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SharePreferencesController(),
                ),
              );
            }, child: Text("SharePreferences")),
          ],
        ),
      ),
    );
  }
}
