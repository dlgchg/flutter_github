import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import '../top_config.dart';

/*
 * @Date: 2019-03-18 15:21 
 * @Description TODO
 */

class SearchLanguagesDelegate extends SearchDelegate {

  // 0 trend, 1 search
  final int type;
  SearchLanguagesDelegate(this.type);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return ListTile(
      title: Text(query),
      leading: (type == 0 ? gitHubProvide.language :gitHubProvide.searchLanguages) == query ? Icon(Icons.check) : null,
      onTap: () {
        if (type == 0) {
          gitHubProvide.language = query;
        } else {
          gitHubProvide.searchLanguages = query;
        }
        close(context, query);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/data/languages.json'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List list = json.decode(snapshot.data.toString());
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: (type == 0 ? gitHubProvide.language :gitHubProvide.searchLanguages) == list[index]['name']
                    ? Icon(Icons.check)
                    : null,
                title: Text(list[index]['name']),
                onTap: () {
                  if (type == 0) {
                    gitHubProvide.language = list[index]['name'];
                  } else {
                    gitHubProvide.searchLanguages = list[index]['name'];
                  }
                  close(context, list[index]['name']);
                },
              );
            },
            itemCount: list.length,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
