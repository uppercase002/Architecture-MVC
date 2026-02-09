
import 'package:shared_preferences/shared_preferences.dart';

final String key = "searchKey";

Future<bool> removeItemToList(String value) async {
  final instance = await SharedPreferences.getInstance();

  final list = await getList();

  list.remove(value);

  await instance.setStringList(key, list);

  return true;
}

Future<bool> addItemToList(String item) async {
  final instance = await SharedPreferences.getInstance();

  final list = await getList();

  if(item != "") list.add(item);

  await instance.setStringList(key, list);

  return true;
}

Future<List<String>> getList() async {
  final instance = await SharedPreferences.getInstance();

  final List<String> results = await instance.getStringList(key) ?? [];

  return results;
}