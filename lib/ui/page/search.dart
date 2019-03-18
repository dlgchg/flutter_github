import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../generated/i18n.dart';
import '../../res/res.dart';
import '../../top_config.dart';

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
    List<String> sort = [
      S.of(context).stars,
      S.of(context).forks,
      S.of(context).updates,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: dimen40,
          padding: EdgeInsets.only(left: dimen15, right: dimen10),
          alignment: AlignmentDirectional.centerStart,
          decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(dimen3)),
          child: TextFormField(
            controller: _textEditingController,
            decoration: InputDecoration.collapsed(
              hintText: '关键字',
            ),
          ),
        ),
        leading: IconButton(icon: Icon(Icons.language), onPressed: () {}, tooltip: S.of(context).languages,),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.arrow_downward), onPressed: () {}, tooltip: S.of(context).order,),
          PopupMenuButton(
            itemBuilder: (context) {
              return sort.map((s) {
                return CheckedPopupMenuItem(
                  checked: s == gitHubProvide.sort,
                  value: s,
                  child: Text(s),
                );
              }).toList();
            },
            icon: Icon(Icons.view_week),
            onSelected: (s) {
              gitHubProvide.sort = s;
              setState(() {});
            },
            tooltip: S.of(context).sort,
          ),
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
