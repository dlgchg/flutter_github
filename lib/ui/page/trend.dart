import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../generated/i18n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../top_config.dart';
import '../../model/model.dart';
import 'package:dio/dio.dart';
import '../widget/widget.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../delegate/delegate.dart';

/*
 * @Date: 2019-03-13 17:19 
 * @Description TODO
 */

class TrendPage extends StatefulWidget {
  @override
  _TrendPageState createState() => _TrendPageState();
}

class _TrendPageState extends State<TrendPage> {

  List<Map> list = [];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    List<String> since = [
      S.of(context).daily,
      S.of(context).weekly,
      S.of(context).monthly
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).bottomNavigationBarTitle1),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.language), onPressed: () {
            showSearch(context: context, delegate: SearchLanguagesDelegate(0)).then((data) {
              if(data != null) {
                setState(() {});
              }
            });
          }),
          PopupMenuButton(
            itemBuilder: (context) {
              return since.map((s) {
                return CheckedPopupMenuItem(
                  checked: s == gitHubProvide.since,
                  value: s,
                  child: Text(s),
                );
              }).toList();
            },
            icon: Icon(Icons.view_week),
            onSelected: (s) {
              gitHubProvide.since = s;
              setState(() {});
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: gitHubProvide.getTrend(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Response response = snapshot.data;
            list = (response.data as List).cast();
            return EasyRefresh(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  TrendEntity trendEntity = TrendEntity.fromJson(list[index]);
                  return trendItem(context, trendEntity, index);
                },
                itemCount: list.length,
              ),
              onRefresh: () async {
                await _load();
              },
              refreshHeader: MaterialHeader(key: headerKey),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  _load() {
    gitHubProvide.getTrend().then((data) {
      Response response = data;
      List<Map> cast = (response.data as List).cast();
      setState(() {
        list.addAll(cast);
      });
    });
  }
}

/*
* Provide<GitHubProvide>(builder: (context, child, provide) {
          return Text('${provide.language.isEmpty ? S.of(context).all : provide.language} | ${provide.since}');
        })
* */
