import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../top_config.dart';
import '../../provide/provide.dart';
import '../../model/model.dart';
import 'package:dio/dio.dart';

/*
 * @TIME 2019-03-19 20:15
 * @DES  TODO
 */

class BranchPage extends StatefulWidget {
  final String _url;
  final String _branch;

  BranchPage(this._url, this._branch) ;

  @override
  _BranchPageState createState() => _BranchPageState(_url, _branch);
}

class _BranchPageState extends State<BranchPage> {
  final String _url;
  String _branch;

  _BranchPageState(this._url, this._branch);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Branch'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: gitHubProvide.getTree(_url),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Response response = snapshot.data;
              List<Map> list = (response.data as List).cast();
              return ListView.builder(
                itemBuilder: (context, index) {
                  BranchEntity entity = BranchEntity.fromJson(list[index]);
                  return ListTile(
                    leading: Icon(Icons.call_split),
                    title: Text(entity.name),
                    trailing: entity.name == _branch ? Icon(Icons.check) : null,
                    onTap: (){
                      Navigator.pop(context, [entity.name]);
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
          }),
    );
  }
}