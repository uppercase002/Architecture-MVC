import 'package:flutter/material.dart';
import 'package:mvc/models/searchClass.dart';
import 'package:mvc/services/share_handler.dart';
import 'package:mvc/view/sharePreferences.dart';

class SharePreferencesController extends StatefulWidget {
  const SharePreferencesController({super.key});

  @override
  State<StatefulWidget> createState() {
    return SharePreferencesControllerState();
  }
}

class SharePreferencesControllerState
    extends State<SharePreferencesController> {
  late TextEditingController _textEditingController;

  late List<String> lastSearchSongs = [];

  final List<SearchClass> searchData = [
    SearchClass(nom: "Tolno", prenom: "Philippe", age: 23),
    SearchClass(nom: "Mans", prenom: "Boys", age: 23),
    SearchClass(nom: "Young", prenom: "Mane", age: 23),
    SearchClass(nom: "Slay", prenom: "Romeo", age: 23),
    SearchClass(nom: "Elise", prenom: "Mongo", age: 23),
    SearchClass(nom: "Brice", prenom: "Rode", age: 23),
    SearchClass(nom: "Marce", prenom: "Garde", age: 23),
    SearchClass(nom: "Biod", prenom: "Lomn", age: 23),
    SearchClass(nom: "Soro", prenom: "Leui", age: 23),
    SearchClass(nom: "Marce", prenom: "Garde", age: 23),
    SearchClass(nom: "Biod", prenom: "Lomn", age: 23),
    SearchClass(nom: "Soro", prenom: "Leui", age: 23),
    SearchClass(nom: "Marce", prenom: "Garde", age: 23),
    SearchClass(nom: "Biod", prenom: "Lomn", age: 23),
    SearchClass(nom: "Soro", prenom: "Leui", age: 23),
    SearchClass(nom: "Marce", prenom: "Garde", age: 23),
    SearchClass(nom: "Biod", prenom: "Lomn", age: 23),
    SearchClass(nom: "Soro", prenom: "Leui", age: 23),
  ];

  String searchValue = "";

  late List<SearchClass> _list = [];

  void search(String string) {
    setState(() {
      searchValue = string;

      if (string.trim().isEmpty) {
        _list = searchData;
      } else {
        _list = searchData.where((item) {
          return item.fullName.toLowerCase().contains(string.toLowerCase());
        }).toList();
      }
    });
  }

  void save(String string) {
    addItemToList(string).then((success) {
      getSharedPref();
    });
  }

  void clearKeyBoard() => FocusScope.of(context).requestFocus(FocusNode());

  void onPressed() {
    clearKeyBoard();
    if(_textEditingController.text != "") save(_textEditingController.text);
  }

  void getSharedPref() {
    getList().then((newList) => {
      setState(() {
        lastSearchSongs = newList;
      })
    });
  }

  void removeItem(String value) {
    removeItemToList(value).then((success) => getSharedPref());
  }

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _list = searchData;
    getSharedPref();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharePreferences"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SharePreferencesView(
        textEditingController: _textEditingController,
        search: search,
        save: save,
        onPressed: onPressed,
        searchValue: searchValue,
        list: _list,
        lastSearchList: lastSearchSongs,
        removeItem: removeItem,
      ),
    );
  }
}
