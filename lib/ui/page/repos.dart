import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provide/provide.dart';
import '../../top_config.dart';
import '../../model/model.dart';
import '../../generated/i18n.dart';

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

  @override
  void initState() {
    super.initState();

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
        title: Text(userRepos.name),
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
        itemBuilder: (context, index) {
          return Container();
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
