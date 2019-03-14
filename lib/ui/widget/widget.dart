import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../common/widget_common.dart';
import '../../provide/home_provide.dart';
import 'package:provide/provide.dart';
import '../../generated/i18n.dart';
import '../../res/res.dart';
import '../page/home.dart';

/*
 * @Date: 2019-03-13 16:12 
 * @Description 不常用的widget
 */

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

Widget loginContainer(BuildContext context) {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: dimen80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            S.of(context).appName,
            style: TextStyle(
              color: Colors.white,
              fontSize: loginTextSize,
            ),
          ),
          SizedBox(
            height: dimen50,
          ),
          Container(
            padding: EdgeInsets.all(dimen15),
            decoration: BoxDecoration(
              color: loginContainerColor,
              borderRadius: BorderRadius.all(Radius.circular(dimen10)),
            ),
            height: loginContainerHeight,
            width: loginContainerWidth,
            alignment: AlignmentDirectional.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: TextEditingController(),
                  autofocus: true,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: S.of(context).userName,
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  height: dimen10,
                ),
                TextField(
                  controller: TextEditingController(),
                  obscureText: true,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: S.of(context).passWord,
                    prefixIcon: Icon(Icons.https),
                  ),
                ),
                SizedBox(
                  height: dimen40,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  },
                  padding: EdgeInsets.all(0),
                  textColor: loginButtonTextColor,
                  child: Container(
                    height: dimen40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: loginColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(dimen2)),
                    ),
                    width: loginButtonWidth,
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      S.of(context).login,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
