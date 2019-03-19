import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../top_config.dart';
import '../../model/trees_entity.dart';
import 'package:dio/dio.dart';
/*
 * @TIME 2019-03-19 19:11
 * @DES  TODO
 */

class TreesPage extends StatefulWidget {
  final String _url;
  final String _name;
  final String _folder;
  final String _branch;
  final String _fullName;

  TreesPage(this._url, this._name, this._folder, this._fullName, this._branch);

  @override
  _TreesPageState createState() =>
      _TreesPageState(_url, _name, _folder, _fullName, _branch);
}

class _TreesPageState extends State<TreesPage> with AutomaticKeepAliveClientMixin{
  final String _url;
  final String _name;
  final String _folder;
  final String _branch;
  final String _fullName;

  _TreesPageState(
      this._url, this._name, this._folder, this._fullName, this._branch);

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_name),
      ),
      body: FutureBuilder(
          future: gitHubProvide.getTree(_url),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Response response = snapshot.data;
              TreesEntity treesEntity = TreesEntity.fromJson(response.data);
              List<TreesTree> list = treesEntity.tree;
              list.sort((TreesTree t1, TreesTree t2) {
                if(t1.type == 'tree' || t2.type == 'tree') {
                  return 1;
                }
                return -1;
              });
              return ListView(
                children: list.map(
                      (item) {
                    return ListTile(
                      leading: Icon(item.type == 'tree'
                          ? Icons.folder
                          : Icons.insert_drive_file),
                      title: Text(item.path),
                      trailing: item.type == 'tree'
                          ? Icon(Icons.keyboard_arrow_right)
                          : null,
                      onTap: () {
                        if (item.type == 'tree') {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return TreesPage(
                                    item.url,
                                    item.path,
                                    _folder + item.path + '/',
                                    _fullName,
                                    _branch,);
                              },
                            ),
                          );
                        } else {
                          launchURL('https://github.com/$_fullName/${item.type}/$_branch/$_folder${item.path}');
                        }
                      },
                    );
                  },
                ).toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}