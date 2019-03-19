import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../res/res.dart';
import '../../model/model.dart';
import '../../top_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provide/provide.dart';
import '../../provide/provide.dart';

/*
 * @Date: 2019-03-19 14:49 
 * @Description TODO
 */

class ReposDetailPage extends StatefulWidget {
  @override
  _ReposDetailPageState createState() => _ReposDetailPageState();
}

class _ReposDetailPageState extends State<ReposDetailPage> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    gitHubProvide.setTopBgHeight(0);
    _scrollController.addListener(() {
      print(_scrollController.position.pixels.toString());
      gitHubProvide.setTopBgHeight((_scrollController.position.pixels < 0 ? _scrollController.position.pixels : 1).abs().toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          print(snapshot.data.toString());
          if (snapshot.hasData) {
            Response response = snapshot.data;
            ReposEntity entity = ReposEntity.fromJson(response.data);
            return Stack(
              children: <Widget>[
                Provide<GitHubProvide>(builder: (context, child, provide) {
                  return Container(
                    height: dimen130 + provide.topBgHeight,
                    color: primaryColor,
                  );
                }),
                SafeArea(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                left: dimen15, top: dimen5, right: dimen15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  entity.fullName,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: containerColor,
                                    fontSize: dimen20,
                                  ),
                                ),
                                SizedBox(
                                  height: dimen10,
                                ),
                                Text(
                                  entity.description ??
                                      'It is never too old to learn. ',
                                  style: TextStyle(
                                    color: containerColor,
                                    fontSize: dimen14,
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                                SizedBox(
                                  height: dimen10,
                                ),
                                Card(
                                  color: containerColor,
                                  child: Container(
                                    alignment: AlignmentDirectional.center,
                                    height: dimen80,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Icon(Icons.remove_red_eye),
                                              SizedBox(
                                                height: dimen10,
                                              ),
                                              Text(entity.watchers.toString())
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Icon(Icons.star),
                                              SizedBox(
                                                height: dimen10,
                                              ),
                                              Text(entity.stargazersCount
                                                  .toString())
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Icon(Icons.call_merge),
                                              SizedBox(
                                                height: dimen10,
                                              ),
                                              Text(entity.forksCount.toString())
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                          ),
                                          flex: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: dimen15, top: dimen5, right: dimen15),
                            child: Card(
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    _item(Icons.language, 'Language',
                                        entity.language),
                                    _item(Icons.code, 'Vide Code',
                                        entity.size.toString()),
                                    _item(Icons.call_split, 'Branch',
                                        entity.defaultBranch),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: dimen15, top: dimen5, right: dimen15),
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  _item(Icons.error, 'Issues',
                                      entity.openIssuesCount.toString()),
                                  _item(Icons.chrome_reader_mode, 'README', ''),
                                ],
                              ),
                            ),
                          ),
                          _markdown(entity.defaultBranch),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: gitHubProvide.getRepos(),
      ),
    );
  }

  _item(IconData icon, String title, String remark) {
    return Container(
      padding: EdgeInsets.only(
          top: dimen15, left: dimen20, right: dimen20, bottom: dimen15),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: primaryColor,
            size: dimen20,
          ),
          SizedBox(
            width: dimen15,
          ),
          Text(
            title ?? "UnKnown",
            style: TextStyle(color: title == null ? Colors.grey : Colors.black),
          ),
          Expanded(
            child: Text(
              remark,
              textAlign: TextAlign.right,
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }

  _markdown(String branch) {
    return FutureBuilder(
      future: gitHubProvide.getReadme(branch),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding:
                EdgeInsets.only(left: dimen15, top: dimen5, right: dimen15),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(dimen12),
                child: MarkdownBody(
                  data: snapshot.data.toString(),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}