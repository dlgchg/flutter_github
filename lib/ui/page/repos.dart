import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../top_config.dart';
import '../../model/model.dart';
import '../../generated/i18n.dart';
import 'package:dio/dio.dart';
import '../widget/widget.dart';

/*
 * @TIME 2019-03-17 17:03
 * @DES  TODO
 */

class ReposPage extends StatefulWidget {
  @override
  _ReposPageState createState() => _ReposPageState();
}

class _ReposPageState extends State<ReposPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController = PageController(initialPage: 0);
  bool isPageCanChanged = true;
  UserReposEntity _userReposEntity;
  List _urls = [];
  String _url;

  @override
  void initState() {
    super.initState();
    _userReposEntity = gitHubProvide.userReposEntity;
    _urls = [
      _userReposEntity.reposUrl,
      _userReposEntity.starredUrl,
      _userReposEntity.followersUrl,
      _userReposEntity.followingUrl,
      _userReposEntity.subscriptionsUrl,
    ];
    _url = _urls[0];
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _onPageChange(_tabController.index, p: _pageController);
      }
    });
  }

  _onPageChange(int index, {PageController p}) async {
    if (p == null) {
      _tabController.animateTo(index);
    } else {
      isPageCanChanged = false;
      await _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      );
      isPageCanChanged = true;
    }
    print(_urls[index]);

    setState(() {
      if (index == 1) {
        _url = _urls[index].toString().replaceAll('{/owner}{/repo}', '');
      } else if (index == 3) {
        _url = _urls[index].toString().replaceAll('{/other_user}', '');
      } else {
        _url = _urls[index];
      }
    });
  }

  UserReposEntity userRepos = gitHubProvide.userReposEntity;

  @override
  Widget build(BuildContext context) {
    List _tabs = [
      S.of(context).repositories,
      S.of(context).stars,
      S.of(context).followers,
      S.of(context).following,
      S.of(context).watches,
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(userRepos.name ?? userRepos.login),
        bottom: TabBar(
          isScrollable: true,
          tabs: _tabs.map((title) {
            return Tab(
              text: title,
            );
          }).toList(),
          controller: _tabController,
        ),
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return FutureBuilder(
            future: gitHubProvide.url(_url),
            builder: (context, snap) {
              if (snap.hasData) {
                Response response = snap.data;
                List<Map> list = (response.data as List).cast();
                return ListView.builder(
                  itemBuilder: (context, index) {
                    if (_tabController.index == 2 ||
                        _tabController.index == 3) {
                      ReposUserEntity item =
                          ReposUserEntity.fromJson(list[index]);
                      return reposUsersItem(context, item);
                    } else {
                      SearchReposItem item =
                          SearchReposItem.fromJson(list[index]);
                      return searchReposItem(context, item);
                    }
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
        },
        itemCount: _tabs.length,
        controller: _pageController,
        onPageChanged: (index) {
          if (isPageCanChanged) {
            _onPageChange(index);
          }
        },
      ),
    );
  }
}
