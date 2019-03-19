import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../common/common.dart';
import 'package:provide/provide.dart';
import '../../provide/provide.dart';
import '../../model/model.dart';
import '../../res/res.dart';
import '../../util/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

export 'login_widget.dart';

Widget bottomNavigationBar(BuildContext context) {
  return Provide<HomeProvide>(builder: (context, child, homeProvide) {
    return BottomNavigationBar(
      items: bottomNavigationBarItemData(context).map((data) {
        return BottomNavigationBarItem(icon: data[0], title: Text(data[1]));
      }).toList(),
      currentIndex: homeProvide.bottomCurrentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (position) {
        homeProvide.currentIndex(position);
      },
    );
  });
}

Widget starItem(BuildContext context, StarEntity starEntity) {
  return Column(
    children: <Widget>[
      Container(
        alignment: AlignmentDirectional.topStart,
        padding: EdgeInsets.all(dimen10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: dimen30,
                  height: dimen30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(dimen5),
                    color: containerColor,
                  ),
                ),
                Container(
                  width: dimen30,
                  height: dimen30,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(dimen5),
                    image: DecorationImage(
                      image: NetworkImage(starEntity.owner.avatarUrl),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: dimen10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  starEntity.fullName,
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: dimen15,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: dimen5),
                  width: ScreenUtil.getInstance().setWidth(900),
                  child: Text(
                    starEntity.description ?? 'It is never too old to learn. ',
                    softWrap: true,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      Divider(),
    ],
  );
}

Widget trendItem(BuildContext context, TrendEntity trendEntity) {
  return Column(
    children: <Widget>[
      Container(
        alignment: AlignmentDirectional.topStart,
        padding: EdgeInsets.all(dimen10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: dimen30,
                  height: dimen30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(dimen5),
                    color: containerColor,
                  ),
                ),
                Container(
                  width: dimen30,
                  height: dimen30,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(dimen5),
                    image: DecorationImage(
                      image: NetworkImage(trendEntity.builtby[0].avatar),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: dimen10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(900),
                  child: Text(
                    '${trendEntity.author}/${trendEntity.name}',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: dimen15,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: dimen5),
                  width: ScreenUtil.getInstance().setWidth(900),
                  child: Text(
                    trendEntity.description,
                    softWrap: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: dimen10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: dimen10,
                        height: dimen10,
                        decoration: BoxDecoration(
                          color: colorRGB(trendEntity.languagecolor),
                          borderRadius: BorderRadius.circular(dimen10),
                        ),
                      ),
                      SizedBox(width: dimen3,),
                      Text(trendEntity.language ?? 'Unknown', style: TextStyle(fontSize: dimen12,),),
                      SizedBox(width: dimen10,),
                      Icon(Icons.star, color: primaryColor, size: dimen15,),
                      SizedBox(width: dimen3,),
                      Text(trendEntity.stars.toString(), style: TextStyle(fontSize: dimen12,),),
                      SizedBox(width: dimen10,),
                      Icon(Icons.call_merge, color: primaryColor, size: dimen15,),
                      SizedBox(width: dimen3,),
                      Text(trendEntity.forks.toString(), style: TextStyle(fontSize: dimen12,),),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      Divider(),
    ],
  );
}

Widget searchReposItem(BuildContext context, SearchReposItem item) {
  return Column(
    children: <Widget>[
      Container(
        alignment: AlignmentDirectional.topStart,
        padding: EdgeInsets.all(dimen10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: dimen30,
                  height: dimen30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(dimen5),
                    color: containerColor,
                  ),
                ),
                Container(
                  width: dimen30,
                  height: dimen30,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(dimen5),
                    image: DecorationImage(
                      image: NetworkImage(item.owner.avatarUrl),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: dimen10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(900),
                  child: Text(
                    item.fullName,
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: dimen15,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: dimen5),
                  width: ScreenUtil.getInstance().setWidth(900),
                  child: Text(
                    item.description ?? '',
                    softWrap: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: dimen10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: dimen10,
                        height: dimen10,
                        decoration: BoxDecoration(
                          color: colorRGB(null),
                          borderRadius: BorderRadius.circular(dimen10),
                        ),
                      ),
                      SizedBox(width: dimen3,),
                      Text(item.language ?? 'Unknown', style: TextStyle(fontSize: dimen12,),),
                      SizedBox(width: dimen10,),
                      Icon(Icons.star, color: primaryColor, size: dimen15,),
                      SizedBox(width: dimen3,),
                      Text(item.stargazersCount.toString(), style: TextStyle(fontSize: dimen12,),),
                      SizedBox(width: dimen10,),
                      Icon(Icons.call_merge, color: primaryColor, size: dimen15,),
                      SizedBox(width: dimen3,),
                      Text(item.forks.toString(), style: TextStyle(fontSize: dimen12,),),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      Divider(),
    ],
  );
}

Widget searchUsersItem(BuildContext context, SearchUserItem item) {
  return Column(
    children: <Widget>[
      Container(
        alignment: AlignmentDirectional.topStart,
        padding: EdgeInsets.all(dimen10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: dimen40,
                  height: dimen40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(dimen5),
                    color: containerColor,
                  ),
                ),
                Container(
                  width: dimen40,
                  height: dimen40,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(dimen5),
                    image: DecorationImage(
                      image: NetworkImage(item.avatarUrl),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: dimen10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(850),
                  child: Text(
                    item.login,
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: dimen15,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: dimen5),
                  width: ScreenUtil.getInstance().setWidth(850),
                  child: Text(
                    item.url,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      Divider(),
    ],
  );
}
