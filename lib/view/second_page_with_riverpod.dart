import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvc/providers/sum_provider.dart';

class SecondPageWithRiverpod extends ConsumerWidget {
  const SecondPageWithRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Valeur provider: ${ref.watch(resultProvider)}"),),
    );
  }
}
