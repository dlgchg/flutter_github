import 'package:flutter/material.dart';
import 'ui/page/home.dart';
import 'provide/github_provide.dart';
import 'provide/home_provide.dart';
import 'package:provide/provide.dart';
import 'generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'ui/page/login.dart';
import 'res/res.dart';

void main() {
  var github = GitHubProvide();
  var home = HomeProvide();
  var providers = Providers();
  providers
    ..provide(Provider<GitHubProvide>.value(github))
    ..provide(Provider<HomeProvide>.value(home));

  runApp(
    ProviderNode(
      child: MyApp(),
      providers: providers,
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GitHub',
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData.light().copyWith(
        primaryColor: primaryColor,
      ),
      home: LoginPage(),
    );
  }
}
