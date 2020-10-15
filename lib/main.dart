import 'package:flutter/material.dart';
import 'package:flutter_networking/app_define/app_enum.dart';
import 'package:flutter_networking/app_navigation/navigation_bottom.dart';
import 'package:flutter_networking/app_navigation/navigation_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Networking'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TabItem _currentTab = TabItem.red;

  void _selectedTab(TabItem tabItem) {
    if (tabItem == _currentTab) {

    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBottom(
        currentTab: _currentTab,
        onSelectTab: _selectedTab,
      ),
      body: Stack(children: [
        _buildOffstageNavigator(TabItem.red),
        _buildOffstageNavigator(TabItem.green),
        _buildOffstageNavigator(TabItem.blue)
      ],
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: NavigationTab(
        tabItem: tabItem,
      ),
    );
  }
}
