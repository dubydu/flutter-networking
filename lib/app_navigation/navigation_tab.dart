import 'package:flutter/material.dart';
import 'package:flutter_networking/app_define/app_enum.dart';
import 'package:flutter_networking/app_navigation/navigation_bottom.dart';
import 'package:flutter_networking/view_controllers/red_vc/red_vc.dart';
import 'package:flutter_networking/view_controllers/blue_vc/blue_vc.dart';
import 'package:flutter_networking/view_controllers/green_vc/green_vc.dart';

class NavigationRouter {
  static const String root = '/';
  static const String red = '/red';
  static const String blue = '/blue';
  static const String green = '/green';
}

class NavigationTab extends StatelessWidget {

  NavigationTab({this.tabItem});
  final TabItem tabItem;

  void _push(BuildContext context, TabItem tabItem) {
  }

  Widget _routeBuilder(BuildContext context, TabItem tabItem) {
    switch (tabItem.index) {
      case 0:
        return RedReviewController();
      case 1:
        return GreenReviewController();
      case 2:
        return BlueReviewController();
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilder(context, tabItem);
    return Navigator(
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => routeBuilders,
        );
      },
    );
  }
}