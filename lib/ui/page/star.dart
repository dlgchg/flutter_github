import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../generated/i18n.dart';
import '../../top_config.dart';
import 'package:dio/dio.dart';
import '../../model/model.dart';
import '../widget/widget.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
 * @Date: 2019-03-13 17:19 
 * @Description TODO
 */

class StarPage extends StatefulWidget {
  @override
  _StarPageState createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> with AutomaticKeepAliveClientMixin{
  List<Map> list = [];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    gitHubProvide.page = 0;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).bottomNavigationBarTitle2),
      ),
      body: FutureBuilder(
        future: gitHubProvide.getStar(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Response response = snapshot.data;
            list = (response.data as List).cast();
            return EasyRefresh(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  StarEntity starEntity = StarEntity.fromJson(list[index]);
                  return starItem(context, starEntity);
                },
                itemCount: list.length,
              ),
              onRefresh: () {
                gitHubProvide.page = 0;
                _loadData();
              },
              loadMore: () {
                gitHubProvide.page++;
                _loadData();
              },
              refreshHeader: MaterialHeader(key: headerKey),
              refreshFooter: MaterialFooter(key: footerKey),
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

  _loadData() async {
    await gitHubProvide.getStar().then((data) {
      Response response = data;
      List<Map> cast = (response.data as List).cast();
      setState(() {
        list.addAll(cast);
      });
    });
  }
}
