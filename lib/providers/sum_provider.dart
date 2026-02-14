import 'package:flutter_riverpod/legacy.dart';

final aProvider = StateProvider<int>((ref) => 0);

final bProvider = StateProvider<int>((ref) => 0);

final resultProvider = StateProvider<int>((ref) {
  return ref.watch(aProvider) + ref.watch(bProvider);
});