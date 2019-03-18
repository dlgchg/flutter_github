import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../generated/i18n.dart';
import '../../res/res.dart';

/*
 * @Date: 2019-03-13 17:19 
 * @Description TODO
 */

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(color: containerColor),
          child: TextField(
            controller: _textEditingController,
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: containerColor,
              hintText: '关键字',
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                icon: Icon(Icons.highlight_off),
                onPressed: () {},
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.language), onPressed: () {}),
        ],
        bottom: TabBar(controller: _tabController, isScrollable: true, tabs: [
          Tab(
            child: Text('Repositories'),
          ),
          Tab(
            child: Text('Users'),
          ),
        ]),
      ),
      body: Container(),
    );
  }
}
