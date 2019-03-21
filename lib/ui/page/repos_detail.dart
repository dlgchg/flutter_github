import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../res/res.dart';
import '../../model/model.dart';
import '../../top_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provide/provide.dart';
import '../../provide/provide.dart';
import 'package:url_launcher/url_launcher.dart';
import 'page.dart';

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

  String _branch = 'master';

  @override
  void initState() {
    super.initState();
    gitHubProvide.setTopBgHeight(0);
    _scrollController.addListener(() {
      gitHubProvide.setTopBgHeight((_scrollController.position.pixels < 0
              ? _scrollController.position.pixels
              : 1)
          .abs()
          .toDouble());
    });

    gitHubProvide.stared(0).listen((data) {
      Response response = data;
      if (response.statusCode == 204) {
        gitHubProvide.setReposStared(true);
      }
    });
    gitHubProvide.watched(0).listen((data) {
      Response response = data;
      if (response.statusCode == 204) {
        gitHubProvide.setReposWatched(true);
      }
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
                          _header(entity),
                          _child(entity),
                          _child2(entity),
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

  _header(ReposEntity entity) {
    return Container(
      padding: EdgeInsets.only(left: dimen15, top: dimen5, right: dimen15),
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
            entity.description ?? 'It is never too old to learn. ',
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
                        InkWell(
                          child: Provide<GitHubProvide>(
                            builder: (context, child, provide) {
                              return Icon(provide.reposWatched
                                  ? Icons.visibility
                                  : Icons.visibility_off);
                            },
                          ),
                          onTap: () {
                            gitHubProvide
                                .watched(gitHubProvide.reposWatched ? 2 : 1)
                                .listen((data) {
                              Response response = data;
                              if (response.statusCode == 204) {
                                gitHubProvide.setReposWatched(gitHubProvide.reposWatched ? false : true);
                              }
                            });
                          },
                        ),
                        SizedBox(
                          height: dimen10,
                        ),
                        Text(entity.watchers.toString())
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            gitHubProvide
                                .stared(gitHubProvide.reposStared ? 2 : 1)
                                .listen((data) {
                              Response response = data;
                              if (response.statusCode == 204) {
                                gitHubProvide.setReposStared(gitHubProvide.reposStared ? false : true);
                              }
                            });
                            ;
                          },
                          child: Provide<GitHubProvide>(
                            builder: (context, child, provide) {
                              return Icon(provide.reposStared
                                  ? Icons.star
                                  : Icons.star_border);
                            },
                          ),
                        ),
                        SizedBox(
                          height: dimen10,
                        ),
                        Text(entity.stargazersCount.toString())
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _child(ReposEntity entity) {
    return Container(
      padding: EdgeInsets.only(left: dimen15, top: dimen5, right: dimen15),
      child: Card(
        child: Container(
          child: Column(
            children: <Widget>[
              _item(
                Icons.language,
                'Language',
                entity.language,
              ),
              InkWell(
                child: _item(
                  Icons.code,
                  'Vide Code',
                  entity.size.toString(),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return TreesPage(
                            '${entity.treesUrl.replaceAll('{/sha}', '')}/$_branch',
                            entity.name,
                            '',
                            entity.fullName,
                            _branch);
                      },
                    ),
                  );
                },
              ),
              InkWell(
                child: _item(
                  Icons.call_split,
                  'Branch',
                  entity.defaultBranch,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return BranchPage(
                          '${entity.branchesUrl.replaceAll('{/branch}', '')}',
                          _branch,
                        );
                      },
                    ),
                  ).then((value) {
                    _branch = value[0] ?? 'master';
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _child2(ReposEntity entity) {
    return Container(
      padding: EdgeInsets.only(left: dimen15, top: dimen5, right: dimen15),
      child: Card(
        child: Column(
          children: <Widget>[
            _item(
              Icons.error,
              'Issues',
              entity.openIssuesCount.toString(),
            ),
            _item(
              Icons.chrome_reader_mode,
              'README',
              '',
            ),
          ],
        ),
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
              remark ?? '',
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
                  onTapLink: (url) {
                    launch(url);
                  },
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
