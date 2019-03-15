import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../top_config.dart';

/*
 * @Date: 2019-03-13 17:19 
 * @Description TODO
 */

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(gitHubProvide.userEntity.name),),
      body: Container(),
    );
  }
}

