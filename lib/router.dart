import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_networking/main.dart';
import 'package:flutter_networking/view_controllers/red_vc/red_detail_vc/red_detail_vc.dart';

class RoutersKey {
  final String redDetail = 'red_detail';
  final String homeRoute = '/';
}

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage(title: 'Flutter Networking'));
      case 'red_detail':
        return MaterialPageRoute(builder: (_) => RedDetailViewController());
      default:
        return MaterialPageRoute(builder: (_) => MyApp());
    }
  }
}