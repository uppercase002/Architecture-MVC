import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvc/providers/sum_provider.dart';
import 'package:mvc/view/second_page_with_riverpod.dart';

class RiverpodPage extends StatelessWidget {
  const RiverpodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Riverpod"), centerTitle: true),
      body: Consumer(
        builder: (context, ref, child) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                spacing: 10,
                children: [
                  Text("Le resultat est : ${ref.watch(resultProvider)}"),
                  SizedBox(height: 20),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Premier nombre"),
                    onChanged: (value) => ref.read(aProvider.notifier).state =
                        int.tryParse(value) ?? 0,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Deuxieme nombre"),
                    onChanged: (value) => ref.read(bProvider.notifier).state =
                        int.tryParse(value) ?? 0,
                  ),
                  SizedBox(height: 30),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondPageWithRiverpod(),
                        ),
                      );
                    },
                    icon: Icon(Icons.watch),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
