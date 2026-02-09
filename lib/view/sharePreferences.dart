import 'package:flutter/material.dart';
import 'package:mvc/models/searchClass.dart';

class SharePreferencesView extends StatelessWidget {
  final TextEditingController textEditingController;
  late final ValueChanged<String> search;
  final ValueChanged<String> save;
  final VoidCallback onPressed;
  final String searchValue;
  final List<SearchClass> list;
  final List<String> lastSearchList;
  final ValueChanged<String> removeItem;

  SharePreferencesView({
    super.key,
    required this.textEditingController,
    required this.search,
    required this.save,
    required this.onPressed,
    required this.searchValue,
    required this.list,
    required this.lastSearchList,
    required this.removeItem
  });

  final _style = TextStyle(
    fontWeight: .w900,
    fontSize: 22,
    fontFamily: "Roboto",
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: Column(
        spacing: 8,
        children: [
          Text("Recherche", style: _style),
          SizedBox(
            height: 75,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    onChanged: search,
                    onSubmitted: save,
                    decoration: InputDecoration(
                      hintText: "Entrez votre recherche",
                    ),
                  ),
                ),
                IconButton(onPressed: onPressed, icon: Icon(Icons.send)),
              ],
            ),
          ),
          Text(
            searchValue.isEmpty
                ? "Dernières recherches"
                : "Nous avons trouvez pour vous",
            style: TextStyle(
              fontSize: 20,
              fontWeight: .bold,
              color: Colors.red,
            ),
          ),
          Expanded(
            child: (searchValue.isEmpty) ? emptyWidget() : onSearchWidget(list),
          ),
        ],
      ),
    );
  }

  Widget emptyWidget() {
    return ListView.builder(
      itemCount: lastSearchList.length,
      itemBuilder: (context, index) {
        String item = lastSearchList[index];
        return ListTile(
          title: Text(item),
          trailing: IconButton(
            onPressed: () {
              removeItem(item);
            },
            icon: Icon(Icons.remove, color: Colors.red),
          ),
          onTap: () {
            textEditingController.text = item;
            search(item);
          },
        );
      },
    );
  }

  Widget onSearchWidget(List<SearchClass> list) {
    return ListView.separated(
      itemBuilder: (context, index) {
        SearchClass search = list[index];
        return ListTile(
          title: Text(search.fullName),
          subtitle: Text("Age: ${search.age} ans"),
          trailing: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.green[index * 100],
            child: Text(search.initial),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: list.length,
    );
  }
}
